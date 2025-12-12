--[[Lua Obfuscator v3.0]]
local rdT7_Dw_kK5y=function()return true end
local QycJTx6Sa="xKsNHaEO"
local RjEbTbA=32
local BaVF1g6LpST9=27
local NvboOS6Q="MAZLrsEc"
local lhvzajeumV8=461
local OS273oK=273
local m0zpWjwk2Fw5="ROcUGyDw"
local ojjg02RtU9Q=627
local shTBSB7Lcbgl="dWUMKxNo"
local XEytDhPt0=992
local yQiEU4="Kfzag_ud"
local JDPwiGyGWkA="ioeqTDVJ"
local _XidTl=944
local gIKlMi="HSI_wxdx"
local _BNZxBlQWL=616
local LEu5ZSTMh0JZy="zQZcIjOE"
local sYBNpqc2=488
local oRsFqLeJC_Tm="NVUimiKh"
local AiuYgn_aQG2="GnrlJTiL"
local KDNXk_UahZck="dnlcTjGe"
local ViVrsEpyKJO="cJzMrXgY"
local GUeKNCLQi61=957
local kfjAhwj6wNj6g=995
local s8XIhTR6UBuJ="eaGoCiIU"
local Q8G6X1_F7="fxrCrOIc"
local v83xilq5cvVMz="rNsTPHnM"
local pVTpdK=545
local CM5abR=182
local iUhcX5b5aZ8Tw="ccGvLYXp"
local YroJ2ArC_L3k="hIGjpZlL"
local pyiW91=723
local vdW9Nl=338
local IHGQ0ogSfkdM=420
local ySEjJ_d=27
local EEr6E5GloC=133
local ViKPcNorfci=458
local MgIbOlR3C7=984
local fkywTREp=317
local HCEOZ_y7=873
local FQpnv2jPAk=881
local iRAG9QoknpmB=908
local LYXgA9_Dk7n3="AbAchpCs"
local YwXZIIO2="JAFxEFdJ"
local RncuekahWLQMm=479
local SY5u8C_="KqHzEajX"
local hUEv3I2="WyerUuLN"
local Igvi8e="ZpvXXErK"
local Mz_GMWC="MiaITCoa"
local NBfqh1p=103
local Ah19aI0Nk=517
local MO0X6YIhSss4=(os and os.time and os.time())or(tick and tick())or 1
local rhE4lq5wK=table.insert
local tMj3Bhv=table.unpack or unpack
local YbK9oQiFZk=_G or _ENV or{}
local Xvznunj=bit or bit32 or nil
local qLQ8bv3NU9b
if Xvznunj and Xvznunj.bxor then
qLQ8bv3NU9b=function(a,b)return Xvznunj.bxor(a,b)end
else
qLQ8bv3NU9b=function(a,b)local p,c=1,0;while a>0 and b>0 do local ra,rb=a%2,b%2;if ra~=rb then c=c+p end;a,b,p=(a-ra)/2,(b-rb)/2,p*2 end;if a<b then a=b end;while a>0 do local ra=a%2;if ra>0 then c=c+p end;a,p=(a-ra)/2,p*2 end;return c end
end
local DjELtbLvElo16=function(data,keys)local r={};for i=1,#data do local v=data[i];for j=#keys,1,-1 do local k=keys[j];v=v-k[((i-1)%#k)+1];if v<0 then v=v+256 end end;r[i]=v end;return r end
local m4mruRV=function(data,seed)local state=seed;local taps=2149580803;local r={};for i=1,#data do local lsb=state%2;state=math.floor(state/2);if lsb==1 then state=qLQ8bv3NU9b(state,taps)end;r[i]=qLQ8bv3NU9b(data[i],state%256)end;return r end
local c5Q6q1U=function(data,a,b,c,d,seed)local r={};local x=seed;for i=1,#data do local y=((i-1)*7+13)%256;local z=((i-1)*11+17)%256;local f=(a*x*x*x+b*y*y+c*z+d)%256;r[i]=(data[i]-f)%256;x=(x*17+(i-1)+31)%256 end;return r end
local I4uikcL7_NL=function(data,cs,len)if #data~=len then return false end;local sum=0;for i=1,#data do sum=sum+data[i]end;return(sum%65536)==cs end
local xwszMmEgk6wL=function(arr,xk)local s="";for i=1,#arr do local b=qLQ8bv3NU9b(arr[i],qLQ8bv3NU9b(xk,(i-1)%256));s=s..string.char(b)end;return s end
local function OfPC5VVHiUgY(chunk,args,upvals)
local key1,key2,key3={198,191,19,104,186,183,30,158,111,119,170,155,134,85,72,27},{81,220,173,211,178,62,150,44},{180,232,10,121}
local raw=chunk.code
if not I4uikcL7_NL(raw,chunk.cs,chunk.len)then error("Tampered")end
local dec=m4mruRV(raw,25582)
dec=c5Q6q1U(dec,12,10,26,35,180)
local B5YObUmuME=DjELtbLvElo16(dec,{key3,key2,key1})
local SF6kOH={};for i,v in ipairs(chunk.consts)do if type(v)=="table"then SF6kOH[i]=xwszMmEgk6wL(v,184)else SF6kOH[i]=v end end
local YhvbGyhU7V=chunk.protos
local XPa8U1KuHj1zh=upvals or{}
local o9XT23tLYl4sh={}
for i=1,#(args or{})do o9XT23tLYl4sh[i]=args[i]end
local bDG0fVj=1
while (type(MO0X6YIhSss4)==type(MO0X6YIhSss4)) do
local gAR71Jw=B5YObUmuME[bDG0fVj]
local yvPGNVkd=B5YObUmuME[bDG0fVj+1]
local kvMfnXr25z86z=B5YObUmuME[bDG0fVj+2]
local iRMadnHKJz=B5YObUmuME[bDG0fVj+3]
bDG0fVj=bDG0fVj+4
if gAR71Jw==13 then
bDG0fVj=bDG0fVj+yvPGNVkd*4
elseif gAR71Jw==123 then
local res={};for i=0,kvMfnXr25z86z-2 do rhE4lq5wK(res,o9XT23tLYl4sh[yvPGNVkd+i+1])end;return tMj3Bhv(res)
elseif gAR71Jw==102 then
o9XT23tLYl4sh[yvPGNVkd+1]=(kvMfnXr25z86z~=0);if iRMadnHKJz~=0 then bDG0fVj=bDG0fVj+4 end
elseif gAR71Jw==29 then
o9XT23tLYl4sh[yvPGNVkd+1]=not o9XT23tLYl4sh[kvMfnXr25z86z+1]
elseif gAR71Jw==18 then
o9XT23tLYl4sh[yvPGNVkd+2]=o9XT23tLYl4sh[kvMfnXr25z86z+1];o9XT23tLYl4sh[yvPGNVkd+1]=o9XT23tLYl4sh[kvMfnXr25z86z+1][o9XT23tLYl4sh[iRMadnHKJz+1]]
elseif gAR71Jw==26 then
if((o9XT23tLYl4sh[kvMfnXr25z86z+1]==o9XT23tLYl4sh[iRMadnHKJz+1])~=(yvPGNVkd~=0))then bDG0fVj=bDG0fVj+4 end
elseif gAR71Jw==125 then
o9XT23tLYl4sh[yvPGNVkd+1]=o9XT23tLYl4sh[kvMfnXr25z86z+1]-o9XT23tLYl4sh[iRMadnHKJz+1]
elseif gAR71Jw==8 then
--TAILCALL
elseif gAR71Jw==35 then
if((o9XT23tLYl4sh[kvMfnXr25z86z+1]<=o9XT23tLYl4sh[iRMadnHKJz+1])~=(yvPGNVkd~=0))then bDG0fVj=bDG0fVj+4 end
elseif gAR71Jw==103 then
--CLOSE
elseif gAR71Jw==114 then
YbK9oQiFZk[SF6kOH[kvMfnXr25z86z+1]]=o9XT23tLYl4sh[yvPGNVkd+1]
elseif gAR71Jw==106 then
for i=yvPGNVkd+1,yvPGNVkd+kvMfnXr25z86z+1 do o9XT23tLYl4sh[i]=nil end
elseif gAR71Jw==9 then
o9XT23tLYl4sh[yvPGNVkd+1]=o9XT23tLYl4sh[kvMfnXr25z86z+1]/o9XT23tLYl4sh[iRMadnHKJz+1]
elseif gAR71Jw==112 then
o9XT23tLYl4sh[yvPGNVkd+1]=o9XT23tLYl4sh[kvMfnXr25z86z+1][o9XT23tLYl4sh[iRMadnHKJz+1]]
elseif gAR71Jw==122 then
--VARARG
elseif gAR71Jw==113 then
o9XT23tLYl4sh[yvPGNVkd+1]=o9XT23tLYl4sh[kvMfnXr25z86z+1]%o9XT23tLYl4sh[iRMadnHKJz+1]
elseif gAR71Jw==34 then
o9XT23tLYl4sh[yvPGNVkd+1]={}
elseif gAR71Jw==115 then
local sBx=kvMfnXr25z86z;if sBx>=128 then sBx=sBx-256 end;o9XT23tLYl4sh[yvPGNVkd+1]=o9XT23tLYl4sh[yvPGNVkd+1]-o9XT23tLYl4sh[yvPGNVkd+3];bDG0fVj=bDG0fVj+sBx*4
elseif gAR71Jw==27 then
o9XT23tLYl4sh[yvPGNVkd+1][o9XT23tLYl4sh[kvMfnXr25z86z+1]]=o9XT23tLYl4sh[iRMadnHKJz+1]
elseif gAR71Jw==25 then
--TFORLOOP
elseif gAR71Jw==3 then
if(not not o9XT23tLYl4sh[kvMfnXr25z86z+1])==(iRMadnHKJz~=0)then o9XT23tLYl4sh[yvPGNVkd+1]=o9XT23tLYl4sh[kvMfnXr25z86z+1]else bDG0fVj=bDG0fVj+4 end
elseif gAR71Jw==111 then
o9XT23tLYl4sh[yvPGNVkd+1]=o9XT23tLYl4sh[kvMfnXr25z86z+1]..o9XT23tLYl4sh[iRMadnHKJz+1]
elseif gAR71Jw==107 then
o9XT23tLYl4sh[yvPGNVkd+1]=o9XT23tLYl4sh[kvMfnXr25z86z+1]
elseif gAR71Jw==10 then
local proto=YhvbGyhU7V[kvMfnXr25z86z+1];local upvals={};for i,def in ipairs(proto.upvalues)do if def[1]==1 then upvals[i]={stack=o9XT23tLYl4sh,index=def[2]+1}else upvals[i]=XPa8U1KuHj1zh[def[2]+1]end end;o9XT23tLYl4sh[yvPGNVkd+1]=function(...)return OfPC5VVHiUgY(proto,{...},upvals)end
elseif gAR71Jw==104 then
o9XT23tLYl4sh[yvPGNVkd+1]=o9XT23tLYl4sh[kvMfnXr25z86z+1]*o9XT23tLYl4sh[iRMadnHKJz+1]
elseif gAR71Jw==129 then
if((o9XT23tLYl4sh[kvMfnXr25z86z+1]<o9XT23tLYl4sh[iRMadnHKJz+1])~=(yvPGNVkd~=0))then bDG0fVj=bDG0fVj+4 end
elseif gAR71Jw==124 then
local uv=XPa8U1KuHj1zh[kvMfnXr25z86z+1];uv.stack[uv.index]=o9XT23tLYl4sh[yvPGNVkd+1]
elseif gAR71Jw==20 then
o9XT23tLYl4sh[yvPGNVkd+1]=SF6kOH[kvMfnXr25z86z+1]
elseif gAR71Jw==120 then
o9XT23tLYl4sh[yvPGNVkd+1]=-o9XT23tLYl4sh[kvMfnXr25z86z+1]
elseif gAR71Jw==2 then
if(not not o9XT23tLYl4sh[yvPGNVkd+1])~=(iRMadnHKJz~=0)then bDG0fVj=bDG0fVj+4 end
elseif gAR71Jw==119 then
local args={};for i=1,kvMfnXr25z86z-1 do rhE4lq5wK(args,o9XT23tLYl4sh[yvPGNVkd+i+1])end;local fn=o9XT23tLYl4sh[yvPGNVkd+1];local res;if (type(MO0X6YIhSss4)==type(MO0X6YIhSss4)) then res={fn(tMj3Bhv(args))}else local BtgVLZ=lhvzajeumV8+RncuekahWLQMm end;for i=1,iRMadnHKJz-1 do o9XT23tLYl4sh[yvPGNVkd+i]=res[i]or nil end
elseif gAR71Jw==22 then
o9XT23tLYl4sh[yvPGNVkd+1]=YbK9oQiFZk[SF6kOH[kvMfnXr25z86z+1]]
elseif gAR71Jw==19 then
--SETLIST
elseif gAR71Jw==37 then
local uv=XPa8U1KuHj1zh[kvMfnXr25z86z+1];o9XT23tLYl4sh[yvPGNVkd+1]=uv.stack[uv.index]
elseif gAR71Jw==128 then
local sBx=kvMfnXr25z86z;if sBx>=128 then sBx=sBx-256 end;o9XT23tLYl4sh[yvPGNVkd+1]=o9XT23tLYl4sh[yvPGNVkd+1]+o9XT23tLYl4sh[yvPGNVkd+3];local step=o9XT23tLYl4sh[yvPGNVkd+3];local idx=o9XT23tLYl4sh[yvPGNVkd+1];local limit=o9XT23tLYl4sh[yvPGNVkd+2];if(step>0 and idx<=limit)or(step<=0 and idx>=limit)then bDG0fVj=bDG0fVj+sBx*4;o9XT23tLYl4sh[yvPGNVkd+4]=idx end
elseif gAR71Jw==24 then
o9XT23tLYl4sh[yvPGNVkd+1]=#o9XT23tLYl4sh[kvMfnXr25z86z+1]
elseif gAR71Jw==109 then
o9XT23tLYl4sh[yvPGNVkd+1]=o9XT23tLYl4sh[kvMfnXr25z86z+1]^o9XT23tLYl4sh[iRMadnHKJz+1]
elseif gAR71Jw==116 then
o9XT23tLYl4sh[yvPGNVkd+1]=o9XT23tLYl4sh[kvMfnXr25z86z+1]+o9XT23tLYl4sh[iRMadnHKJz+1]
elseif gAR71Jw==126 then
local BtgVLZ=lhvzajeumV8+RncuekahWLQMm
elseif gAR71Jw==6 then
local opYqUA=fkywTREp+_BNZxBlQWL
elseif gAR71Jw==0 then
local GiosHG={0.6995334096923234,"RKsTdJHC"}
elseif gAR71Jw==7 then
local mCLVvS=Mz_GMWC+NBfqh1p
elseif gAR71Jw==100 then
local KNiumV=FQpnv2jPAk+BaVF1g6LpST9
elseif gAR71Jw==1 then
local yazkLr=vdW9Nl+MgIbOlR3C7
elseif gAR71Jw==110 then
if false then oRsFqLeJC_Tm=nil end
elseif gAR71Jw==117 then
local Bhwrgq=GUeKNCLQi61+fkywTREp
elseif gAR71Jw==4 then
for HtXV=1,0 do ViVrsEpyKJO=HCEOZ_y7+1 end
elseif gAR71Jw==32 then
for lwHG=1,0 do CM5abR=GUeKNCLQi61+1 end
elseif gAR71Jw==12 then
for AGPu=1,0 do CM5abR=s8XIhTR6UBuJ+1 end
elseif gAR71Jw==30 then
local HAbrkC=Igvi8e+kfjAhwj6wNj6g
elseif gAR71Jw==105 then
if false then CM5abR=nil end
elseif gAR71Jw==127 then
local MOxSVR={0.7911132537396937,"nIAKZTcz"}
elseif gAR71Jw==15 then
local ogivmb=Q8G6X1_F7+fkywTREp
elseif gAR71Jw==11 then
local BtgVLZ=lhvzajeumV8+RncuekahWLQMm
elseif gAR71Jw==21 then
local opYqUA=fkywTREp+_BNZxBlQWL
elseif gAR71Jw==23 then
local GiosHG={0.6995334096923234,"RKsTdJHC"}
elseif gAR71Jw==33 then
local mCLVvS=Mz_GMWC+NBfqh1p
elseif gAR71Jw==121 then
local KNiumV=FQpnv2jPAk+BaVF1g6LpST9
elseif gAR71Jw==16 then
local yazkLr=vdW9Nl+MgIbOlR3C7
elseif gAR71Jw==17 then
if false then oRsFqLeJC_Tm=nil end
elseif gAR71Jw==108 then
local Bhwrgq=GUeKNCLQi61+fkywTREp
elseif gAR71Jw==118 then
for HtXV=1,0 do ViVrsEpyKJO=HCEOZ_y7+1 end
elseif gAR71Jw==28 then
for lwHG=1,0 do CM5abR=GUeKNCLQi61+1 end
elseif gAR71Jw==31 then
for AGPu=1,0 do CM5abR=s8XIhTR6UBuJ+1 end
elseif gAR71Jw==36 then
local HAbrkC=Igvi8e+kfjAhwj6wNj6g
elseif gAR71Jw==101 then
if false then CM5abR=nil end
elseif gAR71Jw==5 then
local MOxSVR={0.7911132537396937,"nIAKZTcz"}
elseif gAR71Jw==14 then
local ogivmb=Q8G6X1_F7+fkywTREp
else break end
end
end
OfPC5VVHiUgY({code={175,90,93,45,181,49,179,25,125,101,150,114,4,125,2,101,24,64,113,252,46,95,37,18,85,108,241,193,174,123,97,86,221,14,176,217,239,66,123,248,238,49,1,59,195,195,100,85,224,86,191,27,25,141,127,131,215,107,183,253,196,228,111,222,76,121,203,102,42,55,133,132,112,91,243,193,174,73,237,7,76,237,42,86,162,160,42,17,144,54,92,56,11,145,35,112,128,126,7,128,0,120,156,245,43,30,41,177,111,13,131,39,146,182,203,214,134,21,69,47,197,46,156,109,76,148,109,223,179,206,26,141,101,183,57,163,32,38,123,27,26,202,42,115,152,25,90,151,64,208,237,228,14,246,33,191,133,9,109,223,157,56,36,145,178,202,53,223,151,35,42,57,194,91,61,116,92,183,190,156,70,176,238,243,198,36,164,104,25,225,255,136,210,196,45,144,172,32,122,105,159,193,17,160,57,203,170,191,9,246,225,173,90,206,159,79,143,126,230,94,203,152,170,52,87,95,76,150,23,232,45,209,195,35,118,2},consts={{200,203,211,213,200},{235,205,219,201,200},{254,216,217,207,211,207,215,222,220,145,221,213,148,128,150,222,219,147,138},5,{211,220,195},{206,216,214,206,217},1,100,{236,216,216,215,217,157,213,218,201,139,146},{236,216,216,215,217,157,215,209,212,212,202,147,133,143,150},3,{244,214,213,203,156,212,202,218,194,208,198,218,219,219,140,151},{253,215,222}},protos={{code={161,91,93,45,70,49,179,24,122,98,151,114,3,125,252,106,9,71,112,250,38,94,37,18,76,108,241,193,71,121,98,86,166,4,183,217,255,61,116,248,233,201,2,59,133,63,156,85,244,88,185,29,164,138,114,184,201,106,142,247,208,155,104,208,145,115,201,96,222,59,137,129,153,166,206,193,14,182,231,20},consts={0,1},protos={},numParams=1,upvalues={{1,3}},cs=10274,len=80}},numParams=0,upvalues={},cs=28910,len=236},{...})