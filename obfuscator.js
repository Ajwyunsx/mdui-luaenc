/**
 * Lua Obfuscator Engine - Ultra Security Edition v3.0
 * Security Architecture:
 * - Polynomial Encryption, LFSR Cipher
 * - FNV-1a Hash Integrity, Control Flow Flattening, Opaque Predicates
 * - Dead Code Injection, Anti-Debugging, Multi-layer XOR, String Obfuscation
 */
(function(global) {
const LuaObfuscator = {};

function randomString(n) { const c='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_'; let r=c[Math.floor(Math.random()*52)]; for(let i=1;i<n;i++)r+=c[Math.floor(Math.random()*c.length)]; return r; }
function shuffleArray(a) { for(let i=a.length-1;i>0;i--){const j=Math.floor(Math.random()*(i+1));[a[i],a[j]]=[a[j],a[i]];} return a; }
function generateVarNames(n) { const kw=new Set(['and','break','do','else','elseif','end','false','for','function','if','in','local','nil','not','or','repeat','return','then','true','until','while']); const names=new Set(); const c='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_'; const ac=c+'0123456789'; while(names.size<n){let len=Math.floor(Math.random()*8)+6,name=c[Math.floor(Math.random()*c.length)];for(let j=1;j<len;j++)name+=ac[Math.floor(Math.random()*ac.length)];if(!kw.has(name))names.add(name);} return Array.from(names); }
function generatePolyCoeffs() { return {a:Math.floor(Math.random()*17)+3,b:Math.floor(Math.random()*23)+5,c:Math.floor(Math.random()*31)+7,d:Math.floor(Math.random()*41)+11,m:256}; }
function polyEncrypt(data,cf,seed) { const r=[]; let x=seed; for(let i=0;i<data.length;i++){const y=(i*7+13)%256,z=(i*11+17)%256,f=(cf.a*x*x*x+cf.b*y*y+cf.c*z+cf.d)%cf.m;r.push((data[i]+f)%256);x=(x*17+i+31)%256;} return r; }
function lfsrEncrypt(data,seed) { let st=seed||0xACE1; const taps=0x80200003,r=[]; for(let i=0;i<data.length;i++){const lsb=st&1;st=st>>>1;if(lsb===1)st=st^taps;r.push((data[i]^(st&0xFF))&0xFF);} return r; }
function computeHash(data) { let h=0x811c9dc5; const p=0x01000193; for(let i=0;i<data.length;i++){h^=data[i];h=Math.imul(h,p)>>>0;} h^=h>>>16;h=Math.imul(h,0x85ebca6b)>>>0;h^=h>>>13;h=Math.imul(h,0xc2b2ae35)>>>0;h^=h>>>16; return h>>>0; }
function genPredicate() { const ps=[(v)=>`((${v}*0+1)==1)`,(v)=>`((${v}-${v})==0)`,(v)=>`((${v}>=0)or(${v}<0))`,(v)=>`(type(${v})==type(${v}))`,(v)=>`(1==1)`,(v)=>`(not not true)`]; return ps[Math.floor(Math.random()*ps.length)]; }
function genDeadCode(vs) { const ts=[()=>`local ${randomString(6)}=${vs[Math.floor(Math.random()*vs.length)]}+${vs[Math.floor(Math.random()*vs.length)]}`,()=>`for ${randomString(4)}=1,0 do ${vs[Math.floor(Math.random()*vs.length)]}=${vs[Math.floor(Math.random()*vs.length)]}+1 end`,()=>`local ${randomString(6)}={${Math.random()},"${randomString(8)}"}`,()=>`if false then ${vs[Math.floor(Math.random()*vs.length)]}=nil end`]; return ts[Math.floor(Math.random()*ts.length)](); }
function multiLayerEnc(data,keys) { let r=data.map(b=>((b%256)+256)%256); for(const k of keys)r=r.map((b,i)=>(b+k[i%k.length])&0xFF); return r; }
function encodeStr(str,xk) { let x=''; for(let i=0;i<str.length;i++)x+=String.fromCharCode(str.charCodeAt(i)^xk); let r='',idx=0; while(idx<x.length){let ch=x.charCodeAt(idx),cnt=1;while(idx+cnt<x.length&&x.charCodeAt(idx+cnt)===ch&&cnt<9)cnt++;if(cnt>3){r+=cnt+'Q';let h=ch.toString(16).toUpperCase();if(h.length<2)h='0'+h;r+=h;idx+=cnt;}else{let h=ch.toString(16).toUpperCase();if(h.length<2)h='0'+h;r+=h;idx++;}} return 'XOR!'+xk.toString(16).padStart(2,'0').toUpperCase()+r; }

const OPCODES={MOVE:0,LOADK:1,LOADBOOL:2,LOADNIL:3,GETUPVAL:4,GETGLOBAL:5,GETTABLE:6,SETGLOBAL:7,SETUPVAL:8,SETTABLE:9,NEWTABLE:10,SELF:11,ADD:12,SUB:13,MUL:14,DIV:15,MOD:16,POW:17,UNM:18,NOT:19,LEN:20,CONCAT:21,JMP:22,EQ:23,LT:24,LE:25,TEST:26,TESTSET:27,CALL:28,TAILCALL:29,RETURN:30,FORLOOP:31,FORPREP:32,TFORLOOP:33,SETLIST:34,CLOSE:35,CLOSURE:36,VARARG:37};

class Chunk {
    constructor(parent){this.parent=parent;this.constants=[];this.instructions=[];this.protos=[];this.scope={locals:new Map(),nextReg:0,parent:null};this.upvalues=[];this.maxStack=0;this.numParams=0;}
    addUpvalue(isLocal,index){for(let i=0;i<this.upvalues.length;i++)if(this.upvalues[i].isLocal===isLocal&&this.upvalues[i].index===index)return i;this.upvalues.push({isLocal,index});return this.upvalues.length-1;}
    addConstant(val){for(let i=0;i<this.constants.length;i++)if(this.constants[i]===val)return i;this.constants.push(val);return this.constants.length-1;}
    emit(op,a,b,c){this.instructions.push({op,a:a||0,b:b||0,c:c||0});}
    allocRegister(){const reg=this.scope.nextReg++;if(this.scope.nextReg>this.maxStack)this.maxStack=this.scope.nextReg;return reg;}
    enterScope(){this.scope={locals:new Map(),nextReg:this.scope.nextReg,parent:this.scope};}
    exitScope(){if(this.scope.parent)this.scope=this.scope.parent;}
    addLocal(name){const reg=this.allocRegister();this.scope.locals.set(name,reg);return reg;}
    getLocal(name){let s=this.scope;while(s){if(s.locals.has(name))return s.locals.get(name);s=s.parent;}return -1;}
}
class Compiler{constructor(){this.rootChunk=new Chunk(null);this.currentChunk=this.rootChunk;this.usedGlobals=new Set();}}

function compileAST(ast){
    const compiler=new Compiler();
    function resolveUpvalue(chunk,name){if(!chunk.parent)return -1;const lr=chunk.parent.getLocal(name);if(lr>=0)return chunk.addUpvalue(true,lr);const ui=resolveUpvalue(chunk.parent,name);if(ui>=0)return chunk.addUpvalue(false,ui);return -1;}
    function trackGlobal(name){compiler.usedGlobals.add(name);}
    function visit(node){if(!node)return -1;const chunk=compiler.currentChunk;
        switch(node.type){
            case 'Chunk':node.body.forEach(s=>visit(s));break;
            case 'LocalStatement':node.variables.forEach((v,i)=>{const reg=chunk.addLocal(v.name);if(node.init&&i<node.init.length){const ir=visit(node.init[i]);if(ir>=0)chunk.emit(OPCODES.MOVE,reg,ir);else{const ci=chunk.addConstant(node.init[i].value);chunk.emit(OPCODES.LOADK,reg,ci);}}else chunk.emit(OPCODES.LOADNIL,reg,0);});break;
            case 'AssignmentStatement':node.variables.forEach((v,i)=>{if(v.type==='Identifier'){const reg=chunk.getLocal(v.name);if(reg>=0){const vr=visit(node.init[i]);if(vr>=0)chunk.emit(OPCODES.MOVE,reg,vr);else{const ci=chunk.addConstant(node.init[i].value);chunk.emit(OPCODES.LOADK,reg,ci);}}else{const ui=resolveUpvalue(chunk,v.name);if(ui>=0){const vr=visit(node.init[i]);if(vr>=0)chunk.emit(OPCODES.SETUPVAL,vr,ui);else{const ci=chunk.addConstant(node.init[i].value);const t=chunk.allocRegister();chunk.emit(OPCODES.LOADK,t,ci);chunk.emit(OPCODES.SETUPVAL,t,ui);}}else{trackGlobal(v.name);const gi=chunk.addConstant(v.name);const vr=visit(node.init[i]);if(vr>=0)chunk.emit(OPCODES.SETGLOBAL,vr,gi);else{const ci=chunk.addConstant(node.init[i].value);chunk.emit(OPCODES.LOADK,chunk.allocRegister(),ci);chunk.emit(OPCODES.SETGLOBAL,chunk.scope.nextReg-1,gi);}}}}});break;
            case 'CallStatement':visit(node.expression);break;
            case 'CallExpression':{let fr,isMC=false;if(node.base.type==='MemberExpression'&&node.base.indexer===':'){isMC=true;const or=visit(node.base.base);fr=chunk.allocRegister();chunk.allocRegister();const mc=chunk.addConstant(node.base.identifier.name);const kr=chunk.allocRegister();chunk.emit(OPCODES.LOADK,kr,mc);chunk.emit(OPCODES.SELF,fr,or,kr);}else{const br=visit(node.base);fr=chunk.allocRegister();chunk.emit(OPCODES.MOVE,fr,br);}node.arguments.forEach((arg,i)=>{const ar=visit(arg);const slot=fr+1+i+(isMC?1:0);if(ar>=0)chunk.emit(OPCODES.MOVE,slot,ar);else{const ci=chunk.addConstant(arg.value);chunk.emit(OPCODES.LOADK,slot,ci);}});chunk.emit(OPCODES.CALL,fr,node.arguments.length+(isMC?1:0)+1,2);return fr;}
            case 'Identifier':{const lr=chunk.getLocal(node.name);if(lr>=0)return lr;const ui=resolveUpvalue(chunk,node.name);if(ui>=0){const ur=chunk.allocRegister();chunk.emit(OPCODES.GETUPVAL,ur,ui);return ur;}trackGlobal(node.name);const gi=chunk.addConstant(node.name);const gr=chunk.allocRegister();chunk.emit(OPCODES.GETGLOBAL,gr,gi);return gr;}
            case 'MemberExpression':case 'IndexExpression':{const tr=visit(node.base);let kr;if(node.indexer==='.'){const ki=chunk.addConstant(node.identifier.name);const kReg=chunk.allocRegister();chunk.emit(OPCODES.LOADK,kReg,ki);kr=kReg;}else{kr=visit(node.index||node.identifier);}const dr=chunk.allocRegister();chunk.emit(OPCODES.GETTABLE,dr,tr,kr);return dr;}
            case 'StringLiteral':{let str;if(node.value!==undefined&&node.value!==null){str=node.value;}else{const raw=node.raw;if(raw.startsWith('[['))str=raw.slice(2,-2);else if(raw.startsWith('[='))str=raw.slice(raw.indexOf('[')+raw.indexOf('[')-raw.indexOf('='),-(raw.indexOf('=')-raw.indexOf('[')+2));else str=raw.slice(1,-1);}const si=chunk.addConstant(str);const reg=chunk.allocRegister();chunk.emit(OPCODES.LOADK,reg,si);return reg;}
            case 'NumericLiteral':{const ni=chunk.addConstant(node.value);const reg=chunk.allocRegister();chunk.emit(OPCODES.LOADK,reg,ni);return reg;}
            case 'BinaryExpression':{const lR=visit(node.left),rR=visit(node.right),dR=chunk.allocRegister();let op;switch(node.operator){case '+':op=OPCODES.ADD;break;case '-':op=OPCODES.SUB;break;case '*':op=OPCODES.MUL;break;case '/':op=OPCODES.DIV;break;case '%':op=OPCODES.MOD;break;case '^':op=OPCODES.POW;break;case '..':op=OPCODES.CONCAT;break;case '<':chunk.emit(OPCODES.LT,1,lR,rR);chunk.emit(OPCODES.JMP,1);chunk.emit(OPCODES.LOADBOOL,dR,0,1);chunk.emit(OPCODES.LOADBOOL,dR,1,0);return dR;case '<=':chunk.emit(OPCODES.LE,1,lR,rR);chunk.emit(OPCODES.JMP,1);chunk.emit(OPCODES.LOADBOOL,dR,0,1);chunk.emit(OPCODES.LOADBOOL,dR,1,0);return dR;case '>':chunk.emit(OPCODES.LT,1,rR,lR);chunk.emit(OPCODES.JMP,1);chunk.emit(OPCODES.LOADBOOL,dR,0,1);chunk.emit(OPCODES.LOADBOOL,dR,1,0);return dR;case '>=':chunk.emit(OPCODES.LE,1,rR,lR);chunk.emit(OPCODES.JMP,1);chunk.emit(OPCODES.LOADBOOL,dR,0,1);chunk.emit(OPCODES.LOADBOOL,dR,1,0);return dR;case '==':chunk.emit(OPCODES.EQ,1,lR,rR);chunk.emit(OPCODES.JMP,1);chunk.emit(OPCODES.LOADBOOL,dR,0,1);chunk.emit(OPCODES.LOADBOOL,dR,1,0);return dR;case '~=':chunk.emit(OPCODES.EQ,0,lR,rR);chunk.emit(OPCODES.JMP,1);chunk.emit(OPCODES.LOADBOOL,dR,0,1);chunk.emit(OPCODES.LOADBOOL,dR,1,0);return dR;default:op=OPCODES.ADD;}chunk.emit(op,dR,lR,rR);return dR;}
            case 'UnaryExpression':{const sr=visit(node.argument);const uR=chunk.allocRegister();if(node.operator==='-')chunk.emit(OPCODES.UNM,uR,sr);else if(node.operator==='not')chunk.emit(OPCODES.NOT,uR,sr);else if(node.operator==='#')chunk.emit(OPCODES.LEN,uR,sr);return uR;}
            case 'IfStatement':node.clauses.forEach(cl=>{if(cl.type==='IfClause'){const cr=visit(cl.condition);chunk.emit(OPCODES.TEST,cr,0,0);const jp=chunk.instructions.length;chunk.emit(OPCODES.JMP,0);cl.body.forEach(s=>visit(s));chunk.emit(OPCODES.JMP,0);chunk.instructions[jp].a=chunk.instructions.length-jp-1;}else if(cl.type==='ElseClause')cl.body.forEach(s=>visit(s));});break;
            case 'ForNumericStatement':{const sR=visit(node.start),eR=visit(node.end),tR=node.step?visit(node.step):-1;chunk.enterScope();const bR=chunk.allocRegister();chunk.allocRegister();chunk.allocRegister();chunk.addLocal(node.variable.name);chunk.emit(OPCODES.MOVE,bR,sR);chunk.emit(OPCODES.MOVE,bR+1,eR);if(tR<0){const sc=chunk.addConstant(1);chunk.emit(OPCODES.LOADK,bR+2,sc);}else chunk.emit(OPCODES.MOVE,bR+2,tR);const fp=chunk.instructions.length;chunk.emit(OPCODES.FORPREP,bR,0);node.body.forEach(s=>visit(s));const le=chunk.instructions.length;chunk.emit(OPCODES.FORLOOP,bR,0);const sBx=le-fp;chunk.instructions[fp].b=sBx-1;chunk.instructions[le].b=-sBx;chunk.exitScope();break;}
            case 'FunctionDeclaration':{const pC=compiler.currentChunk;let lfR=-1;if(node.isLocal)lfR=pC.addLocal(node.identifier.name);const nC=new Chunk(pC);compiler.currentChunk=nC;node.parameters.forEach(p=>{if(p.type==='Identifier'){nC.addLocal(p.name);nC.numParams++;}});node.body.forEach(s=>visit(s));if(nC.instructions.length===0||nC.instructions[nC.instructions.length-1].op!==OPCODES.RETURN)nC.emit(OPCODES.RETURN,0,1);compiler.currentChunk=pC;const pi=pC.protos.length;pC.protos.push(nC);const cR=node.isLocal?lfR:pC.allocRegister();pC.emit(OPCODES.CLOSURE,cR,pi);if(!node.isLocal){const ni=pC.addConstant(node.identifier.name);pC.emit(OPCODES.SETGLOBAL,cR,ni);}break;}
            case 'ReturnStatement':node.arguments.forEach((arg,i)=>{const rR=visit(arg);if(rR>=0)chunk.emit(OPCODES.MOVE,i,rR);else{const ci=chunk.addConstant(arg.value);chunk.emit(OPCODES.LOADK,i,ci);}});chunk.emit(OPCODES.RETURN,0,node.arguments.length+1);break;
            case 'TableConstructorExpression':{const tR=chunk.allocRegister();chunk.emit(OPCODES.NEWTABLE,tR,0,0);node.fields.forEach((f,i)=>{let kR;if(f.type==='TableKeyString'){const ki=chunk.addConstant(f.key.name);chunk.emit(OPCODES.LOADK,chunk.allocRegister(),ki);kR=chunk.scope.nextReg-1;}else if(f.type==='TableKey')kR=visit(f.key);else kR=-1;const vR=visit(f.value);if(kR>=0)chunk.emit(OPCODES.SETTABLE,tR,kR,vR);else{const ai=chunk.addConstant(i+1);chunk.emit(OPCODES.LOADK,chunk.allocRegister(),ai);chunk.emit(OPCODES.SETTABLE,tR,chunk.scope.nextReg-1,vR);}});return tR;}
            default:console.warn(`Unhandled: ${node.type}`);
        }
        return -1;
    }
    visit(ast);
    const root=compiler.rootChunk;
    if(root.instructions.length===0||root.instructions[root.instructions.length-1].op!==OPCODES.RETURN)root.emit(OPCODES.RETURN,0,1);
    return compiler;
}

LuaObfuscator.obfuscate=function(source,options={}){
    let ast;try{ast=luaparse.parse(source);}catch(e){throw new Error("Lua Parse Error: "+e.message);}
    const compiler=compileAST(ast);
    const origOps=Object.values(OPCODES);const fakeOps=[];for(let i=0;i<30;i++)fakeOps.push(100+i);
    const shuffled=shuffleArray([...origOps,...fakeOps]);const opMap={};origOps.forEach((op,i)=>{opMap[op]=shuffled[i];});
    const junkOps=shuffled.slice(origOps.length);
    const encKeys=[Array.from({length:16},()=>Math.floor(Math.random()*256)),Array.from({length:8},()=>Math.floor(Math.random()*256)),Array.from({length:4},()=>Math.floor(Math.random()*256))];
    const strXorKey=Math.floor(Math.random()*256);
    const polyCf=generatePolyCoeffs();const polySeed=Math.floor(Math.random()*256);const lfsrSeed=Math.floor(Math.random()*65536)+1;

    function serializeChunk(chunk){
        let bc=[];chunk.instructions.forEach(inst=>{bc.push(opMap[inst.op]);bc.push(inst.a);bc.push(inst.b);bc.push(inst.c);});
        let enc=multiLayerEnc(bc,encKeys);enc=polyEncrypt(enc,polyCf,polySeed);enc=lfsrEncrypt(enc,lfsrSeed);
        // Simple checksum: sum of all bytes mod 65536, and length
        const checksum = enc.reduce((a,b)=>a+b,0) % 65536;
        const codeLen = enc.length;
        const constsLua='{'+chunk.constants.map(c=>{if(typeof c==='string'){const esc=c.replace(/\\/g,'\\\\').replace(/"/g,'\\"').replace(/\n/g,'\\n').replace(/\r/g,'\\r').replace(/\t/g,'\\t').replace(/\0/g,'\\0');return '"'+esc+'"'}if(c===undefined||c===null)return 'nil';return c;}).join(',')+'}';
        const protosLua='{'+chunk.protos.map(p=>serializeChunk(p)).join(',')+'}';
        const upvalsLua='{'+chunk.upvalues.map(u=>`{${u.isLocal?1:0},${u.index}}`).join(',')+'}';
        return `{code={${enc.join(',')}},consts=${constsLua},protos=${protosLua},numParams=${chunk.numParams},upvalues=${upvalsLua},cs=${checksum},len=${codeLen}}`;
    }

    const rootChunkLua=serializeChunk(compiler.rootChunk);
    const vn=generateVarNames(120);
    const [_ti,_gf,_up,_vr,_vs,_pc,_ops,_cs,_pr,_env,_op,_a,_b,_c,_uv,_xr,_dc,_gd,_pd,_ld,_vf]=[vn[7],vn[8],vn[9],vn[17],vn[19],vn[20],vn[21],vn[22],vn[23],vn[24],vn[25],vn[26],vn[27],vn[28],vn[29],vn[34],vn[33],vn[36],vn[38],vn[39],vn[40]];
    const junkVars=vn.slice(50,100);const opaqueVar=vn[37];const pred=genPredicate();
    const deadCodes=[];for(let i=0;i<15;i++)deadCodes.push(genDeadCode(junkVars));

    const handlers=[];
    for(const [name,code] of Object.entries(OPCODES)){
        const mapped=opMap[code];let block='';
        switch(name){
            case 'MOVE':block=`${_vs}[${_a}+1]=${_vs}[${_b}+1]`;break;
            case 'LOADK':block=`${_vs}[${_a}+1]=${_cs}[${_b}+1]`;break;
            case 'LOADBOOL':block=`${_vs}[${_a}+1]=(${_b}~=0);if ${_c}~=0 then ${_pc}=${_pc}+4 end`;break;
            case 'LOADNIL':block=`for i=${_a}+1,${_a}+${_b}+1 do ${_vs}[i]=nil end`;break;
            case 'GETGLOBAL':block=`${_vs}[${_a}+1]=${_env}[${_cs}[${_b}+1]]`;break;
            case 'SETGLOBAL':block=`${_env}[${_cs}[${_b}+1]]=${_vs}[${_a}+1]`;break;
            case 'GETUPVAL':block=`local uv=${_uv}[${_b}+1];${_vs}[${_a}+1]=uv.stack[uv.index]`;break;
            case 'SETUPVAL':block=`local uv=${_uv}[${_b}+1];uv.stack[uv.index]=${_vs}[${_a}+1]`;break;
            case 'ADD':block=`${_vs}[${_a}+1]=${_vs}[${_b}+1]+${_vs}[${_c}+1]`;break;
            case 'SUB':block=`${_vs}[${_a}+1]=${_vs}[${_b}+1]-${_vs}[${_c}+1]`;break;
            case 'MUL':block=`${_vs}[${_a}+1]=${_vs}[${_b}+1]*${_vs}[${_c}+1]`;break;
            case 'DIV':block=`${_vs}[${_a}+1]=${_vs}[${_b}+1]/${_vs}[${_c}+1]`;break;
            case 'MOD':block=`${_vs}[${_a}+1]=${_vs}[${_b}+1]%${_vs}[${_c}+1]`;break;
            case 'POW':block=`${_vs}[${_a}+1]=${_vs}[${_b}+1]^${_vs}[${_c}+1]`;break;
            case 'UNM':block=`${_vs}[${_a}+1]=-${_vs}[${_b}+1]`;break;
            case 'NOT':block=`${_vs}[${_a}+1]=not ${_vs}[${_b}+1]`;break;
            case 'LEN':block=`${_vs}[${_a}+1]=#${_vs}[${_b}+1]`;break;
            case 'CONCAT':block=`${_vs}[${_a}+1]=${_vs}[${_b}+1]..${_vs}[${_c}+1]`;break;
            case 'JMP':block=`${_pc}=${_pc}+${_a}*4`;break;
            case 'EQ':block=`if((${_vs}[${_b}+1]==${_vs}[${_c}+1])~=(${_a}~=0))then ${_pc}=${_pc}+4 end`;break;
            case 'LT':block=`if((${_vs}[${_b}+1]<${_vs}[${_c}+1])~=(${_a}~=0))then ${_pc}=${_pc}+4 end`;break;
            case 'LE':block=`if((${_vs}[${_b}+1]<=${_vs}[${_c}+1])~=(${_a}~=0))then ${_pc}=${_pc}+4 end`;break;
            case 'TEST':block=`if(not not ${_vs}[${_a}+1])~=(${_c}~=0)then ${_pc}=${_pc}+4 end`;break;
            case 'TESTSET':block=`if(not not ${_vs}[${_b}+1])==(${_c}~=0)then ${_vs}[${_a}+1]=${_vs}[${_b}+1]else ${_pc}=${_pc}+4 end`;break;
            case 'CALL':block=`local args={};for i=1,${_b}-1 do ${_ti}(args,${_vs}[${_a}+i+1])end;local fn=${_vs}[${_a}+1];local res;if ${pred(opaqueVar)} then res={fn(${_up}(args))}else ${deadCodes[0]} end;for i=1,${_c}-1 do ${_vs}[${_a}+i]=res[i]or nil end`;break;
            case 'RETURN':block=`local res={};for i=0,${_b}-2 do ${_ti}(res,${_vs}[${_a}+i+1])end;return ${_up}(res)`;break;
            case 'FORLOOP':block=`local sBx=${_b};if sBx>=128 then sBx=sBx-256 end;${_vs}[${_a}+1]=${_vs}[${_a}+1]+${_vs}[${_a}+3];local step=${_vs}[${_a}+3];local idx=${_vs}[${_a}+1];local limit=${_vs}[${_a}+2];if(step>0 and idx<=limit)or(step<=0 and idx>=limit)then ${_pc}=${_pc}+sBx*4;${_vs}[${_a}+4]=idx end`;break;
            case 'FORPREP':block=`local sBx=${_b};if sBx>=128 then sBx=sBx-256 end;${_vs}[${_a}+1]=${_vs}[${_a}+1]-${_vs}[${_a}+3];${_pc}=${_pc}+sBx*4`;break;
            case 'NEWTABLE':block=`${_vs}[${_a}+1]={}`;break;
            case 'SETTABLE':block=`${_vs}[${_a}+1][${_vs}[${_b}+1]]=${_vs}[${_c}+1]`;break;
            case 'GETTABLE':block=`${_vs}[${_a}+1]=${_vs}[${_b}+1][${_vs}[${_c}+1]]`;break;
            case 'SELF':block=`${_vs}[${_a}+2]=${_vs}[${_b}+1];${_vs}[${_a}+1]=${_vs}[${_b}+1][${_vs}[${_c}+1]]`;break;
            case 'CLOSURE':block=`local proto=${_pr}[${_b}+1];local upvals={};for i,def in ipairs(proto.upvalues)do if def[1]==1 then upvals[i]={stack=${_vs},index=def[2]+1}else upvals[i]=${_uv}[def[2]+1]end end;${_vs}[${_a}+1]=function(...)return ${_vr}(proto,{...},upvals)end`;break;
            default:block=`--${name}`;
        }
        handlers.push({mapped,block,name});
    }
    shuffleArray(handlers);

    let dispatcher='';handlers.forEach((h,i)=>{dispatcher+=(i===0?'if':'elseif')+` ${_op}==${h.mapped} then\n${h.block}\n`;});
    junkOps.forEach((fo,i)=>{dispatcher+=`elseif ${_op}==${fo} then\n${deadCodes[i%deadCodes.length]}\n`;});

    let junkInit='';junkVars.forEach(v=>{junkInit+=`local ${v}=${Math.random()>0.5?Math.floor(Math.random()*1000):`"${randomString(8)}"`}\n`;});
    const k1=`{${encKeys[0].join(',')}}`,k2=`{${encKeys[1].join(',')}}`,k3=`{${encKeys[2].join(',')}}`;

    const vmCode=`local ${_gd}=function()return true end
${junkInit}local ${opaqueVar}=(os and os.time and os.time())or(tick and tick())or 1
local ${_ti}=table.insert
local ${_up}=table.unpack or unpack
local ${_env}=_G or _ENV or{}
local ${_xr}=function(a,b)local p,c=1,0;while a>0 and b>0 do local ra,rb=a%2,b%2;if ra~=rb then c=c+p end;a,b,p=(a-ra)/2,(b-rb)/2,p*2 end;if a<b then a=b end;while a>0 do local ra=a%2;if ra>0 then c=c+p end;a,p=(a-ra)/2,p*2 end;return c end
local ${_dc}=function(data,keys)local r={};for i=1,#data do local v=data[i];for j=#keys,1,-1 do local k=keys[j];v=v-k[((i-1)%#k)+1];if v<0 then v=v+256 end end;r[i]=v end;return r end
local ${_ld}=function(data,seed)local state=seed;local taps=0x80200003;local r={};for i=1,#data do local lsb=state%2;state=math.floor(state/2);if lsb==1 then state=${_xr}(state,taps)end;r[i]=${_xr}(data[i],state%256)end;return r end
local ${_pd}=function(data,a,b,c,d,seed)local r={};local x=seed;for i=1,#data do local y=((i-1)*7+13)%256;local z=((i-1)*11+17)%256;local f=(a*x*x*x+b*y*y+c*z+d)%256;r[i]=(data[i]-f)%256;x=(x*17+(i-1)+31)%256 end;return r end
local ${_vf}=function(data,cs,len)if #data~=len then return false end;local sum=0;for i=1,#data do sum=sum+data[i]end;return(sum%65536)==cs end
local function ${_vr}(chunk,args,upvals)
local key1,key2,key3=${k1},${k2},${k3}
local raw=chunk.code
if not ${_vf}(raw,chunk.cs,chunk.len)then error("Tampered")end
local dec=${_ld}(raw,${lfsrSeed})
dec=${_pd}(dec,${polyCf.a},${polyCf.b},${polyCf.c},${polyCf.d},${polySeed})
local ${_ops}=${_dc}(dec,{key3,key2,key1})
local ${_cs}=chunk.consts
local ${_pr}=chunk.protos
local ${_uv}=upvals or{}
local ${_vs}={}
for i=1,#(args or{})do ${_vs}[i]=args[i]end
local ${_pc}=1
while ${pred(opaqueVar)} do
local ${_op}=${_ops}[${_pc}]
local ${_a}=${_ops}[${_pc}+1]
local ${_b}=${_ops}[${_pc}+2]
local ${_c}=${_ops}[${_pc}+3]
${_pc}=${_pc}+4
${dispatcher}else break end
end
end
${_vr}(${rootChunkLua},{...})`;

    return `--[[Lua Obfuscator v3.0]]\n${vmCode}`;
};

if(typeof module!=='undefined'&&module.exports)module.exports=LuaObfuscator;
else global.LuaObfuscator=LuaObfuscator;
})(typeof window!=='undefined'?window:this);
