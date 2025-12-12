--[[Lua Obfuscator v3.0]]
local MzObHHfVJ=function()return true end
local CyvW7_gQ_7lDr="ulWQjQxH"
local tfGXMXe="R_hXksPX"
local P3vlUPAe2U=519
local KyPHup="afiatvGE"
local hNfaXxzbG=153
local HU4HWKd8ih="ZBRcTCrU"
local tKzwzj=1
local rNTgOTQyqJAB=287
local VTd7TkkRrgFW3=499
local Ix9KBBreTsY=788
local QvijNwQxDePD="OHZgrUGE"
local SBbCIN1EWl="DSmJJeki"
local A2fBeusl6l6=986
local eJReCrKUZ="FxLwCRUj"
local Gvpindx=304
local OK7a6tGy1W4Xw=500
local tV2Q_61hw=372
local ByDUtFVfKE="D_GyGPfx"
local g6Eo7cJc0JX6b=380
local ZqkYM2d7sl=917
local l13hLRhpzP="CkWWEISi"
local Z9LDGyhmk=323
local yPTy0yWOO="crdynzTD"
local B9H1DfPEa="wIaejGre"
local j5gaCPbQo7z=841
local CquFPknxGc=34
local uFly9bYkVTv0=231
local pN_f1hWKt=278
local uZHyXNHhzly=433
local dp90BVBr="SNBfacXL"
local zZBUJ9tm2RNe9="THf_Xint"
local L_xTUrtKi=928
local n49KDuRt=62
local n9lBKw="zAhAGaEx"
local q_VwE5WsWeq="xxMxJrDS"
local CVuAaK1Bn=748
local BkRLHwiH=112
local SIVu0Mb5tGEzv="ZUTAIpah"
local o47L_WOBvqh=822
local FhqDMz="eLjAXFMp"
local sby2_55=886
local uI_A3i5vjwwPd="PwaJBnWG"
local G19464="HJPLOmaZ"
local T8B88YUxNrYVA="MTINeojv"
local LyEPSK9=541
local zMTd7uRd=850
local fObyn3ldIXH="UdlsSOzh"
local ywW4t69="tqlNDDha"
local Azzs5wPkBUA=325
local zsfT0QX=380
local i_fTyUWtCcC=(os and os.time and os.time())or(tick and tick())or 1
local It8UH79=table.insert
local GCwGyRd=table.unpack or unpack
local _0U17iKxNlf=_G or _ENV or{}
local nM8pyTi0pDeXg=function(a,b)local p,c=1,0;while a>0 and b>0 do local ra,rb=a%2,b%2;if ra~=rb then c=c+p end;a,b,p=(a-ra)/2,(b-rb)/2,p*2 end;if a<b then a=b end;while a>0 do local ra=a%2;if ra>0 then c=c+p end;a,p=(a-ra)/2,p*2 end;return c end
local cSg87xOKeg0eM=function(data,keys)local r={};for i=1,#data do local v=data[i];for j=#keys,1,-1 do local k=keys[j];v=v-k[((i-1)%#k)+1];if v<0 then v=v+256 end end;r[i]=v end;return r end
local kZnYdR3=function(data,seed)local state=seed;local taps=0x80200003;local r={};for i=1,#data do local lsb=state%2;state=math.floor(state/2);if lsb==1 then state=nM8pyTi0pDeXg(state,taps)end;r[i]=nM8pyTi0pDeXg(data[i],state%256)end;return r end
local AZgMYHZx=function(data,a,b,c,d,seed)local r={};local x=seed;for i=1,#data do local y=((i-1)*7+13)%256;local z=((i-1)*11+17)%256;local f=(a*x*x*x+b*y*y+c*z+d)%256;r[i]=(data[i]-f)%256;x=(x*17+(i-1)+31)%256 end;return r end
local F7xGGgLd2qJWK=function(data,expected)local hash=0x811c9dc5;local prime=0x01000193;for i=1,#data do hash=nM8pyTi0pDeXg(hash,data[i]);hash=(hash*prime)%0x100000000 end;hash=nM8pyTi0pDeXg(hash,math.floor(hash/65536));hash=(hash*0x85ebca6b)%0x100000000;hash=nM8pyTi0pDeXg(hash,math.floor(hash/8192));hash=(hash*0xc2b2ae35)%0x100000000;hash=nM8pyTi0pDeXg(hash,math.floor(hash/65536));return hash==expected end
local function rtV7Q_g(chunk,args,upvals)
local key1,key2,key3={219,115,199,69,71,60,227,32,23,57,115,215,120,203,107,185},{249,157,195,2,66,108,0,105},{8,146,59,230}
local raw=chunk.code
if not F7xGGgLd2qJWK(raw,chunk.hash)then error("Integrity check failed")end
local dec=kZnYdR3(raw,23948)
dec=AZgMYHZx(dec,16,6,25,42,162)
local v_HAAbeOyMhd=cSg87xOKeg0eM(dec,{key3,key2,key1})
local zmZqE2pO=chunk.consts
local dOniMJgd=chunk.protos
local xbuUhBm=upvals or{}
local XqNYtyaTse={}
for i=1,#(args or{})do XqNYtyaTse[i]=args[i]end
local KhhDIp=1
while ((i_fTyUWtCcC*0+1)==1) do
local SesVzLuh_=v_HAAbeOyMhd[KhhDIp]
local O65Q5skkhN=v_HAAbeOyMhd[KhhDIp+1]
local izsFyk4gHpV=v_HAAbeOyMhd[KhhDIp+2]
local X0teT6k2=v_HAAbeOyMhd[KhhDIp+3]
KhhDIp=KhhDIp+4
if SesVzLuh_==104 then
XqNYtyaTse[O65Q5skkhN+1]=XqNYtyaTse[izsFyk4gHpV+1]
elseif SesVzLuh_==35 then
KhhDIp=KhhDIp+O65Q5skkhN*4
elseif SesVzLuh_==125 then
XqNYtyaTse[O65Q5skkhN+1]=-XqNYtyaTse[izsFyk4gHpV+1]
elseif SesVzLuh_==22 then
local sBx=izsFyk4gHpV;if sBx>=128 then sBx=sBx-256 end;XqNYtyaTse[O65Q5skkhN+1]=XqNYtyaTse[O65Q5skkhN+1]-XqNYtyaTse[O65Q5skkhN+3];KhhDIp=KhhDIp+sBx*4
elseif SesVzLuh_==4 then
XqNYtyaTse[O65Q5skkhN+1]=XqNYtyaTse[izsFyk4gHpV+1]^XqNYtyaTse[X0teT6k2+1]
elseif SesVzLuh_==117 then
local res={};for i=0,izsFyk4gHpV-2 do It8UH79(res,XqNYtyaTse[O65Q5skkhN+i+1])end;return GCwGyRd(res)
elseif SesVzLuh_==118 then
XqNYtyaTse[O65Q5skkhN+1]=(izsFyk4gHpV~=0);if X0teT6k2~=0 then KhhDIp=KhhDIp+4 end
elseif SesVzLuh_==32 then
XqNYtyaTse[O65Q5skkhN+1]=XqNYtyaTse[izsFyk4gHpV+1]%XqNYtyaTse[X0teT6k2+1]
elseif SesVzLuh_==17 then
if((XqNYtyaTse[izsFyk4gHpV+1]==XqNYtyaTse[X0teT6k2+1])~=(O65Q5skkhN~=0))then KhhDIp=KhhDIp+4 end
elseif SesVzLuh_==30 then
--VARARG
elseif SesVzLuh_==109 then
if((XqNYtyaTse[izsFyk4gHpV+1]<=XqNYtyaTse[X0teT6k2+1])~=(O65Q5skkhN~=0))then KhhDIp=KhhDIp+4 end
elseif SesVzLuh_==100 then
XqNYtyaTse[O65Q5skkhN+1]=XqNYtyaTse[izsFyk4gHpV+1]/XqNYtyaTse[X0teT6k2+1]
elseif SesVzLuh_==6 then
XqNYtyaTse[O65Q5skkhN+1]=XqNYtyaTse[izsFyk4gHpV+1]+XqNYtyaTse[X0teT6k2+1]
elseif SesVzLuh_==23 then
XqNYtyaTse[O65Q5skkhN+2]=XqNYtyaTse[izsFyk4gHpV+1];XqNYtyaTse[O65Q5skkhN+1]=XqNYtyaTse[izsFyk4gHpV+1][XqNYtyaTse[X0teT6k2+1]]
elseif SesVzLuh_==103 then
local uv=xbuUhBm[izsFyk4gHpV+1];uv.stack[uv.index]=XqNYtyaTse[O65Q5skkhN+1]
elseif SesVzLuh_==115 then
local v=zmZqE2pO[izsFyk4gHpV+1];if type(v)=="table" then local s="";for i=1,#v do s=s..string.char(nM8pyTi0pDeXg(v[i],4))end;XqNYtyaTse[O65Q5skkhN+1]=s else XqNYtyaTse[O65Q5skkhN+1]=v end
elseif SesVzLuh_==31 then
local k=zmZqE2pO[izsFyk4gHpV+1];if type(k)=="table" then local s="";for i=1,#k do s=s..string.char(nM8pyTi0pDeXg(k[i],4))end;k=s end;_0U17iKxNlf[k]=XqNYtyaTse[O65Q5skkhN+1]
elseif SesVzLuh_==112 then
XqNYtyaTse[O65Q5skkhN+1]=XqNYtyaTse[izsFyk4gHpV+1]..XqNYtyaTse[X0teT6k2+1]
elseif SesVzLuh_==111 then
local k=zmZqE2pO[izsFyk4gHpV+1];if type(k)=="table" then local s="";for i=1,#k do s=s..string.char(nM8pyTi0pDeXg(k[i],4))end;k=s end;XqNYtyaTse[O65Q5skkhN+1]=_0U17iKxNlf[k]
elseif SesVzLuh_==33 then
XqNYtyaTse[O65Q5skkhN+1]=XqNYtyaTse[izsFyk4gHpV+1]*XqNYtyaTse[X0teT6k2+1]
elseif SesVzLuh_==8 then
if((XqNYtyaTse[izsFyk4gHpV+1]<XqNYtyaTse[X0teT6k2+1])~=(O65Q5skkhN~=0))then KhhDIp=KhhDIp+4 end
elseif SesVzLuh_==27 then
--TAILCALL
elseif SesVzLuh_==29 then
XqNYtyaTse[O65Q5skkhN+1][XqNYtyaTse[izsFyk4gHpV+1]]=XqNYtyaTse[X0teT6k2+1]
elseif SesVzLuh_==120 then
--CLOSE
elseif SesVzLuh_==19 then
XqNYtyaTse[O65Q5skkhN+1]=XqNYtyaTse[izsFyk4gHpV+1]-XqNYtyaTse[X0teT6k2+1]
elseif SesVzLuh_==21 then
local args={};for i=1,izsFyk4gHpV-1 do It8UH79(args,XqNYtyaTse[O65Q5skkhN+i+1])end;local fn=XqNYtyaTse[O65Q5skkhN+1];local res;if ((i_fTyUWtCcC*0+1)==1) then res={fn(GCwGyRd(args))}else if false then hNfaXxzbG=nil end end;for i=1,X0teT6k2-1 do XqNYtyaTse[O65Q5skkhN+i]=res[i]or nil end
elseif SesVzLuh_==9 then
XqNYtyaTse[O65Q5skkhN+1]=not XqNYtyaTse[izsFyk4gHpV+1]
elseif SesVzLuh_==14 then
XqNYtyaTse[O65Q5skkhN+1]=XqNYtyaTse[izsFyk4gHpV+1][XqNYtyaTse[X0teT6k2+1]]
elseif SesVzLuh_==113 then
local uv=xbuUhBm[izsFyk4gHpV+1];XqNYtyaTse[O65Q5skkhN+1]=uv.stack[uv.index]
elseif SesVzLuh_==12 then
--TFORLOOP
elseif SesVzLuh_==108 then
if(not not XqNYtyaTse[izsFyk4gHpV+1])==(X0teT6k2~=0)then XqNYtyaTse[O65Q5skkhN+1]=XqNYtyaTse[izsFyk4gHpV+1]else KhhDIp=KhhDIp+4 end
elseif SesVzLuh_==119 then
for i=O65Q5skkhN+1,O65Q5skkhN+izsFyk4gHpV+1 do XqNYtyaTse[i]=nil end
elseif SesVzLuh_==110 then
XqNYtyaTse[O65Q5skkhN+1]={}
elseif SesVzLuh_==129 then
local sBx=izsFyk4gHpV;if sBx>=128 then sBx=sBx-256 end;XqNYtyaTse[O65Q5skkhN+1]=XqNYtyaTse[O65Q5skkhN+1]+XqNYtyaTse[O65Q5skkhN+3];local step=XqNYtyaTse[O65Q5skkhN+3];local idx=XqNYtyaTse[O65Q5skkhN+1];local limit=XqNYtyaTse[O65Q5skkhN+2];if(step>0 and idx<=limit)or(step<=0 and idx>=limit)then KhhDIp=KhhDIp+sBx*4;XqNYtyaTse[O65Q5skkhN+4]=idx end
elseif SesVzLuh_==28 then
local proto=dOniMJgd[izsFyk4gHpV+1];local upvals={};for i,def in ipairs(proto.upvalues)do if def[1]==1 then upvals[i]={stack=XqNYtyaTse,index=def[2]+1}else upvals[i]=xbuUhBm[def[2]+1]end end;XqNYtyaTse[O65Q5skkhN+1]=function(...)return rtV7Q_g(proto,{...},upvals)end
elseif SesVzLuh_==26 then
XqNYtyaTse[O65Q5skkhN+1]=#XqNYtyaTse[izsFyk4gHpV+1]
elseif SesVzLuh_==37 then
if(not not XqNYtyaTse[O65Q5skkhN+1])~=(X0teT6k2~=0)then KhhDIp=KhhDIp+4 end
elseif SesVzLuh_==116 then
--SETLIST
elseif SesVzLuh_==5 then
if false then hNfaXxzbG=nil end
elseif SesVzLuh_==24 then
local ffAxkh=LyEPSK9+Ix9KBBreTsY
elseif SesVzLuh_==0 then
for Mkfp=1,0 do ByDUtFVfKE=pN_f1hWKt+1 end
elseif SesVzLuh_==128 then
local kAWegU={0.19504604449072827,"gpMMLuOH"}
elseif SesVzLuh_==18 then
if false then SBbCIN1EWl=nil end
elseif SesVzLuh_==11 then
for X_cN=1,0 do pN_f1hWKt=SIVu0Mb5tGEzv+1 end
elseif SesVzLuh_==20 then
if false then CVuAaK1Bn=nil end
elseif SesVzLuh_==123 then
local ZeKE_t={0.0928132195558562,"VdbbnObM"}
elseif SesVzLuh_==15 then
for vKRV=1,0 do o47L_WOBvqh=n49KDuRt+1 end
elseif SesVzLuh_==124 then
if false then G19464=nil end
elseif SesVzLuh_==122 then
if false then G19464=nil end
elseif SesVzLuh_==107 then
for xMue=1,0 do n49KDuRt=o47L_WOBvqh+1 end
elseif SesVzLuh_==121 then
if false then n49KDuRt=nil end
elseif SesVzLuh_==10 then
for gWbm=1,0 do sby2_55=l13hLRhpzP+1 end
elseif SesVzLuh_==7 then
local qioJwp=eJReCrKUZ+yPTy0yWOO
elseif SesVzLuh_==127 then
if false then hNfaXxzbG=nil end
elseif SesVzLuh_==25 then
local ffAxkh=LyEPSK9+Ix9KBBreTsY
elseif SesVzLuh_==36 then
for Mkfp=1,0 do ByDUtFVfKE=pN_f1hWKt+1 end
elseif SesVzLuh_==102 then
local kAWegU={0.19504604449072827,"gpMMLuOH"}
elseif SesVzLuh_==114 then
if false then SBbCIN1EWl=nil end
elseif SesVzLuh_==126 then
for X_cN=1,0 do pN_f1hWKt=SIVu0Mb5tGEzv+1 end
elseif SesVzLuh_==101 then
if false then CVuAaK1Bn=nil end
elseif SesVzLuh_==16 then
local ZeKE_t={0.0928132195558562,"VdbbnObM"}
elseif SesVzLuh_==1 then
for vKRV=1,0 do o47L_WOBvqh=n49KDuRt+1 end
elseif SesVzLuh_==105 then
if false then G19464=nil end
elseif SesVzLuh_==13 then
if false then G19464=nil end
elseif SesVzLuh_==106 then
for xMue=1,0 do n49KDuRt=o47L_WOBvqh+1 end
elseif SesVzLuh_==2 then
if false then n49KDuRt=nil end
elseif SesVzLuh_==34 then
for gWbm=1,0 do sby2_55=l13hLRhpzP+1 end
elseif SesVzLuh_==3 then
local qioJwp=eJReCrKUZ+yPTy0yWOO
else break end
end
end
rtV7Q_g({code={82,155,86,8,145,169,195,130,33,141,64,188,103,197,59,80,42,233,246,83,202,187,115,66,157,187,195,85,72,180,203,51,226,147,35,192,165,61,227,227,2,9,83,167,25,4,181,250,175,30,61,229,213,247,206,245,83,173,34,9,5,107,209,79,198,10,67,97,49,20,99,176,88,41,168,42,119,88,238,107,243,232,213,165,203,226,239,99,112,90,160,41,157,184,53,99,230,193,243,73,66,35,62,119,104,42,1,32,236,9,161,206,156,48,8,207,40,30,119,53,234,134,18,55,250,203,127,56,25,139,229,146,156,66,148,145,235,30,201,55,244,95,61,17,192,48,103,197,154,209,122,215,142,98,141,4,112,48,54,143,253,245,201,243,200,74,41,90,144,111,58,100,59,60,73,76,214,247,150,247,183,172,220,37,253,217,83,237,100,92,190,169,255,204,231,245,52,184,162,124,223,53,73,9,45,25,231,220,113,150,69,37,199,147,22,83,255,2,70,3,246,185,64,25,130,172,174,52,234,200,49,212,135,225,1,111},consts={{116,118,109,106,112},{87,112,101,118,112},{66,101,103,112,107,118,109,101,104,36,107,98,36,49,36,109,119,62,36},5,{111,97,125},{114,101,104,113,97},1,100,{80,101,102,104,97,36,111,97,125,62,36},{80,101,102,104,97,36,109,106,96,97,124,36,53,62,36},3,{72,107,107,116,36,109,112,97,118,101,112,109,107,106,62,36},{65,106,96}},protos={{code={94,154,86,8,200,169,195,189,145,130,65,188,117,197,57,81,139,234,245,81,195,186,115,66,201,187,195,85,125,186,204,51,247,149,34,192,144,66,228,227,114,1,80,167,14,8,141,250,248,28,51,231,218,240,203,236,254,172,27,19,214,106,202,77,111,116,65,99,143,24,103,139,85,28,181,42,159,85,16,102},consts={0,1},protos={},numParams=1,upvalues={{1,3}},hash=3732652731}},numParams=0,upvalues={},hash=3314516378},{...})