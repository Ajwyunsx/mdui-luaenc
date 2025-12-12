--[[Lua Obfuscator v3.0]]
local qUnP2fktr=function()return true end
local AyLyhHbmSdxd="TbEwiIvP"
local PyAMA7P=21
local yFBYW5=745
local mqMvDXbg5="caBFsZPZ"
local Pvd2qNRNy0=213
local hCT_tsvzsq3=669
local XVHe2JLc="zghtHMNd"
local CaNPZY=694
local gpJ0pV9wf=61
local fQxcgdI6TN4T="LVeSUXfC"
local DG4dukQV=694
local iiARaPT=367
local m2ErmVixX=372
local ydTfYEn=45
local Aler7ho=237
local zVArUhAZHg=212
local cWLB16q4Dhs=334
local o01elOT19sBgp=556
local l0tnpWULYU1E="ivEKXZTI"
local HISm6BK4nx=727
local cbHykcNtJcfL=410
local _9GXGKQlORqcv="OZvxepgg"
local ExVGdNjR56X=709
local iEPK7boa7=826
local rdyiKJk=68
local E65zJ_c=646
local VuJiwl="yQRZovA_"
local MwdD10cFBu=120
local IRgF6d="NBIovtYp"
local L_CQGl5=327
local _CiDM0gfB=560
local MvYqigshP="oUgXXlWv"
local DJcu1hnZPAip="qYztPQdH"
local WCBucql2="ZWU_pQIK"
local Eu6DWKm0S5SK=795
local tdDpQVU=328
local vtFD24jGn=476
local Kpg0HRug=263
local dWChUizUbZAD=410
local J7v3OI4=887
local DssZz6u="yhYUivIJ"
local y2nmsKZl2Ird=821
local ubCgKUUzLemSl="XLhgBniY"
local MKXAYTmol9=339
local SJg1ow=608
local kA84TsSBoS="BruVulLT"
local AVcgFqs9kIwm="aJxFNrbO"
local y2HNLW="oGoiymPT"
local pHkyWu=310
local VOBIv8QHGYNya="WFYoOHfr"
local wOiKQu3WujL38=(os and os.time and os.time())or(tick and tick())or 1
local Et1nSdS_SJG=table.insert
local i6hm3r=table.unpack or unpack
local modrH98=_G or _ENV or{}
local N5cEMsDD_=function(a,b)local p,c=1,0;while a>0 and b>0 do local ra,rb=a%2,b%2;if ra~=rb then c=c+p end;a,b,p=(a-ra)/2,(b-rb)/2,p*2 end;if a<b then a=b end;while a>0 do local ra=a%2;if ra>0 then c=c+p end;a,p=(a-ra)/2,p*2 end;return c end
local p8UGhKSv=function(data,keys)local r={};for i=1,#data do local v=data[i];for j=#keys,1,-1 do local k=keys[j];v=v-k[((i-1)%#k)+1];if v<0 then v=v+256 end end;r[i]=v end;return r end
local KdHKL_rIhalC=function(data,seed)local state=seed;local taps=0x80200003;local r={};for i=1,#data do local lsb=state%2;state=math.floor(state/2);if lsb==1 then state=N5cEMsDD_(state,taps)end;r[i]=N5cEMsDD_(data[i],state%256)end;return r end
local I9sNsoTulo=function(data,a,b,c,d,seed)local r={};local x=seed;for i=1,#data do local y=((i-1)*7+13)%256;local z=((i-1)*11+17)%256;local f=(a*x*x*x+b*y*y+c*z+d)%256;r[i]=(data[i]-f)%256;x=(x*17+(i-1)+31)%256 end;return r end
local xZB7nx=function(data,cs,len)if #data~=len then return false end;local sum=0;for i=1,#data do sum=sum+data[i]end;return(sum%65536)==cs end
local function wKtfr924(chunk,args,upvals)
local key1,key2,key3={253,178,233,156,6,232,79,246,99,38,69,108,127,192,232,241},{148,221,138,29,69,96,104,147},{33,36,25,213}
local raw=chunk.code
if not xZB7nx(raw,chunk.cs,chunk.len)then error("Tampered")end
local dec=KdHKL_rIhalC(raw,10505)
dec=I9sNsoTulo(dec,7,19,21,36,124)
local M7mBlr2k=p8UGhKSv(dec,{key3,key2,key1})
local XYb4KL2xMd=chunk.consts
local FNTlHSZypZI=chunk.protos
local CKbSfs=upvals or{}
local PJdhAwc0qHr={}
for i=1,#(args or{})do PJdhAwc0qHr[i]=args[i]end
local H6Sv2e2Y3vr=1
while ((wOiKQu3WujL38-wOiKQu3WujL38)==0) do
local iz0lq_=M7mBlr2k[H6Sv2e2Y3vr]
local SsQdifvZn=M7mBlr2k[H6Sv2e2Y3vr+1]
local p8fMWYwcH1v1n=M7mBlr2k[H6Sv2e2Y3vr+2]
local nA_d4ir=M7mBlr2k[H6Sv2e2Y3vr+3]
H6Sv2e2Y3vr=H6Sv2e2Y3vr+4
if iz0lq_==0 then
PJdhAwc0qHr[SsQdifvZn+1]=PJdhAwc0qHr[p8fMWYwcH1v1n+1]*PJdhAwc0qHr[nA_d4ir+1]
elseif iz0lq_==16 then
PJdhAwc0qHr[SsQdifvZn+1]={}
elseif iz0lq_==110 then
PJdhAwc0qHr[SsQdifvZn+1]=modrH98[XYb4KL2xMd[p8fMWYwcH1v1n+1]]
elseif iz0lq_==18 then
--TAILCALL
elseif iz0lq_==19 then
--SETLIST
elseif iz0lq_==15 then
if(not not PJdhAwc0qHr[p8fMWYwcH1v1n+1])==(nA_d4ir~=0)then PJdhAwc0qHr[SsQdifvZn+1]=PJdhAwc0qHr[p8fMWYwcH1v1n+1]else H6Sv2e2Y3vr=H6Sv2e2Y3vr+4 end
elseif iz0lq_==118 then
PJdhAwc0qHr[SsQdifvZn+2]=PJdhAwc0qHr[p8fMWYwcH1v1n+1];PJdhAwc0qHr[SsQdifvZn+1]=PJdhAwc0qHr[p8fMWYwcH1v1n+1][PJdhAwc0qHr[nA_d4ir+1]]
elseif iz0lq_==123 then
--CLOSE
elseif iz0lq_==112 then
PJdhAwc0qHr[SsQdifvZn+1]=#PJdhAwc0qHr[p8fMWYwcH1v1n+1]
elseif iz0lq_==12 then
PJdhAwc0qHr[SsQdifvZn+1]=PJdhAwc0qHr[p8fMWYwcH1v1n+1]
elseif iz0lq_==28 then
PJdhAwc0qHr[SsQdifvZn+1]=-PJdhAwc0qHr[p8fMWYwcH1v1n+1]
elseif iz0lq_==100 then
PJdhAwc0qHr[SsQdifvZn+1]=PJdhAwc0qHr[p8fMWYwcH1v1n+1]^PJdhAwc0qHr[nA_d4ir+1]
elseif iz0lq_==105 then
local uv=CKbSfs[p8fMWYwcH1v1n+1];PJdhAwc0qHr[SsQdifvZn+1]=uv.stack[uv.index]
elseif iz0lq_==33 then
for i=SsQdifvZn+1,SsQdifvZn+p8fMWYwcH1v1n+1 do PJdhAwc0qHr[i]=nil end
elseif iz0lq_==2 then
PJdhAwc0qHr[SsQdifvZn+1]=PJdhAwc0qHr[p8fMWYwcH1v1n+1]-PJdhAwc0qHr[nA_d4ir+1]
elseif iz0lq_==119 then
if((PJdhAwc0qHr[p8fMWYwcH1v1n+1]<=PJdhAwc0qHr[nA_d4ir+1])~=(SsQdifvZn~=0))then H6Sv2e2Y3vr=H6Sv2e2Y3vr+4 end
elseif iz0lq_==29 then
modrH98[XYb4KL2xMd[p8fMWYwcH1v1n+1]]=PJdhAwc0qHr[SsQdifvZn+1]
elseif iz0lq_==17 then
PJdhAwc0qHr[SsQdifvZn+1]=(p8fMWYwcH1v1n~=0);if nA_d4ir~=0 then H6Sv2e2Y3vr=H6Sv2e2Y3vr+4 end
elseif iz0lq_==32 then
local sBx=p8fMWYwcH1v1n;if sBx>=128 then sBx=sBx-256 end;PJdhAwc0qHr[SsQdifvZn+1]=PJdhAwc0qHr[SsQdifvZn+1]-PJdhAwc0qHr[SsQdifvZn+3];H6Sv2e2Y3vr=H6Sv2e2Y3vr+sBx*4
elseif iz0lq_==4 then
H6Sv2e2Y3vr=H6Sv2e2Y3vr+SsQdifvZn*4
elseif iz0lq_==37 then
local args={};for i=1,p8fMWYwcH1v1n-1 do Et1nSdS_SJG(args,PJdhAwc0qHr[SsQdifvZn+i+1])end;local fn=PJdhAwc0qHr[SsQdifvZn+1];local res;if ((wOiKQu3WujL38-wOiKQu3WujL38)==0) then res={fn(i6hm3r(args))}else for SHmy=1,0 do HISm6BK4nx=vtFD24jGn+1 end end;for i=1,nA_d4ir-1 do PJdhAwc0qHr[SsQdifvZn+i]=res[i]or nil end
elseif iz0lq_==120 then
PJdhAwc0qHr[SsQdifvZn+1]=PJdhAwc0qHr[p8fMWYwcH1v1n+1]..PJdhAwc0qHr[nA_d4ir+1]
elseif iz0lq_==101 then
local uv=CKbSfs[p8fMWYwcH1v1n+1];uv.stack[uv.index]=PJdhAwc0qHr[SsQdifvZn+1]
elseif iz0lq_==23 then
PJdhAwc0qHr[SsQdifvZn+1]=XYb4KL2xMd[p8fMWYwcH1v1n+1]
elseif iz0lq_==1 then
if((PJdhAwc0qHr[p8fMWYwcH1v1n+1]==PJdhAwc0qHr[nA_d4ir+1])~=(SsQdifvZn~=0))then H6Sv2e2Y3vr=H6Sv2e2Y3vr+4 end
elseif iz0lq_==30 then
PJdhAwc0qHr[SsQdifvZn+1]=PJdhAwc0qHr[p8fMWYwcH1v1n+1]+PJdhAwc0qHr[nA_d4ir+1]
elseif iz0lq_==129 then
PJdhAwc0qHr[SsQdifvZn+1]=PJdhAwc0qHr[p8fMWYwcH1v1n+1]/PJdhAwc0qHr[nA_d4ir+1]
elseif iz0lq_==117 then
if((PJdhAwc0qHr[p8fMWYwcH1v1n+1]<PJdhAwc0qHr[nA_d4ir+1])~=(SsQdifvZn~=0))then H6Sv2e2Y3vr=H6Sv2e2Y3vr+4 end
elseif iz0lq_==35 then
local res={};for i=0,p8fMWYwcH1v1n-2 do Et1nSdS_SJG(res,PJdhAwc0qHr[SsQdifvZn+i+1])end;return i6hm3r(res)
elseif iz0lq_==20 then
--TFORLOOP
elseif iz0lq_==5 then
PJdhAwc0qHr[SsQdifvZn+1][PJdhAwc0qHr[p8fMWYwcH1v1n+1]]=PJdhAwc0qHr[nA_d4ir+1]
elseif iz0lq_==9 then
PJdhAwc0qHr[SsQdifvZn+1]=PJdhAwc0qHr[p8fMWYwcH1v1n+1]%PJdhAwc0qHr[nA_d4ir+1]
elseif iz0lq_==114 then
local proto=FNTlHSZypZI[p8fMWYwcH1v1n+1];local upvals={};for i,def in ipairs(proto.upvalues)do if def[1]==1 then upvals[i]={stack=PJdhAwc0qHr,index=def[2]+1}else upvals[i]=CKbSfs[def[2]+1]end end;PJdhAwc0qHr[SsQdifvZn+1]=function(...)return wKtfr924(proto,{...},upvals)end
elseif iz0lq_==125 then
PJdhAwc0qHr[SsQdifvZn+1]=not PJdhAwc0qHr[p8fMWYwcH1v1n+1]
elseif iz0lq_==14 then
PJdhAwc0qHr[SsQdifvZn+1]=PJdhAwc0qHr[p8fMWYwcH1v1n+1][PJdhAwc0qHr[nA_d4ir+1]]
elseif iz0lq_==108 then
--VARARG
elseif iz0lq_==124 then
local sBx=p8fMWYwcH1v1n;if sBx>=128 then sBx=sBx-256 end;PJdhAwc0qHr[SsQdifvZn+1]=PJdhAwc0qHr[SsQdifvZn+1]+PJdhAwc0qHr[SsQdifvZn+3];local step=PJdhAwc0qHr[SsQdifvZn+3];local idx=PJdhAwc0qHr[SsQdifvZn+1];local limit=PJdhAwc0qHr[SsQdifvZn+2];if(step>0 and idx<=limit)or(step<=0 and idx>=limit)then H6Sv2e2Y3vr=H6Sv2e2Y3vr+sBx*4;PJdhAwc0qHr[SsQdifvZn+4]=idx end
elseif iz0lq_==109 then
if(not not PJdhAwc0qHr[SsQdifvZn+1])~=(nA_d4ir~=0)then H6Sv2e2Y3vr=H6Sv2e2Y3vr+4 end
elseif iz0lq_==24 then
for SHmy=1,0 do HISm6BK4nx=vtFD24jGn+1 end
elseif iz0lq_==128 then
local JrtLdo={0.609093404710841,"YwBSTYnt"}
elseif iz0lq_==121 then
local Viknyc=MwdD10cFBu+L_CQGl5
elseif iz0lq_==36 then
if false then dWChUizUbZAD=nil end
elseif iz0lq_==115 then
local kkeRdE={0.9178681864367646,"F_ndIuCp"}
elseif iz0lq_==127 then
if false then tdDpQVU=nil end
elseif iz0lq_==107 then
for sXJw=1,0 do kA84TsSBoS=HISm6BK4nx+1 end
elseif iz0lq_==113 then
local GnKSMX={0.6741592861919417,"qDGDVGXz"}
elseif iz0lq_==122 then
local pqxlMj={0.8966435718212926,"TLCELfmu"}
elseif iz0lq_==21 then
local pJbObJ=ubCgKUUzLemSl+y2nmsKZl2Ird
elseif iz0lq_==116 then
if false then E65zJ_c=nil end
elseif iz0lq_==106 then
if false then ExVGdNjR56X=nil end
elseif iz0lq_==31 then
for nMy_=1,0 do XVHe2JLc=yFBYW5+1 end
elseif iz0lq_==11 then
local TmYXkH={0.92761462813543,"cOQVEPAW"}
elseif iz0lq_==27 then
for DgPy=1,0 do XVHe2JLc=kA84TsSBoS+1 end
elseif iz0lq_==102 then
for SHmy=1,0 do HISm6BK4nx=vtFD24jGn+1 end
elseif iz0lq_==7 then
local JrtLdo={0.609093404710841,"YwBSTYnt"}
elseif iz0lq_==13 then
local Viknyc=MwdD10cFBu+L_CQGl5
elseif iz0lq_==104 then
if false then dWChUizUbZAD=nil end
elseif iz0lq_==6 then
local kkeRdE={0.9178681864367646,"F_ndIuCp"}
elseif iz0lq_==111 then
if false then tdDpQVU=nil end
elseif iz0lq_==126 then
for sXJw=1,0 do kA84TsSBoS=HISm6BK4nx+1 end
elseif iz0lq_==34 then
local GnKSMX={0.6741592861919417,"qDGDVGXz"}
elseif iz0lq_==103 then
local pqxlMj={0.8966435718212926,"TLCELfmu"}
elseif iz0lq_==22 then
local pJbObJ=ubCgKUUzLemSl+y2nmsKZl2Ird
elseif iz0lq_==25 then
if false then E65zJ_c=nil end
elseif iz0lq_==10 then
if false then ExVGdNjR56X=nil end
elseif iz0lq_==8 then
for nMy_=1,0 do XVHe2JLc=yFBYW5+1 end
elseif iz0lq_==26 then
local TmYXkH={0.92761462813543,"cOQVEPAW"}
elseif iz0lq_==3 then
for DgPy=1,0 do XVHe2JLc=kA84TsSBoS+1 end
else break end
end
end
wKtfr924({code={243,8,35,72,224,68,211,245,92,26,8,2,24,46,202,62,88,35,100,5,186,168,184,175,208,109,56,14,22,84,244,84,211,41,205,100,38,225,124,248,105,169,253,98,248,128,28,206,48,17,118,164,195,48,87,175,238,161,248,242,179,179,142,46,26,213,48,242,70,146,170,120,185,164,191,228,64,159,213,60,85,162,175,47,211,174,156,242,38,87,123,218,88,54,159,20,186,191,75,116,142,3,243,117,140,194,107,228,38,223,1,17,35,132,189,15,254,97,94,65,227,48,157,137,173,32,122,4,13,97,191,102,183,250,49,111,209,101,81,65,199,182,21,112,160,232,4,130,214,203,246,118,104,236,16,183,34,170,144,89,25,102,80,15,203,96,45,247,38,157,101,57,22,110,41,66,160,53,104,135,248,79,66,89,123,221,91,196,3,115,57,248,181,120,244,53,193,45,226,109,104,32,10,173,7,23,55,45,164,117,106,247,38,203,46,212,108,105,190,44,122,132,114,131,20,171,137,37,204,59,186,105,95,180,70,205},consts={"print","Start","Factorial of 5 is: ",5,"key","value",1,100,"Table key: ","Table index 1: ",3,"Loop iteration: ","End"},protos={{code={154,9,35,72,213,68,211,244,47,25,15,2,31,46,196,193,68,32,101,7,189,171,184,175,42,109,56,14,11,90,137,84,220,47,206,100,49,248,123,248,90,161,248,98,87,252,20,206,41,19,116,166,36,77,82,176,248,160,247,244,216,178,139,48,39,203,54,240,105,158,174,69,178,169,188,228,98,130,207,79},consts={0,1},protos={},numParams=1,upvalues={{1,3}},cs=9946,len=80}},numParams=0,upvalues={},cs=28994,len=236},{...})