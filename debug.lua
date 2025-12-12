--[[Lua Obfuscator v3.0]]
local zAGpv_sWKt6Y=function()return true end
local To_ZHCf="spurgrLU"
local J_ng9klo0YV=102
local ZFkEzpX="qkjofjAs"
local lvOfUjvCIvO=516
local DunI_Kfk18vqk=590
local x3eBdQ8wEfNNH=584
local E6U2xbi="EWqyVlAI"
local nuPC1Qr2=945
local NR8JHO="JYvpFzDn"
local YefrTK=397
local qLf9ayQPm0P58="GfoHkmJl"
local ENVbCD="EIThSMsN"
local comoV9c5="lvezJTlG"
local WDyxygx7EcLyv=433
local MD_doaEZCt=675
local OXkAhaJUFB="YIgzFFmQ"
local Jz6CX57=82
local KpJWU9662Q=906
local Ax0YElwj7FzYa="qrBqk_KK"
local pzz5yw912nJ="gBeDXw_b"
local fdX3nQdnZr_=142
local YjHVak5KJGjr="rkK_ItMc"
local KxHMWSHg="TPwSowkW"
local DpcZRGpbKqgJ=540
local vE84Pfm8ts4J="VxbAOdcc"
local FWlJ9FDs1V="heUkGOtf"
local qPzNxn=417
local BJ8VtLl=771
local Nw_4PqNLCXc1=939
local R7KODyYJ=799
local fe98e2DmNAJxd="NLVzNubW"
local IB2LKGLDd="updmpXdR"
local lfvh0S="EvwyFZrT"
local Kz6g3n2UCRF="jiWenZAS"
local lV73M7=579
local CEDBIE3oCC="rTqGTPXk"
local fashjVR8Qd=987
local XwPPNva=630
local H8VpV0="tlvthcXz"
local mEaMgYBvC8QEH="WTCNOIhw"
local V4KrPcIT=795
local QTNfYm=955
local JT2cJ3xOlN3x4="kyEqkMZE"
local eD5jwOXAT2="BKcYdufB"
local dyVtN8="hnmSFDvZ"
local gjSx7sLLX0=330
local DRklx6VAIl="KLorVyiH"
local hzYCFRmIio=290
local iIFr9NyC18E="yGIdLrHI"
local P_TSHL=368
local SCirPzZicNKh=(os and os.time and os.time())or(tick and tick())or 1
local KKidcP=table.insert
local hhEFhxWw=table.unpack or unpack
local BOSDRFUgGv=_G or _ENV or{}
local pfcyuaxIL=function(a,b)local p,c=1,0;while a>0 and b>0 do local ra,rb=a%2,b%2;if ra~=rb then c=c+p end;a,b,p=(a-ra)/2,(b-rb)/2,p*2 end;if a<b then a=b end;while a>0 do local ra=a%2;if ra>0 then c=c+p end;a,p=(a-ra)/2,p*2 end;return c end
local vVB3R7l=function(data,keys)local r={};for i=1,#data do local v=data[i];for j=#keys,1,-1 do local k=keys[j];v=v-k[((i-1)%#k)+1];if v<0 then v=v+256 end end;r[i]=v end;return r end
local R8aE_v_=function(data,seed)local state=seed;local taps=0x80200003;local r={};for i=1,#data do local lsb=state%2;state=math.floor(state/2);if lsb==1 then state=pfcyuaxIL(state,taps)end;r[i]=pfcyuaxIL(data[i],state%256)end;return r end
local qgfx1oYh2=function(data,a,b,c,d,seed)local r={};local x=seed;for i=1,#data do local y=((i-1)*7+13)%256;local z=((i-1)*11+17)%256;local f=(a*x*x*x+b*y*y+c*z+d)%256;r[i]=(data[i]-f)%256;x=(x*17+(i-1)+31)%256 end;return r end
local e1c_FsIIx=function(data,cs,len)if #data~=len then return false end;local sum=0;for i=1,#data do sum=sum+data[i]end;return(sum%65536)==cs end
local function DzvRmNsK0(chunk,args,upvals)
local key1,key2,key3={81,23,249,195,227,214,91,73,181,184,6,143,178,51,140,16},{89,199,10,23,39,235,219,84},{227,59,149,34}
local raw=chunk.code
if not e1c_FsIIx(raw,chunk.cs,chunk.len)then error("Tampered")end
local dec=R8aE_v_(raw,51865)
dec=qgfx1oYh2(dec,10,26,26,23,118)
local PFjqKGj8=vVB3R7l(dec,{key3,key2,key1})
local qe4Nuaf1i=chunk.consts
local UB3WaxC=chunk.protos
local F6SfBAxV6=upvals or{}
local FZow4DQ={}
for i=1,#(args or{})do FZow4DQ[i]=args[i]end
local DYa9QgWqk=1
while (1==1) do
local zzXUTmiQWl_h=PFjqKGj8[DYa9QgWqk]
local sEqxEx=PFjqKGj8[DYa9QgWqk+1]
local LPc_e0ZdK17=PFjqKGj8[DYa9QgWqk+2]
local ziuinRZ7mv=PFjqKGj8[DYa9QgWqk+3]
DYa9QgWqk=DYa9QgWqk+4
if zzXUTmiQWl_h==35 then
local uv=F6SfBAxV6[LPc_e0ZdK17+1];FZow4DQ[sEqxEx+1]=uv.stack[uv.index]
elseif zzXUTmiQWl_h==123 then
FZow4DQ[sEqxEx+1]={}
elseif zzXUTmiQWl_h==2 then
if((FZow4DQ[LPc_e0ZdK17+1]<=FZow4DQ[ziuinRZ7mv+1])~=(sEqxEx~=0))then DYa9QgWqk=DYa9QgWqk+4 end
elseif zzXUTmiQWl_h==24 then
local uv=F6SfBAxV6[LPc_e0ZdK17+1];uv.stack[uv.index]=FZow4DQ[sEqxEx+1]
elseif zzXUTmiQWl_h==106 then
local res={};for i=0,LPc_e0ZdK17-2 do KKidcP(res,FZow4DQ[sEqxEx+i+1])end;return hhEFhxWw(res)
elseif zzXUTmiQWl_h==102 then
FZow4DQ[sEqxEx+1]=-FZow4DQ[LPc_e0ZdK17+1]
elseif zzXUTmiQWl_h==112 then
local k=qe4Nuaf1i[LPc_e0ZdK17+1];if type(k)=="table" then local s="";for i=1,#k do s=s..string.char(pfcyuaxIL(k[i],14))end;k=s end;BOSDRFUgGv[k]=FZow4DQ[sEqxEx+1]
elseif zzXUTmiQWl_h==13 then
if(not not FZow4DQ[sEqxEx+1])~=(ziuinRZ7mv~=0)then DYa9QgWqk=DYa9QgWqk+4 end
elseif zzXUTmiQWl_h==30 then
local k=qe4Nuaf1i[LPc_e0ZdK17+1];if type(k)=="table" then local s="";for i=1,#k do s=s..string.char(pfcyuaxIL(k[i],14))end;k=s end;FZow4DQ[sEqxEx+1]=BOSDRFUgGv[k]
elseif zzXUTmiQWl_h==114 then
--VARARG
elseif zzXUTmiQWl_h==31 then
--SETLIST
elseif zzXUTmiQWl_h==126 then
--TFORLOOP
elseif zzXUTmiQWl_h==23 then
if((FZow4DQ[LPc_e0ZdK17+1]==FZow4DQ[ziuinRZ7mv+1])~=(sEqxEx~=0))then DYa9QgWqk=DYa9QgWqk+4 end
elseif zzXUTmiQWl_h==3 then
FZow4DQ[sEqxEx+1]=#FZow4DQ[LPc_e0ZdK17+1]
elseif zzXUTmiQWl_h==129 then
DYa9QgWqk=DYa9QgWqk+sEqxEx*4
elseif zzXUTmiQWl_h==4 then
FZow4DQ[sEqxEx+1][FZow4DQ[LPc_e0ZdK17+1]]=FZow4DQ[ziuinRZ7mv+1]
elseif zzXUTmiQWl_h==105 then
FZow4DQ[sEqxEx+1]=FZow4DQ[LPc_e0ZdK17+1]-FZow4DQ[ziuinRZ7mv+1]
elseif zzXUTmiQWl_h==29 then
local v=qe4Nuaf1i[LPc_e0ZdK17+1];if type(v)=="table" then local s="";for i=1,#v do s=s..string.char(pfcyuaxIL(v[i],14))end;FZow4DQ[sEqxEx+1]=s else FZow4DQ[sEqxEx+1]=v end
elseif zzXUTmiQWl_h==109 then
local args={};for i=1,LPc_e0ZdK17-1 do KKidcP(args,FZow4DQ[sEqxEx+i+1])end;local fn=FZow4DQ[sEqxEx+1];local res;if (1==1) then res={fn(hhEFhxWw(args))}else local vAMcao=eD5jwOXAT2+lvOfUjvCIvO end;for i=1,ziuinRZ7mv-1 do FZow4DQ[sEqxEx+i]=res[i]or nil end
elseif zzXUTmiQWl_h==128 then
FZow4DQ[sEqxEx+1]=FZow4DQ[LPc_e0ZdK17+1]/FZow4DQ[ziuinRZ7mv+1]
elseif zzXUTmiQWl_h==36 then
if((FZow4DQ[LPc_e0ZdK17+1]<FZow4DQ[ziuinRZ7mv+1])~=(sEqxEx~=0))then DYa9QgWqk=DYa9QgWqk+4 end
elseif zzXUTmiQWl_h==120 then
FZow4DQ[sEqxEx+1]=FZow4DQ[LPc_e0ZdK17+1][FZow4DQ[ziuinRZ7mv+1]]
elseif zzXUTmiQWl_h==16 then
FZow4DQ[sEqxEx+1]=FZow4DQ[LPc_e0ZdK17+1]^FZow4DQ[ziuinRZ7mv+1]
elseif zzXUTmiQWl_h==7 then
--TAILCALL
elseif zzXUTmiQWl_h==125 then
FZow4DQ[sEqxEx+1]=FZow4DQ[LPc_e0ZdK17+1]%FZow4DQ[ziuinRZ7mv+1]
elseif zzXUTmiQWl_h==6 then
FZow4DQ[sEqxEx+1]=not FZow4DQ[LPc_e0ZdK17+1]
elseif zzXUTmiQWl_h==104 then
FZow4DQ[sEqxEx+2]=FZow4DQ[LPc_e0ZdK17+1];FZow4DQ[sEqxEx+1]=FZow4DQ[LPc_e0ZdK17+1][FZow4DQ[ziuinRZ7mv+1]]
elseif zzXUTmiQWl_h==28 then
local proto=UB3WaxC[LPc_e0ZdK17+1];local upvals={};for i,def in ipairs(proto.upvalues)do if def[1]==1 then upvals[i]={stack=FZow4DQ,index=def[2]+1}else upvals[i]=F6SfBAxV6[def[2]+1]end end;FZow4DQ[sEqxEx+1]=function(...)return DzvRmNsK0(proto,{...},upvals)end
elseif zzXUTmiQWl_h==115 then
--CLOSE
elseif zzXUTmiQWl_h==113 then
FZow4DQ[sEqxEx+1]=FZow4DQ[LPc_e0ZdK17+1]
elseif zzXUTmiQWl_h==108 then
FZow4DQ[sEqxEx+1]=FZow4DQ[LPc_e0ZdK17+1]..FZow4DQ[ziuinRZ7mv+1]
elseif zzXUTmiQWl_h==122 then
FZow4DQ[sEqxEx+1]=FZow4DQ[LPc_e0ZdK17+1]+FZow4DQ[ziuinRZ7mv+1]
elseif zzXUTmiQWl_h==118 then
if(not not FZow4DQ[LPc_e0ZdK17+1])==(ziuinRZ7mv~=0)then FZow4DQ[sEqxEx+1]=FZow4DQ[LPc_e0ZdK17+1]else DYa9QgWqk=DYa9QgWqk+4 end
elseif zzXUTmiQWl_h==26 then
FZow4DQ[sEqxEx+1]=FZow4DQ[LPc_e0ZdK17+1]*FZow4DQ[ziuinRZ7mv+1]
elseif zzXUTmiQWl_h==20 then
FZow4DQ[sEqxEx+1]=(LPc_e0ZdK17~=0);if ziuinRZ7mv~=0 then DYa9QgWqk=DYa9QgWqk+4 end
elseif zzXUTmiQWl_h==22 then
for i=sEqxEx+1,sEqxEx+LPc_e0ZdK17+1 do FZow4DQ[i]=nil end
elseif zzXUTmiQWl_h==14 then
local sBx=LPc_e0ZdK17;if sBx>=128 then sBx=sBx-256 end;FZow4DQ[sEqxEx+1]=FZow4DQ[sEqxEx+1]+FZow4DQ[sEqxEx+3];local step=FZow4DQ[sEqxEx+3];local idx=FZow4DQ[sEqxEx+1];local limit=FZow4DQ[sEqxEx+2];if(step>0 and idx<=limit)or(step<=0 and idx>=limit)then DYa9QgWqk=DYa9QgWqk+sBx*4;FZow4DQ[sEqxEx+4]=idx end
elseif zzXUTmiQWl_h==124 then
local sBx=LPc_e0ZdK17;if sBx>=128 then sBx=sBx-256 end;FZow4DQ[sEqxEx+1]=FZow4DQ[sEqxEx+1]-FZow4DQ[sEqxEx+3];DYa9QgWqk=DYa9QgWqk+sBx*4
elseif zzXUTmiQWl_h==117 then
local vAMcao=eD5jwOXAT2+lvOfUjvCIvO
elseif zzXUTmiQWl_h==8 then
for P_Jl=1,0 do gjSx7sLLX0=MD_doaEZCt+1 end
elseif zzXUTmiQWl_h==34 then
local ZcwPWo={0.8356937738918002,"WhDrAnNW"}
elseif zzXUTmiQWl_h==10 then
local XlFQUB=lvOfUjvCIvO+Ax0YElwj7FzYa
elseif zzXUTmiQWl_h==0 then
for alpq=1,0 do fdX3nQdnZr_=lV73M7+1 end
elseif zzXUTmiQWl_h==15 then
if false then ZFkEzpX=nil end
elseif zzXUTmiQWl_h==18 then
for FwMw=1,0 do Kz6g3n2UCRF=fe98e2DmNAJxd+1 end
elseif zzXUTmiQWl_h==107 then
if false then mEaMgYBvC8QEH=nil end
elseif zzXUTmiQWl_h==121 then
local HgjhDa=comoV9c5+comoV9c5
elseif zzXUTmiQWl_h==27 then
local esAHun=KxHMWSHg+XwPPNva
elseif zzXUTmiQWl_h==101 then
for lYHi=1,0 do hzYCFRmIio=lV73M7+1 end
elseif zzXUTmiQWl_h==21 then
if false then FWlJ9FDs1V=nil end
elseif zzXUTmiQWl_h==116 then
local BBgpeZ=IB2LKGLDd+H8VpV0
elseif zzXUTmiQWl_h==119 then
if false then Jz6CX57=nil end
elseif zzXUTmiQWl_h==19 then
for cuSO=1,0 do hzYCFRmIio=DpcZRGpbKqgJ+1 end
elseif zzXUTmiQWl_h==12 then
local vAMcao=eD5jwOXAT2+lvOfUjvCIvO
elseif zzXUTmiQWl_h==1 then
for P_Jl=1,0 do gjSx7sLLX0=MD_doaEZCt+1 end
elseif zzXUTmiQWl_h==127 then
local ZcwPWo={0.8356937738918002,"WhDrAnNW"}
elseif zzXUTmiQWl_h==25 then
local XlFQUB=lvOfUjvCIvO+Ax0YElwj7FzYa
elseif zzXUTmiQWl_h==103 then
for alpq=1,0 do fdX3nQdnZr_=lV73M7+1 end
elseif zzXUTmiQWl_h==17 then
if false then ZFkEzpX=nil end
elseif zzXUTmiQWl_h==37 then
for FwMw=1,0 do Kz6g3n2UCRF=fe98e2DmNAJxd+1 end
elseif zzXUTmiQWl_h==110 then
if false then mEaMgYBvC8QEH=nil end
elseif zzXUTmiQWl_h==32 then
local HgjhDa=comoV9c5+comoV9c5
elseif zzXUTmiQWl_h==5 then
local esAHun=KxHMWSHg+XwPPNva
elseif zzXUTmiQWl_h==100 then
for lYHi=1,0 do hzYCFRmIio=lV73M7+1 end
elseif zzXUTmiQWl_h==111 then
if false then FWlJ9FDs1V=nil end
elseif zzXUTmiQWl_h==9 then
local BBgpeZ=IB2LKGLDd+H8VpV0
elseif zzXUTmiQWl_h==33 then
if false then Jz6CX57=nil end
elseif zzXUTmiQWl_h==11 then
for cuSO=1,0 do hzYCFRmIio=DpcZRGpbKqgJ+1 end
else break end
end
end
DzvRmNsK0({code={217,14,131,214,54,170,116,128,12,20,92,213,135,56,187,129,37,171,123,237,202,199,234,39,143,182,197,241,229,202,190,155,72,29,54,94,82,146,254,247,212,246,20,166,29,243,148,248,122,189,29,110,56,216,23,114,95,56,220,169,85,12,107,35,211,165,121,75,87,32,17,83,166,212,153,210,212,33,149,70,177,10,150,68,195,183,15,182,126,121,180,194,196,194,141,238,50,40,136,96,13,164,27,172,58,159,139,10,39,15,238,187,141,195,14,211,175,44,39,223,206,143,174,74,103,9,68,215,12,13,244,46,202,78,221,28,66,173,196,221,175,141,158,210,26,17,250,115,90,223,162,209,20,172,177,27,172,229,231,117,190,80,204,97,162,10,112,119,64,188,143,222,33,198,76,220,88,111,62,128,32,89,13,164,109,101,206,231,206,126,99,149,111,51,129,114,25,135,119,49,208,114,210,164,128,167,228,79,160,155,40,70,193,187,74,215,96,15,201,70,145,235,32,248,198,30,171,2,128,141,103,221,93,149,76,45},consts={{126,124,103,96,122},{93,122,111,124,122},{72,111,109,122,97,124,103,111,98,46,97,104,46,59,46,103,125,52,46},5,{101,107,119},{120,111,98,123,107},1,100,{90,111,108,98,107,46,101,107,119,52,46},{90,111,108,98,107,46,103,96,106,107,118,46,63,52,46},3,{66,97,97,126,46,103,122,107,124,111,122,103,97,96,52,46},{75,96,106}},protos={{code={218,15,131,214,80,170,116,129,168,21,93,213,36,56,185,130,140,172,122,211,251,192,234,39,104,182,197,241,9,200,185,155,180,7,49,94,105,155,255,247,112,254,27,166,175,247,172,248,118,67,27,80,233,213,16,105,87,59,213,211,105,11,112,33,197,191,123,181,80,36,21,86,114,199,156,210,190,214,107,73},consts={0,1},protos={},numParams=1,upvalues={{1,3}},cs=10970,len=80}},numParams=0,upvalues={},cs=30517,len=236},{...})