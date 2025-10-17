// Lua block balance validator using segmentation and stack-based counting
function isIdentStart(c) {
  return (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || c === '_';
}
function isIdentPart(c) {
  return isIdentStart(c) || (c >= '0' && c <= '9');
}

function matchLongOpen(code, idx) {
  const len = code.length;
  if (idx >= len || code[idx] !== '[') return { matched: false };
  let k = idx + 1;
  let eq = 0;
  while (k < len && code[k] === '=') { eq++; k++; }
  if (k < len && code[k] === '[') {
    return { matched: true, eqCount: eq, openLength: (k - idx + 1) };
  }
  return { matched: false };
}
function findLongClose(code, startIdx, eqCount) {
  const len = code.length;
  let i = startIdx;
  while (i < len) {
    if (code[i] === ']') {
      let k = i + 1;
      let seen = 0;
      while (k < len && seen < eqCount && code[k] === '=') { seen++; k++; }
      if (seen === eqCount && k < len && code[k] === ']') {
        return i; // index of first ']'
      }
    }
    i++;
  }
  return len - 1; // tolerant
}
function scanShortString(code, startIdx, quote) {
  const len = code.length;
  let i = startIdx + 1;
  while (i < len) {
    const ch = code[i];
    if (ch === '\\') { i += 2; continue; }
    if (ch === quote) return i;
    i++;
  }
  return len - 1;
}

function segmentize(code) {
  const segs = [];
  const len = code.length;
  let i = 0;
  while (i < len) {
    const start = i;
    const ch = code[i];
    const n1 = code[i+1];

    // comments
    if (ch === '-' && n1 === '-') {
      // block comment --[=*[ ... ]=*]
      if (i + 2 < len && code[i+2] === '[') {
        const openInfo = matchLongOpen(code, i + 2);
        if (openInfo.matched) {
          const contentStart = i + 2 + openInfo.openLength;
          const closeIdx = findLongClose(code, contentStart, openInfo.eqCount);
          const closeLen = 2 + openInfo.eqCount;
          const content = code.slice(i, closeIdx + closeLen);
          segs.push({ type: 'block_comment', content, start, end: closeIdx + closeLen });
          i = closeIdx + closeLen;
          continue;
        }
      }
      // line comment
      let j = i + 2;
      while (j < len && code[j] !== '\n') j++;
      const lc = (j < len && code[j] === '\n') ? code.slice(i, j + 1) : code.slice(i, j);
      segs.push({ type: 'line_comment', content: lc, start, end: (j < len && code[j] === '\n') ? (j + 1) : j });
      i = (j < len && code[j] === '\n') ? (j + 1) : j;
      continue;
    }

    // short string
    if (ch === '"' || ch === '\'') {
      const endIdx = scanShortString(code, i, ch);
      segs.push({ type: 'short_string', content: code.slice(i, endIdx + 1), start, end: endIdx + 1 });
      i = endIdx + 1;
      continue;
    }

    // long string [=*[ ... ]=*]
    if (ch === '[') {
      const openInfo = matchLongOpen(code, i);
      if (openInfo.matched) {
        const contentStart = i + openInfo.openLength;
        const closeIdx = findLongClose(code, contentStart, openInfo.eqCount);
        const closeLen = 2 + openInfo.eqCount;
        const content = code.slice(i, closeIdx + closeLen);
        segs.push({ type: 'long_string', content, start, end: closeIdx + closeLen });
        i = closeIdx + closeLen;
        continue;
      }
    }

    // code chunk until next special start
    let j = i;
    while (j < len) {
      const c = code[j];
      const n = code[j+1];
      if ((c === '-' && n === '-') || c === '"' || c === '\'' || c === '[') break;
      j++;
    }
    if (j > i) {
      segs.push({ type: 'code', content: code.slice(i, j), start, end: j });
      i = j;
    } else {
      segs.push({ type: 'code', content: code[i], start, end: i + 1 });
      i++;
    }
  }
  return segs;
}

function prevWord(str, idx) {
  let k = idx - 1;
  // skip whitespace
  while (k >= 0 && /\s/.test(str[k])) k--;
  // skip non-identifier run
  if (k < 0 || !isIdentPart(str[k])) return null;
  let end = k + 1;
  while (k >= 0 && isIdentPart(str[k])) k--;
  const start = k + 1;
  return str.slice(start, end);
}

function validateLuaBalance(code) {
  // Segment code to skip strings/comments reliably
  const segs = segmentize(code);
  let opensEnd = 0;
  let closesEnd = 0;
  let opensRepeat = 0;
  let closesUntil = 0;

  // Collect debug contexts
  const debug = {
    functionTokens: [],
    doTokens: [],
    whileTokens: [],
    forTokens: [],
    ifTokens: [],
    endTokens: [],
    repeatTokens: [],
    untilTokens: []
  };

  for (const seg of segs) {
    if (seg.type !== 'code') continue;
    const s = seg.content;
    let i = 0;
    const n = s.length;
    while (i < n) {
      const ch = s[i];
      if (isIdentStart(ch)) {
        let j = i + 1;
        while (j < n && isIdentPart(s[j])) j++;
        const ident = s.slice(i, j);
        const globalPos = seg.start + i;
        const ctxStart = Math.max(0, globalPos - 40);
        const ctxEnd = Math.min(code.length, globalPos + 40);
        const ctx = code.slice(ctxStart, ctxEnd);
        if (ident === 'function') { opensEnd++; debug.functionTokens.push({ pos: globalPos, ctx }); }
        else if (ident === 'do') {
          const pw = prevWord(s, i);
          // do after for/while is not a separate opener
          if (pw !== 'for' && pw !== 'while') {
            opensEnd++; debug.doTokens.push({ pos: globalPos, ctx });
          } else {
            debug.doTokens.push({ pos: globalPos, ctx });
          }
        }
        else if (ident === 'while') { opensEnd++; debug.whileTokens.push({ pos: globalPos, ctx }); }
        else if (ident === 'for') { opensEnd++; debug.forTokens.push({ pos: globalPos, ctx }); }
        else if (ident === 'if') { opensEnd++; debug.ifTokens.push({ pos: globalPos, ctx }); }
        else if (ident === 'end') { closesEnd++; debug.endTokens.push({ pos: globalPos, ctx }); }
        else if (ident === 'repeat') { opensRepeat++; debug.repeatTokens.push({ pos: globalPos, ctx }); }
        else if (ident === 'until') { closesUntil++; debug.untilTokens.push({ pos: globalPos, ctx }); }
        i = j;
      } else {
        i++;
      }
    }
  }

  const balancedEnd = opensEnd === closesEnd;
  const balancedRepeat = opensRepeat === closesUntil;
  const summary = {
    opensEnd, closesEnd, opensRepeat, closesUntil,
    balancedEnd, balancedRepeat,
    summaryString: `end-open=${opensEnd}, end-close=${closesEnd}, repeat-open=${opensRepeat}, until-close=${closesUntil}`,
    details: {
      functionTokens: debug.functionTokens.slice(0, 50),
      doTokens: debug.doTokens.slice(0, 50),
      whileTokens: debug.whileTokens.slice(0, 50),
      forTokens: debug.forTokens.slice(0, 50),
      ifTokens: debug.ifTokens.slice(0, 50),
      endTokens: debug.endTokens.slice(0, 50),
      repeatTokens: debug.repeatTokens.slice(0, 50),
      untilTokens: debug.untilTokens.slice(0, 50)
    }
  };
  return summary;
}

module.exports = { validateLuaBalance };