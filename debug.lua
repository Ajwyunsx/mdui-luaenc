--[[Lua Obfuscator v3.0]]
local iiVheXfOha8I1=function()return true end
local N4w2pMoS="HvekqeQZ"
local J5JHAGYIfl="lWNMywcW"
local CVSy4Ig9vkIN=538
local Sx1HL9B="YZJwURPV"
local eyqHMZnCfYst="FjyZAkbO"
local N6wUUvAH4r1g=505
local qzJZd2="NpT_TYbf"
local dfrOniSrjO1="HKSkpmAD"
local QG4Sdu9j="UdosAarl"
local eTTGmkg7=245
local rByIg9ZI=661
local ayinpxoR="oQvqKwcw"
local idFkCM9MTI6L="xhYZDOpp"
local UKI5qYGga=594
local PkzI37ATt57I="rx_MhIgJ"
local U2uSoShw=629
local cPub8jkrLyYVG=283
local SIxJr6zkwS=576
local TRyAqb7H591q=700
local kUrFtnHv=354
local iaIPhhJYEO="zumuFZTG"
local _Ih78N=405
local VJcZ68Hf="QFNaQJej"
local mBux35G=369
local FvdPKD=574
local UGPE0S="IRyv_PIh"
local oWUrLUdNaSm0F="yYIwN_FV"
local sJs_YwelBtaZU=603
local fTGMjVnDhqwY3="ioOLSQsf"
local SCZrf_n4A="HnnlXUWx"
local IO7Itan=493
local LHUGkUHkfLWXM=559
local GZ0vWpVkNi=897
local RKCipUOhU1xA="kVaYEota"
local PDMpXU2CiDr="hOjxRlnq"
local oCwPzQ2j3J=640
local clIYulOmHR=679
local PihPlTdZ4w="lXFsWeGq"
local CRddm3zTPI="HnVPmgtM"
local K7KNKIcs_eDYK="eXVhnupJ"
local qolcgz09=557
local OM99jXc=295
local _XPAHytRJrNIG=431
local LMLw8a3wDsMe=853
local gdzajFrpF41K=888
local Pf9cw5phPY="IraXBiZo"
local MDQApvW5e=528
local ZjBuz8SmbtD7="oNapeOPs"
local j7wmCLSzu=535
local v7YsdAF="PhNRxsgB"
local dCcZNnmIiMbDu=(os and os.time and os.time())or(tick and tick())or 1
local JenvM1Z=table.insert
local LO5M7vQfYRniS=table.unpack or unpack
local xA1JkQjc83On=_G or _ENV or{}
local MQVUOx=function(a,b)local p,c=1,0;while a>0 and b>0 do local ra,rb=a%2,b%2;if ra~=rb then c=c+p end;a,b,p=(a-ra)/2,(b-rb)/2,p*2 end;if a<b then a=b end;while a>0 do local ra=a%2;if ra>0 then c=c+p end;a,p=(a-ra)/2,p*2 end;return c end
local wMt1bVZDUcY=function(data,keys)local r={};for i=1,#data do local v=data[i];for j=#keys,1,-1 do local k=keys[j];v=v-k[((i-1)%#k)+1];if v<0 then v=v+256 end end;r[i]=v end;return r end
local r2q4yKe=function(data,seed)local state=seed;local taps=0x80200003;local r={};for i=1,#data do local lsb=state%2;state=math.floor(state/2);if lsb==1 then state=MQVUOx(state,taps)end;r[i]=MQVUOx(data[i],state%256)end;return r end
local gOGToruPCCJ6=function(data,a,b,c,d,seed)local r={};local x=seed;for i=1,#data do local y=((i-1)*7+13)%256;local z=((i-1)*11+17)%256;local f=(a*x*x*x+b*y*y+c*z+d)%256;r[i]=(data[i]-f)%256;x=(x*17+(i-1)+31)%256 end;return r end
local J87bBMtBOy=function(data,cs,len)if #data~=len then return false end;local sum=0;for i=1,#data do sum=sum+data[i]end;return(sum%65536)==cs end
local tLLPs_x3hCEtb=function(arr,xk)local s="";for i=1,#arr do local b=MQVUOx(arr[i],MQVUOx(xk,(i-1)%256));s=s..string.char(b)end;return s end
local function RDSaTC3(chunk,args,upvals)
local key1,key2,key3={106,95,183,143,135,239,120,205,191,10,162,30,79,200,182,7},{145,10,68,103,159,178,84,99},{77,7,19,135}
local raw=chunk.code
if not J87bBMtBOy(raw,chunk.cs,chunk.len)then error("Tampered")end
local dec=r2q4yKe(raw,13560)
dec=gOGToruPCCJ6(dec,19,11,14,45,31)
local Apsqw_W=wMt1bVZDUcY(dec,{key3,key2,key1})
local ShfPfQyM={};for i,v in ipairs(chunk.consts)do if type(v)=="table"then ShfPfQyM[i]=tLLPs_x3hCEtb(v,218)else ShfPfQyM[i]=v end end
local WTQ6N5cO0sM=chunk.protos
local bNx_hm=upvals or{}
local tcF1fT_jql={}
for i=1,#(args or{})do tcF1fT_jql[i]=args[i]end
local L4CHZO=1
while (1==1) do
local MYFjGPsWldg=Apsqw_W[L4CHZO]
local OKtd7xPc=Apsqw_W[L4CHZO+1]
local MrRauJjqw=Apsqw_W[L4CHZO+2]
local CNalPO_xi=Apsqw_W[L4CHZO+3]
L4CHZO=L4CHZO+4
if MYFjGPsWldg==0 then
tcF1fT_jql[OKtd7xPc+1]=tcF1fT_jql[MrRauJjqw+1]*tcF1fT_jql[CNalPO_xi+1]
elseif MYFjGPsWldg==102 then
--CLOSE
elseif MYFjGPsWldg==120 then
tcF1fT_jql[OKtd7xPc+1]=xA1JkQjc83On[ShfPfQyM[MrRauJjqw+1]]
elseif MYFjGPsWldg==106 then
tcF1fT_jql[OKtd7xPc+1]=-tcF1fT_jql[MrRauJjqw+1]
elseif MYFjGPsWldg==100 then
if((tcF1fT_jql[MrRauJjqw+1]<=tcF1fT_jql[CNalPO_xi+1])~=(OKtd7xPc~=0))then L4CHZO=L4CHZO+4 end
elseif MYFjGPsWldg==129 then
tcF1fT_jql[OKtd7xPc+1]=not tcF1fT_jql[MrRauJjqw+1]
elseif MYFjGPsWldg==110 then
--VARARG
elseif MYFjGPsWldg==32 then
--TFORLOOP
elseif MYFjGPsWldg==15 then
local uv=bNx_hm[MrRauJjqw+1];tcF1fT_jql[OKtd7xPc+1]=uv.stack[uv.index]
elseif MYFjGPsWldg==113 then
tcF1fT_jql[OKtd7xPc+1]=(MrRauJjqw~=0);if CNalPO_xi~=0 then L4CHZO=L4CHZO+4 end
elseif MYFjGPsWldg==127 then
tcF1fT_jql[OKtd7xPc+1][tcF1fT_jql[MrRauJjqw+1]]=tcF1fT_jql[CNalPO_xi+1]
elseif MYFjGPsWldg==24 then
L4CHZO=L4CHZO+OKtd7xPc*4
elseif MYFjGPsWldg==2 then
tcF1fT_jql[OKtd7xPc+1]=tcF1fT_jql[MrRauJjqw+1]^tcF1fT_jql[CNalPO_xi+1]
elseif MYFjGPsWldg==105 then
if(not not tcF1fT_jql[OKtd7xPc+1])~=(CNalPO_xi~=0)then L4CHZO=L4CHZO+4 end
elseif MYFjGPsWldg==116 then
--SETLIST
elseif MYFjGPsWldg==17 then
if((tcF1fT_jql[MrRauJjqw+1]==tcF1fT_jql[CNalPO_xi+1])~=(OKtd7xPc~=0))then L4CHZO=L4CHZO+4 end
elseif MYFjGPsWldg==12 then
tcF1fT_jql[OKtd7xPc+1]=tcF1fT_jql[MrRauJjqw+1]/tcF1fT_jql[CNalPO_xi+1]
elseif MYFjGPsWldg==124 then
local sBx=MrRauJjqw;if sBx>=128 then sBx=sBx-256 end;tcF1fT_jql[OKtd7xPc+1]=tcF1fT_jql[OKtd7xPc+1]+tcF1fT_jql[OKtd7xPc+3];local step=tcF1fT_jql[OKtd7xPc+3];local idx=tcF1fT_jql[OKtd7xPc+1];local limit=tcF1fT_jql[OKtd7xPc+2];if(step>0 and idx<=limit)or(step<=0 and idx>=limit)then L4CHZO=L4CHZO+sBx*4;tcF1fT_jql[OKtd7xPc+4]=idx end
elseif MYFjGPsWldg==11 then
if((tcF1fT_jql[MrRauJjqw+1]<tcF1fT_jql[CNalPO_xi+1])~=(OKtd7xPc~=0))then L4CHZO=L4CHZO+4 end
elseif MYFjGPsWldg==111 then
tcF1fT_jql[OKtd7xPc+1]=#tcF1fT_jql[MrRauJjqw+1]
elseif MYFjGPsWldg==23 then
for i=OKtd7xPc+1,OKtd7xPc+MrRauJjqw+1 do tcF1fT_jql[i]=nil end
elseif MYFjGPsWldg==112 then
tcF1fT_jql[OKtd7xPc+1]=tcF1fT_jql[MrRauJjqw+1][tcF1fT_jql[CNalPO_xi+1]]
elseif MYFjGPsWldg==27 then
tcF1fT_jql[OKtd7xPc+2]=tcF1fT_jql[MrRauJjqw+1];tcF1fT_jql[OKtd7xPc+1]=tcF1fT_jql[MrRauJjqw+1][tcF1fT_jql[CNalPO_xi+1]]
elseif MYFjGPsWldg==117 then
tcF1fT_jql[OKtd7xPc+1]=tcF1fT_jql[MrRauJjqw+1]%tcF1fT_jql[CNalPO_xi+1]
elseif MYFjGPsWldg==25 then
if(not not tcF1fT_jql[MrRauJjqw+1])==(CNalPO_xi~=0)then tcF1fT_jql[OKtd7xPc+1]=tcF1fT_jql[MrRauJjqw+1]else L4CHZO=L4CHZO+4 end
elseif MYFjGPsWldg==16 then
tcF1fT_jql[OKtd7xPc+1]=ShfPfQyM[MrRauJjqw+1]
elseif MYFjGPsWldg==101 then
--TAILCALL
elseif MYFjGPsWldg==115 then
local sBx=MrRauJjqw;if sBx>=128 then sBx=sBx-256 end;tcF1fT_jql[OKtd7xPc+1]=tcF1fT_jql[OKtd7xPc+1]-tcF1fT_jql[OKtd7xPc+3];L4CHZO=L4CHZO+sBx*4
elseif MYFjGPsWldg==36 then
local uv=bNx_hm[MrRauJjqw+1];uv.stack[uv.index]=tcF1fT_jql[OKtd7xPc+1]
elseif MYFjGPsWldg==19 then
local res={};for i=0,MrRauJjqw-2 do JenvM1Z(res,tcF1fT_jql[OKtd7xPc+i+1])end;return LO5M7vQfYRniS(res)
elseif MYFjGPsWldg==31 then
tcF1fT_jql[OKtd7xPc+1]={}
elseif MYFjGPsWldg==109 then
tcF1fT_jql[OKtd7xPc+1]=tcF1fT_jql[MrRauJjqw+1]-tcF1fT_jql[CNalPO_xi+1]
elseif MYFjGPsWldg==26 then
local args={};for i=1,MrRauJjqw-1 do JenvM1Z(args,tcF1fT_jql[OKtd7xPc+i+1])end;local fn=tcF1fT_jql[OKtd7xPc+1];local res;if (1==1) then res={fn(LO5M7vQfYRniS(args))}else if false then v7YsdAF=nil end end;for i=1,CNalPO_xi-1 do tcF1fT_jql[OKtd7xPc+i]=res[i]or nil end
elseif MYFjGPsWldg==1 then
tcF1fT_jql[OKtd7xPc+1]=tcF1fT_jql[MrRauJjqw+1]
elseif MYFjGPsWldg==122 then
tcF1fT_jql[OKtd7xPc+1]=tcF1fT_jql[MrRauJjqw+1]+tcF1fT_jql[CNalPO_xi+1]
elseif MYFjGPsWldg==126 then
xA1JkQjc83On[ShfPfQyM[MrRauJjqw+1]]=tcF1fT_jql[OKtd7xPc+1]
elseif MYFjGPsWldg==33 then
tcF1fT_jql[OKtd7xPc+1]=tcF1fT_jql[MrRauJjqw+1]..tcF1fT_jql[CNalPO_xi+1]
elseif MYFjGPsWldg==14 then
local proto=WTQ6N5cO0sM[MrRauJjqw+1];local upvals={};for i,def in ipairs(proto.upvalues)do if def[1]==1 then upvals[i]={stack=tcF1fT_jql,index=def[2]+1}else upvals[i]=bNx_hm[def[2]+1]end end;tcF1fT_jql[OKtd7xPc+1]=function(...)return RDSaTC3(proto,{...},upvals)end
elseif MYFjGPsWldg==8 then
if false then v7YsdAF=nil end
elseif MYFjGPsWldg==20 then
local nJUHNH={0.00479818724666603,"PAYFfeuJ"}
elseif MYFjGPsWldg==22 then
if false then RKCipUOhU1xA=nil end
elseif MYFjGPsWldg==104 then
local DmetsV=Pf9cw5phPY+Pf9cw5phPY
elseif MYFjGPsWldg==108 then
local qRcwOW={0.4363825634993721,"YWeNgRiH"}
elseif MYFjGPsWldg==35 then
if false then GZ0vWpVkNi=nil end
elseif MYFjGPsWldg==121 then
local NwtKVJ=kUrFtnHv+v7YsdAF
elseif MYFjGPsWldg==4 then
for wrAo=1,0 do cPub8jkrLyYVG=Pf9cw5phPY+1 end
elseif MYFjGPsWldg==118 then
local HTJUVB=PihPlTdZ4w+j7wmCLSzu
elseif MYFjGPsWldg==107 then
for zPkY=1,0 do iaIPhhJYEO=LMLw8a3wDsMe+1 end
elseif MYFjGPsWldg==37 then
for ktHD=1,0 do eyqHMZnCfYst=iaIPhhJYEO+1 end
elseif MYFjGPsWldg==119 then
local VkWfIO=QG4Sdu9j+qzJZd2
elseif MYFjGPsWldg==18 then
if false then N4w2pMoS=nil end
elseif MYFjGPsWldg==7 then
local VkFabO=eyqHMZnCfYst+RKCipUOhU1xA
elseif MYFjGPsWldg==123 then
for LnKW=1,0 do oCwPzQ2j3J=kUrFtnHv+1 end
elseif MYFjGPsWldg==29 then
if false then v7YsdAF=nil end
elseif MYFjGPsWldg==28 then
local nJUHNH={0.00479818724666603,"PAYFfeuJ"}
elseif MYFjGPsWldg==125 then
if false then RKCipUOhU1xA=nil end
elseif MYFjGPsWldg==5 then
local DmetsV=Pf9cw5phPY+Pf9cw5phPY
elseif MYFjGPsWldg==9 then
local qRcwOW={0.4363825634993721,"YWeNgRiH"}
elseif MYFjGPsWldg==3 then
if false then GZ0vWpVkNi=nil end
elseif MYFjGPsWldg==13 then
local NwtKVJ=kUrFtnHv+v7YsdAF
elseif MYFjGPsWldg==30 then
for wrAo=1,0 do cPub8jkrLyYVG=Pf9cw5phPY+1 end
elseif MYFjGPsWldg==34 then
local HTJUVB=PihPlTdZ4w+j7wmCLSzu
elseif MYFjGPsWldg==114 then
for zPkY=1,0 do iaIPhhJYEO=LMLw8a3wDsMe+1 end
elseif MYFjGPsWldg==103 then
for ktHD=1,0 do eyqHMZnCfYst=iaIPhhJYEO+1 end
elseif MYFjGPsWldg==10 then
local VkWfIO=QG4Sdu9j+qzJZd2
elseif MYFjGPsWldg==21 then
if false then N4w2pMoS=nil end
elseif MYFjGPsWldg==6 then
local VkFabO=eyqHMZnCfYst+RKCipUOhU1xA
elseif MYFjGPsWldg==128 then
for LnKW=1,0 do oCwPzQ2j3J=kUrFtnHv+1 end
else break end
end
end
RDSaTC3({code={87,67,71,227,35,85,251,134,133,5,240,104,208,51,83,184,246,124,187,10,104,225,54,251,4,248,41,191,244,150,242,226,89,230,43,4,91,139,52,115,68,196,220,47,152,233,27,15,22,238,207,224,98,114,89,69,53,246,96,140,109,23,83,162,17,58,129,96,192,235,232,174,33,152,61,107,124,115,190,87,112,245,129,123,162,43,20,205,240,161,56,222,189,138,51,38,35,209,54,40,29,226,251,46,25,83,28,234,56,181,9,164,174,152,5,106,13,2,31,209,74,14,162,87,147,212,119,144,1,166,65,160,161,174,190,252,24,194,141,17,190,8,241,43,34,64,170,84,231,149,128,18,61,100,76,211,137,203,198,59,215,155,31,92,102,67,200,201,8,175,8,186,177,37,184,131,14,228,193,43,209,28,155,93,255,104,50,225,83,92,68,120,12,245,201,154,108,93,141,232,35,11,136,130,14,51,32,224,105,180,165,173,113,90,30,15,55,22,234,108,255,38,255,3,237,218,24,111,38,144,233,120,146,165,97,19},consts={{170,169,177,183,170},{137,175,185,171,170},{156,186,187,173,177,173,181,188,190,243,191,183,246,226,244,188,185,241,232},5,{177,190,161},{172,186,180,172,187},1,100,{142,186,186,181,187,255,183,184,171,233,240},{142,186,186,181,187,255,181,179,182,182,168,241,231,237,244},3,{150,180,183,169,254,182,168,184,160,178,164,184,185,185,238,245},{159,181,188}},protos={{code={191,64,71,227,51,85,251,129,189,6,247,104,64,51,77,187,79,125,184,4,199,238,54,251,100,248,41,191,5,148,241,226,78,24,42,4,105,130,51,115,92,220,217,47,150,237,3,15,127,232,201,238,115,119,92,124,193,247,111,134,70,16,84,160,14,48,131,126,208,247,236,165,48,133,62,107,16,100,180,104},consts={0,1},protos={},numParams=1,upvalues={{1,3}},cs=10046,len=80}},numParams=0,upvalues={},cs=28754,len=236},{...})