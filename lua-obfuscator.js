/*
 * ██╗     ██╗   ██╗ █████╗  ██████╗ ██████╗ ███████╗███╗   ██╗ ██████╗
 * ██║     ██║   ██║██╔══██╗██╔═══██╗██╔══██╗██╔════╝████╗  ██║██╔════╝
 * ██║     ██║   ██║███████║██║   ██║██████╔╝█████╗  ██╔██╗ ██║██║     
 * ██║     ██║   ██║██╔══██║██║   ██║██╔══██╗██╔══╝  ██║╚██╗██║██║     
 * ███████╗╚██████╔╝██║  ██║╚██████╔╝██████╔╝███████╗██║ ╚████║╚██████╗
 * ╚══════╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝
 * 
 * Lua 代码混淆器（令牌安全模式）
 * 项目地址：https://github.com/Ajwyunsx/mdui-luaenc
 * 目标：确保混淆后的 Lua 代码语法与语义可执行
 */
(function(global){
  class LuaObfuscator {
    constructor(options = {}) {
      const isBrowser = typeof window !== 'undefined';
      this.options = {
        safeMode: options.safeMode !== false,
        stringEncrypt: options.stringEncrypt !== false,
        stringEncryptLong: options.stringEncryptLong !== undefined ? !!options.stringEncryptLong : !!isBrowser,
        numberEncrypt: options.numberEncrypt !== undefined ? !!options.numberEncrypt : !!isBrowser,
        booleanObfuscate: options.booleanObfuscate !== undefined ? !!options.booleanObfuscate : true,
        nilObfuscate: options.nilObfuscate !== undefined ? !!options.nilObfuscate : true,
        oneLine: !!options.oneLine,
        luaVersion: options.luaVersion || '5.3',
        functionNameObfuscate: options.functionNameObfuscate !== undefined ? !!options.functionNameObfuscate : !!isBrowser,
        aggressive: options.aggressive !== undefined ? !!options.aggressive : !!isBrowser,
        // 新增支持：强度相关选项（默认关闭，按UI传入）
        controlFlow: !!options.controlFlow,
        codeLogic: !!options.codeLogic,
        globalVar: !!options.globalVar,
        tableEncrypt: !!options.tableEncrypt,
        gotoObfuscate: !!options.gotoObfuscate,
        junkCode: !!options.junkCode,
        codeSplitReorganize: !!options.codeSplitReorganize,
        antiDebug: !!options.antiDebug,
        localVar: !!options.localVar
      };
    }

    obfuscate(code) {
      const segments = this.segmentize(code);
      const outParts = [];

      for (const seg of segments) {
        switch (seg.type) {
          case 'short_string': {
            if (this.options.stringEncrypt) {
              const inner = seg.content.slice(1, -1);
              const encoded = this.encodeStringToChar(inner);
              this.insertBoundarySafe(outParts, encoded);
            } else {
              this.insertBoundarySafe(outParts, seg.content);
            }
            break;
          }
          case 'long_string': {
            if (this.options.stringEncryptLong) {
              const inner = seg.content.slice(seg.meta.open.length, seg.content.length - seg.meta.close.length);
              const encoded = this.encodeStringToChar(inner);
              this.insertBoundarySafe(outParts, encoded);
            } else {
              this.insertBoundarySafe(outParts, seg.content);
            }
            break;
          }
          case 'line_comment':
          case 'block_comment': {
            // 直接跳过注释，不添加到输出中
            break;
          }
          case 'code': {
            let chunk = seg.content;
            if (this.options.booleanObfuscate) {
              if (this.options.aggressive) {
                chunk = chunk.replace(/\btrue\b/g, '(1 <= 1 and not false)').replace(/\bfalse\b/g, '(not true)');
              } else {
                chunk = chunk.replace(/\btrue\b/g, '(not false)').replace(/\bfalse\b/g, '(not true)');
              }
            }
            if (this.options.nilObfuscate) {
              if (this.options.aggressive) {
                chunk = chunk.replace(/\bnil\b/g, '((function() return nil end)())');
              } else {
                chunk = chunk.replace(/\bnil\b/g, '(nil)');
              }
            }
            if (this.options.numberEncrypt) {
              chunk = chunk.replace(/(?<!\.)\b\d+\b(?!\.\d)/g, (m) => {
                const n = parseInt(m, 10);
                switch (n % 3) {
                  case 0: return `(${m} + 0)`;
                  case 1: return `(${m} - 0)`;
                  default: return `((${m}))`;
                }
              });
            }
            // 新增：全局索引与表键加密
            if (this.options.globalVar) {
              chunk = this.obfuscateGlobalIndexing(chunk);
            }
            if (this.options.tableEncrypt) {
              chunk = this.obfuscateTableStringKeys(chunk);
            }
            chunk = this.ensureSafeSpacing(chunk);
            if (this.options.oneLine) {
              chunk = chunk.split('\n').map(s => s.trim()).join(' ');
              chunk = this.ensureSafeSpacing(chunk);
            }
            outParts.push(chunk);
            break;
          }
        }
      }
      let out = outParts.join('');
      // 新增：根据强度注入控制流、反调试与花指令
      // 注意：别名注入应该在最前面，然后是其他注入
      out = this.injectAliasesIfNeeded(out);
      out = this.injectJunkIfNeeded(out);
      out = this.injectAntiDebugIfNeeded(out);
      out = this.injectControlFlowIfNeeded(out);
      
      // 添加项目地址注释到混淆后的代码顶部
      const projectHeader = `--[[
██╗     ██╗   ██╗ █████╗  ██████╗ ██████╗ ███████╗███╗   ██╗ ██████╗
██║     ██║   ██║██╔══██╗██╔═══██╗██╔══██╗██╔════╝████╗  ██║██╔════╝
██║     ██║   ██║███████║██║   ██║██████╔╝█████╗  ██╔██╗ ██║██║     
██║     ██║   ██║██╔══██║██║   ██║██╔══██╗██╔══╝  ██║╚██╗██║██║     
███████╗╚██████╔╝██║  ██║╚██████╔╝██████╔╝███████╗██║ ╚████║╚██████╗
╚══════╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝

LuaObEnc - Lua Code Obfuscator
Project: https://github.com/Ajwyunsx/mdui-luaenc
Generated by LuaObEnc - Professional Lua Code Obfuscation Tool
--]]

`;
      out = projectHeader + out;
      
      return out;
    }

    // 将普通字符串内容转换为 string.char 序列，对短字符串优化
    encodeStringToChar(inner) {
      // 对于短字符串（长度<=3），直接使用引号包围，减少复杂度
      if (inner.length <= 3 && !/['"\\]/.test(inner)) {
        return `"${inner}"`;
      }
      
      const bytes = [];
      for (let i = 0; i < inner.length; i++) {
        const ch = inner[i];
        if (ch === '\\' && i + 1 < inner.length) {
          const nxt = inner[i+1];
          i++;
          switch (nxt) {
            case 'n': bytes.push(10); break;
            case 'r': bytes.push(13); break;
            case 't': bytes.push(9); break;
            case 'v': bytes.push(11); break;
            case 'a': bytes.push(7); break;
            case 'b': bytes.push(8); break;
            case '\\': bytes.push(92); break;
            case '"': bytes.push(34); break;
            case "'": bytes.push(39); break;
            default:
              // 未知转义，按字面插入两个字符的后一位
              bytes.push(nxt.charCodeAt(0));
              break;
          }
        } else {
          bytes.push(ch.charCodeAt(0));
        }
      }
      if (bytes.length === 0) return '""';
      
      // 对于长字符串，分段处理以避免过长的表达式
      if (bytes.length > 20) {
        const chunks = [];
        for (let i = 0; i < bytes.length; i += 10) {
          const chunk = bytes.slice(i, i + 10);
          chunks.push(`string.char(${chunk.join(',')})`);
        }
        return `(${chunks.join(' .. ')})`;
      }
      
      return `(string.char(${bytes.join(',')}))`;
    }

    // 对代码段进行空格安全化，避免运算符粘连
    ensureSafeSpacing(code) {
      let s = code;
      // 先纠正被错误拆分的复合运算符
      s = s.replace(/<\s*=\s*/g, '<=');
      s = s.replace(/>\s*=\s*/g, '>=');
      s = s.replace(/~\s*=\s*/g, '~=');
      s = s.replace(/=\s*=\s*/g, '==');
      s = s.replace(/<\s*</g, '<<');
      s = s.replace(/>\s*>/g, '>>');
      // 再处理复合运算符，确保保持相邻不被拆分
      s = s.replace(/\s*(<=|>=|==|~=|<<|>>)\s*/g, ' $1 ');
      // 位运算符：避免将 '~=' 拆为 '~ ='
      s = s.replace(/\s*(~)(?!=)\s*/g, ' $1 ');
      s = s.replace(/\s*(&)\s*/g, ' $1 ');
      s = s.replace(/\s*(\|)\s*/g, ' $1 ');
      s = s.replace(/\s*(\^)\s*/g, ' $1 ');
      // 算术运算符
      s = s.replace(/\s*([+\-*/%])\s*/g, ' $1 ');
      // 关系运算符：避免把 '<=' 变成 '< =', 把 '>>' 变成 '> >'
      s = s.replace(/\s*(<)(?!=|<)\s*/g, ' $1 ');
      s = s.replace(/\s*(>)(?!=|>)\s*/g, ' $1 ');
      // 逗号与分号周围的空格
      s = s.replace(/\s*,\s*/g, ', ');
      s = s.replace(/\s*;\s*/g, '; ');
      // 特殊处理：确保end关键字后面跟其他关键字时有换行符
      s = s.replace(/\bend\s*(?=\b(local|function|if|for|while|repeat)\b)/g, 'end\n');
      // 收敛多余空格（保留换行，避免误成单行）
      s = s.replace(/[ \t]+/g, ' ');
      s = s.replace(/[ \t]*\n[ \t]*/g, '\n').trim();
      // 关键字基础空格修正 - 确保关键字前后有适当空格
      s = s.replace(/\b(if|then|elseif|else|end|local|function|return|for|while|do|repeat|until)\b/g, ' $1 ');
      return s;
    }

    insertBoundarySafe(outParts, nextChunk) {
      const prev = outParts.length ? outParts[outParts.length - 1] : '';
      const prevLast = prev ? prev[prev.length - 1] : '';
      const nextFirst = nextChunk ? nextChunk[0] : '';
      const isPrevWord = /[A-Za-z0-9_]/.test(prevLast);
      const isNextWord = /[A-Za-z_]/.test(nextFirst);
      const isNextStringChar = nextChunk && nextChunk.startsWith('(string.char(');
      
      // 特殊处理：如果前面是标识符，后面是string.char()调用，需要添加空格
      // 这样可以正确处理 print 'string' 这种语法
      if (isPrevWord && (isNextWord || isNextStringChar)) {
        outParts.push(' ' + nextChunk);
      } else {
        outParts.push(nextChunk);
      }
    }

    // 将源码切分为：代码、普通字符串、长字符串、行注释、块注释
    segmentize(code) {
      const segs = [];
      const len = code.length;
      let i = 0;
      while (i < len) {
        const ch = code[i];
        const n1 = code[i+1];

        // 注释：行/块
        if (ch === '-' && n1 === '-') {
          // 块注释 --[=*[ ... ]=*]
          if (i + 2 < len && code[i+2] === '[') {
            const openInfo = this.matchLongOpen(code, i + 2);
            if (openInfo.matched) {
              const contentStart = i + 2 + openInfo.openLength;
              const closeIdx = this.findLongClose(code, contentStart, openInfo.eqCount);
              const closeLen = 2 + openInfo.eqCount; // ]=*]
              const content = code.slice(i, closeIdx + closeLen);
              segs.push({ type: 'block_comment', content });
              i = closeIdx + closeLen;
              continue;
            }
          }
          // 行注释直到换行
          let j = i + 2;
          while (j < len && code[j] !== '\n') j++;
          const lc = (j < len && code[j] === '\n') ? code.slice(i, j + 1) : code.slice(i, j);
          segs.push({ type: 'line_comment', content: lc });
          i = (j < len && code[j] === '\n') ? (j + 1) : j;
          continue;
        }

        // 短字符串：'...' 或 "..."
        if (ch === '"' || ch === "'") {
          const endIdx = this.scanShortString(code, i, ch);
          segs.push({ type: 'short_string', content: code.slice(i, endIdx + 1) });
          i = endIdx + 1;
          continue;
        }

        // 长字符串：[=*[ ... ]=*]
        if (ch === '[') {
          const openInfo = this.matchLongOpen(code, i);
          if (openInfo.matched) {
            const contentStart = i + openInfo.openLength;
            const closeIdx = this.findLongClose(code, contentStart, openInfo.eqCount);
            const closeLen = 2 + openInfo.eqCount; // ]=*]
            const content = code.slice(i, closeIdx + closeLen);
            const openStr = code.slice(i, i + openInfo.openLength);
            const closeStr = code.slice(closeIdx, closeIdx + closeLen);
            segs.push({ type: 'long_string', content, meta: { open: openStr, close: closeStr } });
            i = closeIdx + closeLen;
            continue;
          }
        }

        // 代码片段，收集到下一个特殊起点
        let j = i;
        while (j < len) {
          const c = code[j];
          const n = code[j+1];
          if ((c === '-' && n === '-') || c === '"' || c === "'" || c === '[') break;
          j++;
        }
        if (j > i) {
          segs.push({ type: 'code', content: code.slice(i, j) });
          i = j;
        } else {
          // 单字符作为代码
          segs.push({ type: 'code', content: code[i] });
          i++;
        }
      }
      return segs;
    }

    // 检测长字符串/块注释的开头：[=*[ ...
    matchLongOpen(code, idx) {
      const len = code.length;
      if (idx >= len || code[idx] !== '[') return { matched: false };
      let k = idx + 1;
      let eq = 0;
      while (k < len && code[k] === '=') { eq++; k++; }
      if (k < len && code[k] === '[') {
        // 开头长度：'[' + '='*eq + '['
        return { matched: true, eqCount: eq, openLength: (k - idx + 1) };
      }
      return { matched: false };
    }

    // 查找长字符串/块注释的结尾位置，返回第一个 ']' 的索引
    findLongClose(code, startIdx, eqCount) {
      const len = code.length;
      let i = startIdx;
      while (i < len) {
        if (code[i] === ']') {
          let k = i + 1;
          let seen = 0;
          while (k < len && seen < eqCount && code[k] === '=') { seen++; k++; }
          if (seen === eqCount && k < len && code[k] === ']') {
            return i; // i 指向第一个 ']'
          }
        }
        i++;
      }
      // 若未找到，默认到末尾（保证不抛错）
      return len - 1;
    }

    // 扫描短字符串，处理转义直到遇到未转义的终止引号
    scanShortString(code, startIdx, quote) {
      const len = code.length;
      let i = startIdx + 1;
      while (i < len) {
        const ch = code[i];
        if (ch === '\\') { i += 2; continue; }
        if (ch === quote) return i;
        i++;
      }
      return len - 1; // 容错：未闭合则到文件末尾
    }

    // 新增：全局索引与表键加密、控制流/反调试/花指令注入方法
    obfuscateGlobalIndexing(code) {
      return code.replace(/\b_G\s*\.\s*([A-Za-z_][A-Za-z0-9_]*)/g, (m, name) => `_G[${this.encodeStringToChar(name)}]`);
    }

    obfuscateTableStringKeys(code) {
      return code.replace(/\[\s*(["'])((?:[^\\\1]|\\.)+)\1\s*\]/g, (m, q, key) => `[${this.encodeStringToChar(key)}]`);
    }

    injectControlFlowIfNeeded(code) {
      if (!this.options.controlFlow && !this.options.codeLogic) return code;
      // 简化控制流注入，减少嵌套复杂度
      let wrap = ' do local __ = 0; if true then ';
      let ender = ' end; end; ';
      // 不对控制流部分使用 ensureSafeSpacing，避免破坏分号
      let injected = wrap + code + ender;
      if (this.options.oneLine) {
        injected = injected.split('\n').map(s => s.trim()).join(' ');
      }
      return injected;
    }

    injectAntiDebugIfNeeded(code) {
      if (!this.options.antiDebug) return code;
      let s = ' local _anti = (function() local _ok,_dbg = pcall(function() return _G[string.char(100,101,98,117,103)] end); if _ok and _dbg then local _ = (_dbg.getinfo or function() end); end end)(); ';
      // 不对反调试部分使用 ensureSafeSpacing，避免破坏分号
      if (this.options.oneLine) {
        s = s.split('\n').map(si => si.trim()).join(' ');
      }
      return s + code;
    }

    injectJunkIfNeeded(code) {
      if (!this.options.junkCode) return code;
      // 简化花指令，减少复杂表达式
      let j = ' do local ___ = 1; if true then local ____ = 0; end end; ';
      // 不对花指令部分使用 ensureSafeSpacing，避免破坏分号
      if (this.options.oneLine) {
        j = j.split('\n').map(s => s.trim()).join(' ');
      }
      return j + code;
    }

    // 注入安全的内置别名，扩展到常用内置以提升可见混淆效果
    injectAliasesIfNeeded(code) {
      if (!this.options.functionNameObfuscate) return code;
      const names = ['print','ipairs','pairs','type','tonumber','tostring','next','select','require','string','table','math'];
      let alias = names.map(n => `local ${n} = (_G[${this.encodeStringToChar(n)}] or ${n})`).join('; ') + '; ';
      // 不对别名部分使用 ensureSafeSpacing，避免破坏分号
      if (this.options.oneLine) {
        alias = alias.split('\n').map(s => s.trim()).join(' ');
      }
      return alias + code;
    }
  }

  // 兼容浏览器与 Node
  if (typeof module !== 'undefined' && module.exports) {
    module.exports = LuaObfuscator;
  }
  global.LuaObfuscator = LuaObfuscator;
})(typeof window !== 'undefined' ? window : globalThis);
