--[[Lua Obfuscator v3.0]]
local m30DJEPw=function()return true end
local VaJfhdSQN=755
local m0d5UboC="DDYShRoM"
local LS4uZlu4W="FjYWSRVu"
local qmTUyGs="kFaBmhXF"
local oCahDeK=938
local rRdV0Zm=398
local eSIQVQ9Drot=990
local rRLC8dCP_o="mQmQJDqS"
local YXbN83hsV="HgYmtobb"
local rNKXbsc="bSWNkSru"
local S51rq_dZ51CB="xYqVtYqk"
local JPGGzqxZBMOQK=758
local lsGKGL="OeDifwKa"
local yob2Dk="FmOWjBop"
local xP10Y724X1Up3="vNLxtDEY"
local n3WF7SoVNNS="VQzSNpFF"
local hDeaZODXfl=871
local E2UnKhj2gaQ="ZTvYsWfC"
local fJb4vHxbDGu=436
local ayBU2Gqun=313
local jm9lyFrsTUWn=596
local qUV8GnUBs="GQqdImoU"
local EtLCVC_=238
local ePC2e7eVsC3=499
local MidbTMpzkf8OH=670
local OKvZa4AnCAsZ=37
local gokNTce="QuIFbKgW"
local Bqc9R98=661
local tiYV1e=590
local kAttZTWQfcT2m=76
local FRTwEWeYpYBN=4
local X9cqbIQDNgFO=187
local GJ5WgaGslmTq="uqzSwkDA"
local ydKlQbL="UBCdsogT"
local fzQ0xDmkM=58
local QqXLVBHvek1="rVqrKdiU"
local WX1jJ4=295
local gw3T7vIpn3q=661
local GezzU4="SoJDujTr"
local xJFcNO=54
local TnB0ts4KNNat1="GidVyxyU"
local AQHXsn=961
local jBJ1CVK8ax="nMxcQIfY"
local ClUo3g32v="lxoExdYK"
local cbtdEB7TB4="B_FpwvxI"
local QKNyoEzdvdnOr="whXjParl"
local hGlFoVu4M="JgCNKbJJ"
local DLf6pVqJz=261
local CiGZLnNmvE92=980
local FNHsz8D="nbGjeTEP"
local FRxJ9e=(os and os.time and os.time())or(tick and tick())or 1
local mmpWv8TpWjyO=table.insert
local QaNy8dmI3_=table.unpack or unpack
local Bsf8gq3zGyqf=_G or _ENV or{}
local F8h3xA7WXtPO=function(a,b)local p,c=1,0;while a>0 and b>0 do local ra,rb=a%2,b%2;if ra~=rb then c=c+p end;a,b,p=(a-ra)/2,(b-rb)/2,p*2 end;if a<b then a=b end;while a>0 do local ra=a%2;if ra>0 then c=c+p end;a,p=(a-ra)/2,p*2 end;return c end
local OxptT_BqKCL=function(data,keys)local r={};for i=1,#data do local v=data[i];for j=#keys,1,-1 do local k=keys[j];v=v-k[((i-1)%#k)+1];if v<0 then v=v+256 end end;r[i]=v end;return r end
local GUDGtueS6EqV=function(data,seed)local state=seed;local taps=0x80200003;local r={};for i=1,#data do local lsb=state%2;state=math.floor(state/2);if lsb==1 then state=F8h3xA7WXtPO(state,taps)end;r[i]=F8h3xA7WXtPO(data[i],state%256)end;return r end
local mjBfbNEnpGM=function(data,a,b,c,d,seed)local r={};local x=seed;for i=1,#data do local y=((i-1)*7+13)%256;local z=((i-1)*11+17)%256;local f=(a*x*x*x+b*y*y+c*z+d)%256;r[i]=(data[i]-f)%256;x=(x*17+(i-1)+31)%256 end;return r end
local RhAET344nIz8X=function(data,cs,len)if #data~=len then return false end;local sum=0;for i=1,#data do sum=sum+data[i]end;return(sum%65536)==cs end
local function cK_ZNBhYrgU(chunk,args,upvals)
local key1,key2,key3={182,206,52,160,192,251,121,129,226,108,58,80,103,90,176,74},{127,219,81,21,7,75,164,8},{31,5,22,230}
local raw=chunk.code
if not RhAET344nIz8X(raw,chunk.cs,chunk.len)then error("Tampered")end
local dec=GUDGtueS6EqV(raw,13468)
dec=mjBfbNEnpGM(dec,7,24,26,23,192)
local bLf7q2A=OxptT_BqKCL(dec,{key3,key2,key1})
local OmbK8mjOM9=chunk.consts
local BtjPVRGeV=chunk.protos
local ZHy9yTF5GCP=upvals or{}
local JVFHtdpUh={}
for i=1,#(args or{})do JVFHtdpUh[i]=args[i]end
local zRUiqfbcUOFJ=1
while (not not true) do
local gGTyjEwsR1o=bLf7q2A[zRUiqfbcUOFJ]
local UdgBuhuLDoxJj=bLf7q2A[zRUiqfbcUOFJ+1]
local Vn2NI6vQxDQo=bLf7q2A[zRUiqfbcUOFJ+2]
local kUPmPH7WzWt=bLf7q2A[zRUiqfbcUOFJ+3]
zRUiqfbcUOFJ=zRUiqfbcUOFJ+4
if gGTyjEwsR1o==105 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=JVFHtdpUh[Vn2NI6vQxDQo+1]..JVFHtdpUh[kUPmPH7WzWt+1]
elseif gGTyjEwsR1o==35 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=JVFHtdpUh[Vn2NI6vQxDQo+1]+JVFHtdpUh[kUPmPH7WzWt+1]
elseif gGTyjEwsR1o==114 then
local uv=ZHy9yTF5GCP[Vn2NI6vQxDQo+1];JVFHtdpUh[UdgBuhuLDoxJj+1]=uv.stack[uv.index]
elseif gGTyjEwsR1o==103 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=JVFHtdpUh[Vn2NI6vQxDQo+1]%JVFHtdpUh[kUPmPH7WzWt+1]
elseif gGTyjEwsR1o==4 then
local sBx=Vn2NI6vQxDQo;if sBx>=128 then sBx=sBx-256 end;JVFHtdpUh[UdgBuhuLDoxJj+1]=JVFHtdpUh[UdgBuhuLDoxJj+1]-JVFHtdpUh[UdgBuhuLDoxJj+3];zRUiqfbcUOFJ=zRUiqfbcUOFJ+sBx*4
elseif gGTyjEwsR1o==117 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=JVFHtdpUh[Vn2NI6vQxDQo+1][JVFHtdpUh[kUPmPH7WzWt+1]]
elseif gGTyjEwsR1o==108 then
--CLOSE
elseif gGTyjEwsR1o==125 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=JVFHtdpUh[Vn2NI6vQxDQo+1]^JVFHtdpUh[kUPmPH7WzWt+1]
elseif gGTyjEwsR1o==120 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=-JVFHtdpUh[Vn2NI6vQxDQo+1]
elseif gGTyjEwsR1o==13 then
JVFHtdpUh[UdgBuhuLDoxJj+1]={}
elseif gGTyjEwsR1o==19 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=not JVFHtdpUh[Vn2NI6vQxDQo+1]
elseif gGTyjEwsR1o==122 then
local res={};for i=0,Vn2NI6vQxDQo-2 do mmpWv8TpWjyO(res,JVFHtdpUh[UdgBuhuLDoxJj+i+1])end;return QaNy8dmI3_(res)
elseif gGTyjEwsR1o==5 then
--TAILCALL
elseif gGTyjEwsR1o==116 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=(Vn2NI6vQxDQo~=0);if kUPmPH7WzWt~=0 then zRUiqfbcUOFJ=zRUiqfbcUOFJ+4 end
elseif gGTyjEwsR1o==23 then
local sBx=Vn2NI6vQxDQo;if sBx>=128 then sBx=sBx-256 end;JVFHtdpUh[UdgBuhuLDoxJj+1]=JVFHtdpUh[UdgBuhuLDoxJj+1]+JVFHtdpUh[UdgBuhuLDoxJj+3];local step=JVFHtdpUh[UdgBuhuLDoxJj+3];local idx=JVFHtdpUh[UdgBuhuLDoxJj+1];local limit=JVFHtdpUh[UdgBuhuLDoxJj+2];if(step>0 and idx<=limit)or(step<=0 and idx>=limit)then zRUiqfbcUOFJ=zRUiqfbcUOFJ+sBx*4;JVFHtdpUh[UdgBuhuLDoxJj+4]=idx end
elseif gGTyjEwsR1o==127 then
if(not not JVFHtdpUh[UdgBuhuLDoxJj+1])~=(kUPmPH7WzWt~=0)then zRUiqfbcUOFJ=zRUiqfbcUOFJ+4 end
elseif gGTyjEwsR1o==110 then
for i=UdgBuhuLDoxJj+1,UdgBuhuLDoxJj+Vn2NI6vQxDQo+1 do JVFHtdpUh[i]=nil end
elseif gGTyjEwsR1o==17 then
--SETLIST
elseif gGTyjEwsR1o==124 then
--TFORLOOP
elseif gGTyjEwsR1o==30 then
local args={};for i=1,Vn2NI6vQxDQo-1 do mmpWv8TpWjyO(args,JVFHtdpUh[UdgBuhuLDoxJj+i+1])end;local fn=JVFHtdpUh[UdgBuhuLDoxJj+1];local res;if (not not true) then res={fn(QaNy8dmI3_(args))}else local gVeB_b={0.24098405513747068,"CSqtjetY"} end;for i=1,kUPmPH7WzWt-1 do JVFHtdpUh[UdgBuhuLDoxJj+i]=res[i]or nil end
elseif gGTyjEwsR1o==123 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=JVFHtdpUh[Vn2NI6vQxDQo+1]-JVFHtdpUh[kUPmPH7WzWt+1]
elseif gGTyjEwsR1o==28 then
if((JVFHtdpUh[Vn2NI6vQxDQo+1]<=JVFHtdpUh[kUPmPH7WzWt+1])~=(UdgBuhuLDoxJj~=0))then zRUiqfbcUOFJ=zRUiqfbcUOFJ+4 end
elseif gGTyjEwsR1o==24 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=Bsf8gq3zGyqf[OmbK8mjOM9[Vn2NI6vQxDQo+1]]
elseif gGTyjEwsR1o==15 then
Bsf8gq3zGyqf[OmbK8mjOM9[Vn2NI6vQxDQo+1]]=JVFHtdpUh[UdgBuhuLDoxJj+1]
elseif gGTyjEwsR1o==102 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=#JVFHtdpUh[Vn2NI6vQxDQo+1]
elseif gGTyjEwsR1o==100 then
if((JVFHtdpUh[Vn2NI6vQxDQo+1]==JVFHtdpUh[kUPmPH7WzWt+1])~=(UdgBuhuLDoxJj~=0))then zRUiqfbcUOFJ=zRUiqfbcUOFJ+4 end
elseif gGTyjEwsR1o==8 then
if(not not JVFHtdpUh[Vn2NI6vQxDQo+1])==(kUPmPH7WzWt~=0)then JVFHtdpUh[UdgBuhuLDoxJj+1]=JVFHtdpUh[Vn2NI6vQxDQo+1]else zRUiqfbcUOFJ=zRUiqfbcUOFJ+4 end
elseif gGTyjEwsR1o==104 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=OmbK8mjOM9[Vn2NI6vQxDQo+1]
elseif gGTyjEwsR1o==7 then
local uv=ZHy9yTF5GCP[Vn2NI6vQxDQo+1];uv.stack[uv.index]=JVFHtdpUh[UdgBuhuLDoxJj+1]
elseif gGTyjEwsR1o==14 then
--VARARG
elseif gGTyjEwsR1o==10 then
JVFHtdpUh[UdgBuhuLDoxJj+1][JVFHtdpUh[Vn2NI6vQxDQo+1]]=JVFHtdpUh[kUPmPH7WzWt+1]
elseif gGTyjEwsR1o==37 then
zRUiqfbcUOFJ=zRUiqfbcUOFJ+UdgBuhuLDoxJj*4
elseif gGTyjEwsR1o==6 then
JVFHtdpUh[UdgBuhuLDoxJj+2]=JVFHtdpUh[Vn2NI6vQxDQo+1];JVFHtdpUh[UdgBuhuLDoxJj+1]=JVFHtdpUh[Vn2NI6vQxDQo+1][JVFHtdpUh[kUPmPH7WzWt+1]]
elseif gGTyjEwsR1o==109 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=JVFHtdpUh[Vn2NI6vQxDQo+1]*JVFHtdpUh[kUPmPH7WzWt+1]
elseif gGTyjEwsR1o==112 then
if((JVFHtdpUh[Vn2NI6vQxDQo+1]<JVFHtdpUh[kUPmPH7WzWt+1])~=(UdgBuhuLDoxJj~=0))then zRUiqfbcUOFJ=zRUiqfbcUOFJ+4 end
elseif gGTyjEwsR1o==34 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=JVFHtdpUh[Vn2NI6vQxDQo+1]/JVFHtdpUh[kUPmPH7WzWt+1]
elseif gGTyjEwsR1o==26 then
local proto=BtjPVRGeV[Vn2NI6vQxDQo+1];local upvals={};for i,def in ipairs(proto.upvalues)do if def[1]==1 then upvals[i]={stack=JVFHtdpUh,index=def[2]+1}else upvals[i]=ZHy9yTF5GCP[def[2]+1]end end;JVFHtdpUh[UdgBuhuLDoxJj+1]=function(...)return cK_ZNBhYrgU(proto,{...},upvals)end
elseif gGTyjEwsR1o==27 then
JVFHtdpUh[UdgBuhuLDoxJj+1]=JVFHtdpUh[Vn2NI6vQxDQo+1]
elseif gGTyjEwsR1o==22 then
local gVeB_b={0.24098405513747068,"CSqtjetY"}
elseif gGTyjEwsR1o==129 then
local xlVabC={0.41198204712430586,"rdHjweMH"}
elseif gGTyjEwsR1o==101 then
for XhNC=1,0 do EtLCVC_=TnB0ts4KNNat1+1 end
elseif gGTyjEwsR1o==31 then
for LkHD=1,0 do FRTwEWeYpYBN=WX1jJ4+1 end
elseif gGTyjEwsR1o==3 then
if false then MidbTMpzkf8OH=nil end
elseif gGTyjEwsR1o==36 then
local BiBaIV=yob2Dk+xP10Y724X1Up3
elseif gGTyjEwsR1o==119 then
for pOKz=1,0 do rRdV0Zm=fJb4vHxbDGu+1 end
elseif gGTyjEwsR1o==32 then
local MgRbfl={0.5627774836076145,"IEWiSRYG"}
elseif gGTyjEwsR1o==0 then
local GeJyrf=AQHXsn+ePC2e7eVsC3
elseif gGTyjEwsR1o==21 then
for LqaE=1,0 do hDeaZODXfl=DLf6pVqJz+1 end
elseif gGTyjEwsR1o==9 then
if false then rRdV0Zm=nil end
elseif gGTyjEwsR1o==16 then
local JlWmAm=gokNTce+X9cqbIQDNgFO
elseif gGTyjEwsR1o==2 then
local fEFElp=ayBU2Gqun+Bqc9R98
elseif gGTyjEwsR1o==126 then
local pRHZfP=hGlFoVu4M+n3WF7SoVNNS
elseif gGTyjEwsR1o==115 then
local MkVlJY=WX1jJ4+YXbN83hsV
elseif gGTyjEwsR1o==107 then
local gVeB_b={0.24098405513747068,"CSqtjetY"}
elseif gGTyjEwsR1o==121 then
local xlVabC={0.41198204712430586,"rdHjweMH"}
elseif gGTyjEwsR1o==1 then
for XhNC=1,0 do EtLCVC_=TnB0ts4KNNat1+1 end
elseif gGTyjEwsR1o==25 then
for LkHD=1,0 do FRTwEWeYpYBN=WX1jJ4+1 end
elseif gGTyjEwsR1o==113 then
if false then MidbTMpzkf8OH=nil end
elseif gGTyjEwsR1o==29 then
local BiBaIV=yob2Dk+xP10Y724X1Up3
elseif gGTyjEwsR1o==118 then
for pOKz=1,0 do rRdV0Zm=fJb4vHxbDGu+1 end
elseif gGTyjEwsR1o==11 then
local MgRbfl={0.5627774836076145,"IEWiSRYG"}
elseif gGTyjEwsR1o==106 then
local GeJyrf=AQHXsn+ePC2e7eVsC3
elseif gGTyjEwsR1o==128 then
for LqaE=1,0 do hDeaZODXfl=DLf6pVqJz+1 end
elseif gGTyjEwsR1o==20 then
if false then rRdV0Zm=nil end
elseif gGTyjEwsR1o==111 then
local JlWmAm=gokNTce+X9cqbIQDNgFO
elseif gGTyjEwsR1o==18 then
local fEFElp=ayBU2Gqun+Bqc9R98
elseif gGTyjEwsR1o==33 then
local pRHZfP=hGlFoVu4M+n3WF7SoVNNS
elseif gGTyjEwsR1o==12 then
local MkVlJY=WX1jJ4+YXbN83hsV
else break end
end
end
cK_ZNBhYrgU({code={91,81,57,110,62,44,38,77,217,78,194,5,35,43,159,193,122,172,209,25,18,254,20,216,224,103,197,97,33,37,6,51,61,224,61,37,120,133,25,132,62,228,56,241,185,236,212,240,225,200,86,225,127,102,41,227,197,69,242,109,2,134,94,16,67,6,121,126,11,159,72,228,14,9,250,15,87,179,22,56,49,38,234,251,218,185,19,79,186,156,133,75,254,230,155,136,19,245,75,175,253,110,151,54,231,81,65,91,227,206,175,240,200,255,126,240,63,114,205,100,1,83,151,38,228,225,4,205,177,158,128,145,66,56,83,1,255,135,192,224,157,251,157,254,79,197,62,158,43,114,190,159,114,3,12,115,45,112,68,245,93,126,161,73,179,96,188,51,83,190,247,234,55,124,65,224,215,87,112,222,143,133,142,168,216,109,139,46,165,177,85,64,135,11,15,168,239,66,19,123,132,60,212,72,67,91,36,41,130,215,244,89,123,5,44,52,147,87,249,190,194,54,133,37,203,236,156,55,182,58,74,122,80,242,37,13},consts={[[print]],[[Start]],[[Factorial of 5 is: ]],5,[[key]],[[value]],1,100,[[Table key: ]],[[Table index 1: ]],3,[[Loop iteration: ]],[[End]]},protos={{code={43,80,57,110,71,44,38,76,102,77,197,5,120,43,153,198,208,179,208,23,117,241,20,216,239,103,197,97,110,35,3,51,192,234,58,37,27,156,26,132,129,236,61,241,224,208,204,240,226,206,80,239,112,99,44,152,165,68,205,103,7,133,83,22,82,60,123,112,0,147,84,225,187,4,249,15,199,168,108,43},consts={0,1},protos={},numParams=1,upvalues={{1,3}},cs=9616,len=80}},numParams=0,upvalues={},cs=29578,len=236},{...})