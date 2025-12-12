--[[Lua Obfuscator v3.0]]
local DAOcRhzhu=function()return true end
local p19a4eMTEi=485
local saM8Ctil="rUhSlCSh"
local OFIYYTp0Z="vfWUPPtJ"
local JZdvB5p="yPMasTRl"
local m0rUAs1A6x="hdMCaUU_"
local _Is_pC="OwoLsJcf"
local TNgFIv=480
local rOCVnJRAj2S3="sJLVDLbF"
local nA_FLDH7eLnQ1=578
local c1O4k97lN="HGMMCDyH"
local XhTOYznCyjimY="KcmwSncQ"
local QngGk8=60
local nnjIAPz=157
local fl2nByu6NbfuJ="bjIUDOqR"
local OGfwiMX7="HahoHLgF"
local vLcFBppk43gJ="xyDjiIxs"
local F586SQ5S8U="krEAyzsH"
local f79DCCG=74
local IandlkUFb=905
local OEff3i7haaiPq="GmPQTUXP"
local XKDKX41R4CjjC="fqxCbGaY"
local aSWrrd="xzGOkZZA"
local djaTbJu7=400
local bj78QRXxsaGa6=716
local kIdGSjx="mcvIEsfs"
local vhZAqk="WnzCJMFh"
local F1huhr="KFBdy_SS"
local goYg0PhYjDXL=23
local Eit7WM38DGKA=573
local RZx2nKkh="csmqJ_eT"
local PkpovMx7QHMa="pmYExwoq"
local czEh3GhM7=489
local UCEUwDKl=898
local gocYxhQit="ymzvRKIi"
local jVJUo_Z=291
local jCxIgzztF="WjSpmiZI"
local qGI_FNgHGBjN="LeDFkgvb"
local sEjnN3mJH="sctytJah"
local vnJmgYsk="bEWPFlxw"
local huXlFRL=140
local GqU6APc2_C="bbnYraPX"
local ynhUK8vWZ5="EgmjNWsh"
local t05vy4Cf=470
local Nd6Svrxr=964
local D7rN3E="wOjzeOeE"
local m48GnQYmJcXX=362
local IZikDZKbYM1o=331
local gL2XyHoT=167
local wmHxY4zmrI=424
local Si_LuYw3GBs=360
local IS8LuglSLL3c=(os and os.time and os.time())or(tick and tick())or 1
local qtW0tfAnJTa=table.insert
local jZTGxwkzH0=table.unpack or unpack
local aIlFzDbl=_G or _ENV or{}
local oizeRXLces7LI=function(a,b)local p,c=1,0;while a>0 and b>0 do local ra,rb=a%2,b%2;if ra~=rb then c=c+p end;a,b,p=(a-ra)/2,(b-rb)/2,p*2 end;if a<b then a=b end;while a>0 do local ra=a%2;if ra>0 then c=c+p end;a,p=(a-ra)/2,p*2 end;return c end
local m5MfQtdfKLRbr=function(data,keys)local r={};for i=1,#data do local v=data[i];for j=#keys,1,-1 do local k=keys[j];v=v-k[((i-1)%#k)+1];if v<0 then v=v+256 end end;r[i]=v end;return r end
local zTb3bFCO3Qq=function(data,seed)local state=seed;local taps=0x80200003;local r={};for i=1,#data do local lsb=state%2;state=math.floor(state/2);if lsb==1 then state=oizeRXLces7LI(state,taps)end;r[i]=oizeRXLces7LI(data[i],state%256)end;return r end
local iu0O5jJbao5gV=function(data,a,b,c,d,seed)local r={};local x=seed;for i=1,#data do local y=((i-1)*7+13)%256;local z=((i-1)*11+17)%256;local f=(a*x*x*x+b*y*y+c*z+d)%256;r[i]=(data[i]-f)%256;x=(x*17+(i-1)+31)%256 end;return r end
local yOMC1We0rDZ=function(data,cs,len)if #data~=len then return false end;local sum=0;for i=1,#data do sum=sum+data[i]end;return(sum%65536)==cs end
local function K21KMX(chunk,args,upvals)
local key1,key2,key3={12,218,62,139,221,94,228,42,186,65,199,10,170,112,219,104},{53,46,185,182,33,244,60,74},{229,31,41,6}
local raw=chunk.code
if not yOMC1We0rDZ(raw,chunk.cs,chunk.len)then error("Tampered")end
local dec=zTb3bFCO3Qq(raw,19039)
dec=iu0O5jJbao5gV(dec,12,23,16,16,113)
local lkaFAS=m5MfQtdfKLRbr(dec,{key3,key2,key1})
local XyfGQrdagWsc=chunk.consts
local KCUkV9d3JyLi=chunk.protos
local eEcMUL=upvals or{}
local OjaaPqbH={}
for i=1,#(args or{})do OjaaPqbH[i]=args[i]end
local RvLmt8=1
while ((IS8LuglSLL3c>=0)or(IS8LuglSLL3c<0)) do
local fKFIOLTNjV1=lkaFAS[RvLmt8]
local myl09lm=lkaFAS[RvLmt8+1]
local K_FR9XEHu6J=lkaFAS[RvLmt8+2]
local _xxSlvQY=lkaFAS[RvLmt8+3]
RvLmt8=RvLmt8+4
if fKFIOLTNjV1==111 then
if(not not OjaaPqbH[myl09lm+1])~=(_xxSlvQY~=0)then RvLmt8=RvLmt8+4 end
elseif fKFIOLTNjV1==17 then
for i=myl09lm+1,myl09lm+K_FR9XEHu6J+1 do OjaaPqbH[i]=nil end
elseif fKFIOLTNjV1==33 then
OjaaPqbH[myl09lm+1]=-OjaaPqbH[K_FR9XEHu6J+1]
elseif fKFIOLTNjV1==20 then
--TFORLOOP
elseif fKFIOLTNjV1==4 then
OjaaPqbH[myl09lm+1]=OjaaPqbH[K_FR9XEHu6J+1]/OjaaPqbH[_xxSlvQY+1]
elseif fKFIOLTNjV1==15 then
local sBx=K_FR9XEHu6J;if sBx>=128 then sBx=sBx-256 end;OjaaPqbH[myl09lm+1]=OjaaPqbH[myl09lm+1]+OjaaPqbH[myl09lm+3];local step=OjaaPqbH[myl09lm+3];local idx=OjaaPqbH[myl09lm+1];local limit=OjaaPqbH[myl09lm+2];if(step>0 and idx<=limit)or(step<=0 and idx>=limit)then RvLmt8=RvLmt8+sBx*4;OjaaPqbH[myl09lm+4]=idx end
elseif fKFIOLTNjV1==6 then
if(not not OjaaPqbH[K_FR9XEHu6J+1])==(_xxSlvQY~=0)then OjaaPqbH[myl09lm+1]=OjaaPqbH[K_FR9XEHu6J+1]else RvLmt8=RvLmt8+4 end
elseif fKFIOLTNjV1==18 then
RvLmt8=RvLmt8+myl09lm*4
elseif fKFIOLTNjV1==115 then
aIlFzDbl[XyfGQrdagWsc[K_FR9XEHu6J+1]]=OjaaPqbH[myl09lm+1]
elseif fKFIOLTNjV1==1 then
if((OjaaPqbH[K_FR9XEHu6J+1]<OjaaPqbH[_xxSlvQY+1])~=(myl09lm~=0))then RvLmt8=RvLmt8+4 end
elseif fKFIOLTNjV1==12 then
--SETLIST
elseif fKFIOLTNjV1==119 then
OjaaPqbH[myl09lm+1]=OjaaPqbH[K_FR9XEHu6J+1]-OjaaPqbH[_xxSlvQY+1]
elseif fKFIOLTNjV1==29 then
OjaaPqbH[myl09lm+1]=OjaaPqbH[K_FR9XEHu6J+1]^OjaaPqbH[_xxSlvQY+1]
elseif fKFIOLTNjV1==3 then
OjaaPqbH[myl09lm+1]=OjaaPqbH[K_FR9XEHu6J+1]..OjaaPqbH[_xxSlvQY+1]
elseif fKFIOLTNjV1==129 then
OjaaPqbH[myl09lm+1]=OjaaPqbH[K_FR9XEHu6J+1]+OjaaPqbH[_xxSlvQY+1]
elseif fKFIOLTNjV1==127 then
OjaaPqbH[myl09lm+1]=not OjaaPqbH[K_FR9XEHu6J+1]
elseif fKFIOLTNjV1==112 then
--VARARG
elseif fKFIOLTNjV1==31 then
if((OjaaPqbH[K_FR9XEHu6J+1]==OjaaPqbH[_xxSlvQY+1])~=(myl09lm~=0))then RvLmt8=RvLmt8+4 end
elseif fKFIOLTNjV1==123 then
--CLOSE
elseif fKFIOLTNjV1==21 then
OjaaPqbH[myl09lm+1][OjaaPqbH[K_FR9XEHu6J+1]]=OjaaPqbH[_xxSlvQY+1]
elseif fKFIOLTNjV1==120 then
OjaaPqbH[myl09lm+1]=aIlFzDbl[XyfGQrdagWsc[K_FR9XEHu6J+1]]
elseif fKFIOLTNjV1==23 then
local res={};for i=0,K_FR9XEHu6J-2 do qtW0tfAnJTa(res,OjaaPqbH[myl09lm+i+1])end;return jZTGxwkzH0(res)
elseif fKFIOLTNjV1==0 then
OjaaPqbH[myl09lm+1]=OjaaPqbH[K_FR9XEHu6J+1]%OjaaPqbH[_xxSlvQY+1]
elseif fKFIOLTNjV1==8 then
OjaaPqbH[myl09lm+1]=OjaaPqbH[K_FR9XEHu6J+1]*OjaaPqbH[_xxSlvQY+1]
elseif fKFIOLTNjV1==7 then
local uv=eEcMUL[K_FR9XEHu6J+1];OjaaPqbH[myl09lm+1]=uv.stack[uv.index]
elseif fKFIOLTNjV1==25 then
local args={};for i=1,K_FR9XEHu6J-1 do qtW0tfAnJTa(args,OjaaPqbH[myl09lm+i+1])end;local fn=OjaaPqbH[myl09lm+1];local res;if ((IS8LuglSLL3c>=0)or(IS8LuglSLL3c<0)) then res={fn(jZTGxwkzH0(args))}else local mzGVgE={0.1630605042693194,"USQtSexn"} end;for i=1,_xxSlvQY-1 do OjaaPqbH[myl09lm+i]=res[i]or nil end
elseif fKFIOLTNjV1==122 then
local sBx=K_FR9XEHu6J;if sBx>=128 then sBx=sBx-256 end;OjaaPqbH[myl09lm+1]=OjaaPqbH[myl09lm+1]-OjaaPqbH[myl09lm+3];RvLmt8=RvLmt8+sBx*4
elseif fKFIOLTNjV1==10 then
OjaaPqbH[myl09lm+1]=(K_FR9XEHu6J~=0);if _xxSlvQY~=0 then RvLmt8=RvLmt8+4 end
elseif fKFIOLTNjV1==101 then
OjaaPqbH[myl09lm+1]={}
elseif fKFIOLTNjV1==124 then
OjaaPqbH[myl09lm+1]=XyfGQrdagWsc[K_FR9XEHu6J+1]
elseif fKFIOLTNjV1==11 then
local proto=KCUkV9d3JyLi[K_FR9XEHu6J+1];local upvals={};for i,def in ipairs(proto.upvalues)do if def[1]==1 then upvals[i]={stack=OjaaPqbH,index=def[2]+1}else upvals[i]=eEcMUL[def[2]+1]end end;OjaaPqbH[myl09lm+1]=function(...)return K21KMX(proto,{...},upvals)end
elseif fKFIOLTNjV1==19 then
--TAILCALL
elseif fKFIOLTNjV1==109 then
OjaaPqbH[myl09lm+1]=OjaaPqbH[K_FR9XEHu6J+1]
elseif fKFIOLTNjV1==108 then
if((OjaaPqbH[K_FR9XEHu6J+1]<=OjaaPqbH[_xxSlvQY+1])~=(myl09lm~=0))then RvLmt8=RvLmt8+4 end
elseif fKFIOLTNjV1==26 then
OjaaPqbH[myl09lm+2]=OjaaPqbH[K_FR9XEHu6J+1];OjaaPqbH[myl09lm+1]=OjaaPqbH[K_FR9XEHu6J+1][OjaaPqbH[_xxSlvQY+1]]
elseif fKFIOLTNjV1==9 then
OjaaPqbH[myl09lm+1]=OjaaPqbH[K_FR9XEHu6J+1][OjaaPqbH[_xxSlvQY+1]]
elseif fKFIOLTNjV1==113 then
local uv=eEcMUL[K_FR9XEHu6J+1];uv.stack[uv.index]=OjaaPqbH[myl09lm+1]
elseif fKFIOLTNjV1==2 then
OjaaPqbH[myl09lm+1]=#OjaaPqbH[K_FR9XEHu6J+1]
elseif fKFIOLTNjV1==34 then
local mzGVgE={0.1630605042693194,"USQtSexn"}
elseif fKFIOLTNjV1==102 then
local IzCdiw=F586SQ5S8U+m0rUAs1A6x
elseif fKFIOLTNjV1==36 then
local HRLrhB=f79DCCG+kIdGSjx
elseif fKFIOLTNjV1==116 then
if false then OFIYYTp0Z=nil end
elseif fKFIOLTNjV1==28 then
if false then F586SQ5S8U=nil end
elseif fKFIOLTNjV1==118 then
local XkicVX={0.07235599749239774,"sONVPAls"}
elseif fKFIOLTNjV1==117 then
local NZFqgF=jVJUo_Z+m48GnQYmJcXX
elseif fKFIOLTNjV1==107 then
for qtFw=1,0 do jVJUo_Z=gL2XyHoT+1 end
elseif fKFIOLTNjV1==110 then
if false then XKDKX41R4CjjC=nil end
elseif fKFIOLTNjV1==5 then
local BZWyqC={0.21747707464328503,"coydzeUI"}
elseif fKFIOLTNjV1==125 then
local wxwnhI=vnJmgYsk+qGI_FNgHGBjN
elseif fKFIOLTNjV1==121 then
local HCHWFU={0.9360872102653761,"eDpGVSMZ"}
elseif fKFIOLTNjV1==35 then
for v_zb=1,0 do jCxIgzztF=F586SQ5S8U+1 end
elseif fKFIOLTNjV1==16 then
if false then _Is_pC=nil end
elseif fKFIOLTNjV1==24 then
if false then F586SQ5S8U=nil end
elseif fKFIOLTNjV1==37 then
local mzGVgE={0.1630605042693194,"USQtSexn"}
elseif fKFIOLTNjV1==128 then
local IzCdiw=F586SQ5S8U+m0rUAs1A6x
elseif fKFIOLTNjV1==126 then
local HRLrhB=f79DCCG+kIdGSjx
elseif fKFIOLTNjV1==114 then
if false then OFIYYTp0Z=nil end
elseif fKFIOLTNjV1==30 then
if false then F586SQ5S8U=nil end
elseif fKFIOLTNjV1==100 then
local XkicVX={0.07235599749239774,"sONVPAls"}
elseif fKFIOLTNjV1==22 then
local NZFqgF=jVJUo_Z+m48GnQYmJcXX
elseif fKFIOLTNjV1==13 then
for qtFw=1,0 do jVJUo_Z=gL2XyHoT+1 end
elseif fKFIOLTNjV1==27 then
if false then XKDKX41R4CjjC=nil end
elseif fKFIOLTNjV1==32 then
local BZWyqC={0.21747707464328503,"coydzeUI"}
elseif fKFIOLTNjV1==104 then
local wxwnhI=vnJmgYsk+qGI_FNgHGBjN
elseif fKFIOLTNjV1==106 then
local HCHWFU={0.9360872102653761,"eDpGVSMZ"}
elseif fKFIOLTNjV1==103 then
for v_zb=1,0 do jCxIgzztF=F586SQ5S8U+1 end
elseif fKFIOLTNjV1==105 then
if false then _Is_pC=nil end
elseif fKFIOLTNjV1==14 then
if false then F586SQ5S8U=nil end
else break end
end
end
K21KMX({code={149,113,84,121,232,8,165,51,172,192,145,42,234,180,26,10,187,251,203,36,72,15,70,113,49,41,198,81,100,94,200,114,48,104,32,252,201,81,204,38,197,49,43,86,244,245,248,88,114,218,27,236,132,35,17,65,236,188,53,244,41,197,68,87,219,207,130,210,15,204,199,64,214,246,8,39,215,158,51,221,121,183,228,12,112,205,170,71,73,76,143,90,40,253,98,24,65,203,65,16,127,16,17,241,237,19,26,19,138,187,102,213,231,142,176,237,77,88,21,22,128,62,226,90,190,241,224,69,141,103,82,250,42,115,224,169,97,147,24,241,155,122,70,166,253,57,85,246,166,228,132,34,247,192,192,36,161,51,70,182,211,116,93,67,228,105,210,174,246,233,117,237,170,179,71,146,240,66,36,12,210,82,163,35,184,140,198,49,180,152,62,88,69,247,212,224,13,232,131,51,104,120,120,15,71,60,236,51,111,121,6,128,58,97,127,174,230,192,67,167,64,171,127,150,17,27,241,88,7,48,74,160,232,233,73,38},consts={[[print]],[[Start]],[[Factorial of 5 is: ]],5,[[key]],[[value]],1,100,[[Table key: ]],[[Table index 1: ]],3,[[Loop iteration: ]],[[End]]},protos={{code={145,126,84,121,62,8,165,50,6,223,144,42,135,180,20,11,170,250,202,218,44,8,70,113,151,41,198,81,123,80,203,114,35,98,35,252,23,88,205,38,111,41,40,86,158,249,240,88,6,216,25,146,31,46,22,122,150,189,76,238,213,196,67,85,39,209,188,236,147,200,195,69,33,227,53,39,213,147,9,192},consts={0,1},protos={},numParams=1,upvalues={{1,3}},cs=9399,len=80}},numParams=0,upvalues={},cs=30244,len=236},{...})