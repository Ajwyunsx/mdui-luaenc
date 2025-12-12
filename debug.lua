--[[Lua Obfuscator v3.0]]
local SfuW_mK4kSGk=function()return true end
local Arnc4Y8LoP=911
local e_sPJMDCG=869
local uPim1Rx26=443
local gidLFYixgcW_s=928
local NroeqqPRsh="DJ_CNOCT"
local vkr_aaeyPH11N=440
local Qypu9X9DjnXo=303
local DSw6chn2_wYk=291
local mSfbQiTEDZgT3=6
local auqXmTSY="MFYPzSNH"
local GyuBbT_6Gz7g=509
local w0G82esJP4q="voBCpdeK"
local o1I5bCx=576
local d_UPbJ2=561
local fUHKx0d4n="jZRcROrR"
local vG271SYWq=327
local MaVELN5C="MjKaPuBt"
local AjQe9k=187
local HEVRdXwnfgH6="WEGNSEnY"
local zzunYbMuJi="vVVehjAW"
local kF11uiROpC="pjXCUeUV"
local _HBcZ6X0pdNzY="UHnkIGky"
local dk5mgfZPU=93
local OZVTCw8hb=240
local nYyb8a=884
local Yj3_lNa5Ord4U="VYpuwvJN"
local UItbAwNXeQiW=763
local ldJ_4GJqQN=558
local JKI9p7dz=49
local Fv_p2Q=180
local F6Q6T1PT=973
local vZcOcaT0raMz="mwRUVNLP"
local m9mNVaQO=799
local ZyxxX9GtyCqRV="kqSqUvZF"
local L_QUb97Z7KOYS=781
local uOy7F1GGpEEvP="bGMRXBfq"
local M32o9GdviwUBL=183
local KGLb6kn=714
local rF7cvf2UidH0=625
local sbGR82jCRYfMH=540
local cCx5fWAJ=614
local SVwxV96Y66Up="bxygbexq"
local eTEOtDIE70fmP=761
local iOdj5faecgB=743
local ubiWpoTZ2qW="tQERJAhG"
local lERGXgX4L8R="xCbLv_Xd"
local RzxCLFZDd=961
local ClfbGyU8z4n=904
local TbVLpgP=126
local aOZuRjJJ=869
local a8rzISMNP_y6=(os and os.time and os.time())or(tick and tick())or 1
local MLx4NGRfT_j=table.insert
local UUwgTa=table.unpack or unpack
local y6C05rXoz9Y=_G or _ENV or{}
local gkDCwK=function(a,b)local p,c=1,0;while a>0 and b>0 do local ra,rb=a%2,b%2;if ra~=rb then c=c+p end;a,b,p=(a-ra)/2,(b-rb)/2,p*2 end;if a<b then a=b end;while a>0 do local ra=a%2;if ra>0 then c=c+p end;a,p=(a-ra)/2,p*2 end;return c end
local fyAqP6U55M=function(data,keys)local r={};for i=1,#data do local v=data[i];for j=#keys,1,-1 do local k=keys[j];v=v-k[((i-1)%#k)+1];if v<0 then v=v+256 end end;r[i]=v end;return r end
local xiHHhJg4=function(data,seed)local state=seed;local taps=0x80200003;local r={};for i=1,#data do local lsb=state%2;state=math.floor(state/2);if lsb==1 then state=gkDCwK(state,taps)end;r[i]=gkDCwK(data[i],state%256)end;return r end
local CCn3m5BUs=function(data,a,b,c,d,seed)local r={};local x=seed;for i=1,#data do local y=((i-1)*7+13)%256;local z=((i-1)*11+17)%256;local f=(a*x*x*x+b*y*y+c*z+d)%256;r[i]=(data[i]-f)%256;x=(x*17+(i-1)+31)%256 end;return r end
local function ytz2PF6d05vI(chunk,args,upvals)
local key1,key2,key3={204,33,110,107,211,51,204,57,41,101,174,249,156,91,81,107},{139,166,38,126,46,48,5,167},{63,212,198,74}
local raw=chunk.code
local dec=xiHHhJg4(raw,40019)
dec=CCn3m5BUs(dec,19,22,17,48,86)
local XiHpy3wLAC=fyAqP6U55M(dec,{key3,key2,key1})
local xHXQM8O_Z=chunk.consts
local FyiWE2G3QPE=chunk.protos
local qTM5eK=upvals or{}
local GsEIfZ={}
for i=1,#(args or{})do GsEIfZ[i]=args[i]end
local K99bbz=1
while ((a8rzISMNP_y6>=0)or(a8rzISMNP_y6<0)) do
local fpSF12=XiHpy3wLAC[K99bbz]
local mhnvSn=XiHpy3wLAC[K99bbz+1]
local hKApiebH2R=XiHpy3wLAC[K99bbz+2]
local jddxN83=XiHpy3wLAC[K99bbz+3]
K99bbz=K99bbz+4
if fpSF12==35 then
local uv=qTM5eK[hKApiebH2R+1];GsEIfZ[mhnvSn+1]=uv.stack[uv.index]
elseif fpSF12==105 then
local res={};for i=0,hKApiebH2R-2 do MLx4NGRfT_j(res,GsEIfZ[mhnvSn+i+1])end;return UUwgTa(res)
elseif fpSF12==111 then
local v=xHXQM8O_Z[hKApiebH2R+1];if type(v)=="table" then local s="";for i=1,#v do s=s..string.char(gkDCwK(v[i],55))end;GsEIfZ[mhnvSn+1]=s else GsEIfZ[mhnvSn+1]=v end
elseif fpSF12==16 then
--TAILCALL
elseif fpSF12==127 then
if((GsEIfZ[hKApiebH2R+1]<=GsEIfZ[jddxN83+1])~=(mhnvSn~=0))then K99bbz=K99bbz+4 end
elseif fpSF12==125 then
GsEIfZ[mhnvSn+1]=#GsEIfZ[hKApiebH2R+1]
elseif fpSF12==30 then
GsEIfZ[mhnvSn+1]=GsEIfZ[hKApiebH2R+1]%GsEIfZ[jddxN83+1]
elseif fpSF12==23 then
GsEIfZ[mhnvSn+1]=(hKApiebH2R~=0);if jddxN83~=0 then K99bbz=K99bbz+4 end
elseif fpSF12==26 then
local k=xHXQM8O_Z[hKApiebH2R+1];if type(k)=="table" then local s="";for i=1,#k do s=s..string.char(gkDCwK(k[i],55))end;k=s end;GsEIfZ[mhnvSn+1]=y6C05rXoz9Y[k]
elseif fpSF12==106 then
GsEIfZ[mhnvSn+1]={}
elseif fpSF12==27 then
K99bbz=K99bbz+mhnvSn*4
elseif fpSF12==24 then
GsEIfZ[mhnvSn+1]=GsEIfZ[hKApiebH2R+1]
elseif fpSF12==115 then
GsEIfZ[mhnvSn+1]=not GsEIfZ[hKApiebH2R+1]
elseif fpSF12==100 then
GsEIfZ[mhnvSn+1][GsEIfZ[hKApiebH2R+1]]=GsEIfZ[jddxN83+1]
elseif fpSF12==5 then
GsEIfZ[mhnvSn+1]=-GsEIfZ[hKApiebH2R+1]
elseif fpSF12==7 then
GsEIfZ[mhnvSn+2]=GsEIfZ[hKApiebH2R+1];GsEIfZ[mhnvSn+1]=GsEIfZ[hKApiebH2R+1][GsEIfZ[jddxN83+1]]
elseif fpSF12==2 then
local sBx=hKApiebH2R;if sBx>=128 then sBx=sBx-256 end;GsEIfZ[mhnvSn+1]=GsEIfZ[mhnvSn+1]+GsEIfZ[mhnvSn+3];local step=GsEIfZ[mhnvSn+3];local idx=GsEIfZ[mhnvSn+1];local limit=GsEIfZ[mhnvSn+2];if(step>0 and idx<=limit)or(step<=0 and idx>=limit)then K99bbz=K99bbz+sBx*4;GsEIfZ[mhnvSn+4]=idx end
elseif fpSF12==34 then
local uv=qTM5eK[hKApiebH2R+1];uv.stack[uv.index]=GsEIfZ[mhnvSn+1]
elseif fpSF12==0 then
GsEIfZ[mhnvSn+1]=GsEIfZ[hKApiebH2R+1][GsEIfZ[jddxN83+1]]
elseif fpSF12==121 then
for i=mhnvSn+1,mhnvSn+hKApiebH2R+1 do GsEIfZ[i]=nil end
elseif fpSF12==126 then
if(not not GsEIfZ[mhnvSn+1])~=(jddxN83~=0)then K99bbz=K99bbz+4 end
elseif fpSF12==21 then
local proto=FyiWE2G3QPE[hKApiebH2R+1];local upvals={};for i,def in ipairs(proto.upvalues)do if def[1]==1 then upvals[i]={stack=GsEIfZ,index=def[2]+1}else upvals[i]=qTM5eK[def[2]+1]end end;GsEIfZ[mhnvSn+1]=function(...)return ytz2PF6d05vI(proto,{...},upvals)end
elseif fpSF12==17 then
local args={};for i=1,hKApiebH2R-1 do MLx4NGRfT_j(args,GsEIfZ[mhnvSn+i+1])end;local fn=GsEIfZ[mhnvSn+1];local res;if ((a8rzISMNP_y6>=0)or(a8rzISMNP_y6<0)) then res={fn(UUwgTa(args))}else local DAaWgb={0.9919030195674823,"rDSXBnjl"} end;for i=1,jddxN83-1 do GsEIfZ[mhnvSn+i]=res[i]or nil end
elseif fpSF12==110 then
--SETLIST
elseif fpSF12==11 then
GsEIfZ[mhnvSn+1]=GsEIfZ[hKApiebH2R+1]+GsEIfZ[jddxN83+1]
elseif fpSF12==36 then
--TFORLOOP
elseif fpSF12==20 then
if((GsEIfZ[hKApiebH2R+1]==GsEIfZ[jddxN83+1])~=(mhnvSn~=0))then K99bbz=K99bbz+4 end
elseif fpSF12==108 then
if((GsEIfZ[hKApiebH2R+1]<GsEIfZ[jddxN83+1])~=(mhnvSn~=0))then K99bbz=K99bbz+4 end
elseif fpSF12==103 then
GsEIfZ[mhnvSn+1]=GsEIfZ[hKApiebH2R+1]..GsEIfZ[jddxN83+1]
elseif fpSF12==37 then
GsEIfZ[mhnvSn+1]=GsEIfZ[hKApiebH2R+1]*GsEIfZ[jddxN83+1]
elseif fpSF12==119 then
GsEIfZ[mhnvSn+1]=GsEIfZ[hKApiebH2R+1]^GsEIfZ[jddxN83+1]
elseif fpSF12==32 then
if(not not GsEIfZ[hKApiebH2R+1])==(jddxN83~=0)then GsEIfZ[mhnvSn+1]=GsEIfZ[hKApiebH2R+1]else K99bbz=K99bbz+4 end
elseif fpSF12==19 then
GsEIfZ[mhnvSn+1]=GsEIfZ[hKApiebH2R+1]-GsEIfZ[jddxN83+1]
elseif fpSF12==114 then
--CLOSE
elseif fpSF12==4 then
--VARARG
elseif fpSF12==128 then
local sBx=hKApiebH2R;if sBx>=128 then sBx=sBx-256 end;GsEIfZ[mhnvSn+1]=GsEIfZ[mhnvSn+1]-GsEIfZ[mhnvSn+3];K99bbz=K99bbz+sBx*4
elseif fpSF12==18 then
local k=xHXQM8O_Z[hKApiebH2R+1];if type(k)=="table" then local s="";for i=1,#k do s=s..string.char(gkDCwK(k[i],55))end;k=s end;y6C05rXoz9Y[k]=GsEIfZ[mhnvSn+1]
elseif fpSF12==8 then
GsEIfZ[mhnvSn+1]=GsEIfZ[hKApiebH2R+1]/GsEIfZ[jddxN83+1]
elseif fpSF12==112 then
local DAaWgb={0.9919030195674823,"rDSXBnjl"}
elseif fpSF12==29 then
local aiCaPX={0.04847826526072985,"KdHuLGZp"}
elseif fpSF12==116 then
local vTbHtn={0.43410056109602846,"ilrlOUbC"}
elseif fpSF12==6 then
if false then kF11uiROpC=nil end
elseif fpSF12==1 then
if false then gidLFYixgcW_s=nil end
elseif fpSF12==14 then
if false then RzxCLFZDd=nil end
elseif fpSF12==13 then
local bvFQHW={0.48256566396224265,"KqjqyZLf"}
elseif fpSF12==15 then
for gOql=1,0 do nYyb8a=ZyxxX9GtyCqRV+1 end
elseif fpSF12==122 then
local uLnCCd={0.21915002340057432,"jgTujYwh"}
elseif fpSF12==33 then
if false then Yj3_lNa5Ord4U=nil end
elseif fpSF12==28 then
local rOFJKb={0.3287690819933222,"TkcyEKhg"}
elseif fpSF12==25 then
for Foxq=1,0 do uPim1Rx26=KGLb6kn+1 end
elseif fpSF12==109 then
local HPlZPO={0.5575048363551531,"SGdGkTKz"}
elseif fpSF12==22 then
local RXeZmz=rF7cvf2UidH0+rF7cvf2UidH0
elseif fpSF12==118 then
local hTlaCF=auqXmTSY+KGLb6kn
elseif fpSF12==10 then
local DAaWgb={0.9919030195674823,"rDSXBnjl"}
elseif fpSF12==31 then
local aiCaPX={0.04847826526072985,"KdHuLGZp"}
elseif fpSF12==129 then
local vTbHtn={0.43410056109602846,"ilrlOUbC"}
elseif fpSF12==102 then
if false then kF11uiROpC=nil end
elseif fpSF12==104 then
if false then gidLFYixgcW_s=nil end
elseif fpSF12==117 then
if false then RzxCLFZDd=nil end
elseif fpSF12==120 then
local bvFQHW={0.48256566396224265,"KqjqyZLf"}
elseif fpSF12==9 then
for gOql=1,0 do nYyb8a=ZyxxX9GtyCqRV+1 end
elseif fpSF12==3 then
local uLnCCd={0.21915002340057432,"jgTujYwh"}
elseif fpSF12==101 then
if false then Yj3_lNa5Ord4U=nil end
elseif fpSF12==113 then
local rOFJKb={0.3287690819933222,"TkcyEKhg"}
elseif fpSF12==124 then
for Foxq=1,0 do uPim1Rx26=KGLb6kn+1 end
elseif fpSF12==123 then
local HPlZPO={0.5575048363551531,"SGdGkTKz"}
elseif fpSF12==107 then
local RXeZmz=rF7cvf2UidH0+rF7cvf2UidH0
elseif fpSF12==12 then
local hTlaCF=auqXmTSY+KGLb6kn
else break end
end
end
ytz2PF6d05vI({code={229,11,199,18,235,185,101,44,39,143,107,67,8,180,177,121,116,214,99,145,195,109,154,100,38,211,113,153,157,210,208,23,249,169,173,0,146,32,12,190,222,214,57,1,89,213,73,238,76,128,21,50,179,134,111,53,187,91,151,5,106,109,22,139,255,153,134,193,200,129,184,15,21,13,240,223,178,138,115,48,108,56,170,70,160,70,211,116,4,172,137,157,164,10,119,153,245,115,171,236,68,189,199,45,180,149,15,198,182,238,173,206,239,239,17,99,116,186,211,70,235,231,15,151,3,22,126,143,77,117,13,215,202,188,225,89,94,166,239,29,136,59,239,180,194,32,240,174,34,191,87,103,111,67,124,128,219,100,96,40,38,59,127,75,221,121,209,243,0,141,105,191,198,54,82,13,220,178,190,196,96,204,98,87,76,196,192,10,39,177,199,22,74,117,209,129,144,72,96,178,0,195,136,211,169,193,235,226,200,32,13,172,58,110,181,96,2,61,72,103,45,131,30,204,30,52,211,160,45,144,239,210,3,246,219,3},consts={{71,69,94,89,67},{100,67,86,69,67},{113,86,84,67,88,69,94,86,91,23,88,81,23,2,23,94,68,13,23},5,{92,82,78},{65,86,91,66,82},1,100,{99,86,85,91,82,23,92,82,78,13,23},{99,86,85,91,82,23,94,89,83,82,79,23,6,13,23},3,{123,88,88,71,23,94,67,82,69,86,67,94,88,89,13,23},{114,89,83}},protos={{code={14,10,199,18,231,185,101,45,91,128,106,67,15,180,175,120,126,217,108,147,90,108,154,100,39,211,113,153,50,236,221,23,80,179,172,0,69,39,19,190,98,222,62,1,66,209,113,238,71,134,23,48,171,137,98,50,196,90,158,255,99,110,19,141,166,147,152,195,50,133,196,10,238,24,205,223,183,129,121,205},consts={0,1},protos={},numParams=1,upvalues={{1,3}}}},numParams=0,upvalues={}},{...})