--[[Lua Obfuscator v3.0]]
local rYgiSKhySkiE4=function()return true end
local tpt0QRGFsxw4=550
local Td0cas6="iHUUEZRz"
local yUt4rXzNFE=911
local CpjngP0Mx=677
local iG08fnzh="fvNgHbFt"
local EfIaNgQBAsh="nVZRExRU"
local u1CylaYL=733
local fsAS4tz7muPJ7="YGQDrpTt"
local zPJguBFi="JNZpaOnu"
local UJ5fIPSzzJn="rRalGaVs"
local Ss6ezAWiBrd=3
local QT7cjv0=67
local dXyQ6oolJ88="txkiFmvL"
local rUAwxtEf="BIvDjOiB"
local msKvERKFijx=40
local OigBSYGby=732
local pilDaZGEx=973
local UHU5sF=484
local wsqH3I3R="BfDOJaua"
local iefsREuvCWJly=972
local aExsBnXmHof="aLnDKfFU"
local Z3AI0P8c="SubltiBP"
local WKAuSBndOau="DdPxSHNc"
local w91Ij4Th9mT="qaVEMXSq"
local iTWj0O6NsIE=749
local MCtJPMZ=680
local vldHwj3xaxgIz=609
local V9zWNdF0="vfUpMWjQ"
local b9M1rO_aiX7j="BsIuWCrW"
local xYhSrxnNTRP8X="wPuvgRYv"
local hX0chg3rVTWD="APRcqJGI"
local L03QacQ=752
local Foppf9=43
local YJO1mbQOEGiU="tLoGKDSS"
local h1hRbSBB8="uLLoUCNN"
local LN_WIF3=36
local F3MbLj=657
local RrvEw7Tes="VRLiKQdT"
local f7UHZHOVJPnLX=525
local fEDfrzbuP="KPaMVkSw"
local VmABfDbGtZH6_="RZtQZiRz"
local hge_BOgj=117
local bL_BkEMHWYM="msQqXIUP"
local JNIrL3IueHsbx=590
local YU2Pct3GfPW5=269
local jMugDvDQa1=326
local eva6cIwd=745
local v9Pxaw="SVveRrEO"
local t8QLJ2=198
local Ac3hFhfC="CgXrYNpb"
local pBe6TVmUooGq=(os and os.time and os.time())or(tick and tick())or 1
local sQDcXJDiSMLj=table.insert
local fzk66ceoW4ak=table.unpack or unpack
local XXKifXv7ymr=_G or _ENV or{}
local Ol3Oa1Er3J5gV=function(a,b)local p,c=1,0;while a>0 and b>0 do local ra,rb=a%2,b%2;if ra~=rb then c=c+p end;a,b,p=(a-ra)/2,(b-rb)/2,p*2 end;if a<b then a=b end;while a>0 do local ra=a%2;if ra>0 then c=c+p end;a,p=(a-ra)/2,p*2 end;return c end
local RL7XS73=function(data,keys)local r={};for i=1,#data do local v=data[i];for j=#keys,1,-1 do local k=keys[j];v=v-k[((i-1)%#k)+1];if v<0 then v=v+256 end end;r[i]=v end;return r end
local zUfaD1VNn0H=function(data,seed)local state=seed;local taps=0x80200003;local r={};for i=1,#data do local lsb=state%2;state=math.floor(state/2);if lsb==1 then state=Ol3Oa1Er3J5gV(state,taps)end;r[i]=Ol3Oa1Er3J5gV(data[i],state%256)end;return r end
local cWYY3p8zejW=function(data,a,b,c,d,seed)local r={};local x=seed;for i=1,#data do local y=((i-1)*7+13)%256;local z=((i-1)*11+17)%256;local f=(a*x*x*x+b*y*y+c*z+d)%256;r[i]=(data[i]-f)%256;x=(x*17+(i-1)+31)%256 end;return r end
local v1stqUH7=function(data,cs,len)if #data~=len then return false end;local sum=0;for i=1,#data do sum=sum+data[i]end;return(sum%65536)==cs end
local AaLyBn=function(arr,xk)local s="";for i=1,#arr do local b=Ol3Oa1Er3J5gV(arr[i],Ol3Oa1Er3J5gV(xk,(i-1)%256));s=s..string.char(b)end;return s end
local function qx3mUH_A(chunk,args,upvals)
local key1,key2,key3={23,126,161,228,109,26,247,125,25,44,11,67,168,36,72,178},{222,14,230,107,97,170,111,154},{91,239,252,0}
local raw=chunk.code
if not v1stqUH7(raw,chunk.cs,chunk.len)then error("Tampered")end
local dec=zUfaD1VNn0H(raw,65066)
dec=cWYY3p8zejW(dec,5,9,17,46,16)
local uf4Gdsy=RL7XS73(dec,{key3,key2,key1})
local eBMNcYXK={};for i,v in ipairs(chunk.consts)do if type(v)=="table"then eBMNcYXK[i]=AaLyBn(v,156)else eBMNcYXK[i]=v end end
local r3N2PWbz=chunk.protos
local KOPXEzU=upvals or{}
local BJIndeS={}
for i=1,#(args or{})do BJIndeS[i]=args[i]end
local YJ6ZqWFj6UkLc=1
while (type(pBe6TVmUooGq)==type(pBe6TVmUooGq)) do
local IyyeSgCJ7Er0m=uf4Gdsy[YJ6ZqWFj6UkLc]
local PPtBigG=uf4Gdsy[YJ6ZqWFj6UkLc+1]
local ouJsVPq90RI=uf4Gdsy[YJ6ZqWFj6UkLc+2]
local Rbxnik7bW=uf4Gdsy[YJ6ZqWFj6UkLc+3]
YJ6ZqWFj6UkLc=YJ6ZqWFj6UkLc+4
if IyyeSgCJ7Er0m==32 then
local res={};for i=0,ouJsVPq90RI-2 do sQDcXJDiSMLj(res,BJIndeS[PPtBigG+i+1])end;return fzk66ceoW4ak(res)
elseif IyyeSgCJ7Er0m==115 then
BJIndeS[PPtBigG+1]=eBMNcYXK[ouJsVPq90RI+1]
elseif IyyeSgCJ7Er0m==9 then
BJIndeS[PPtBigG+1]=BJIndeS[ouJsVPq90RI+1]/BJIndeS[Rbxnik7bW+1]
elseif IyyeSgCJ7Er0m==116 then
local uv=KOPXEzU[ouJsVPq90RI+1];uv.stack[uv.index]=BJIndeS[PPtBigG+1]
elseif IyyeSgCJ7Er0m==5 then
if((BJIndeS[ouJsVPq90RI+1]<BJIndeS[Rbxnik7bW+1])~=(PPtBigG~=0))then YJ6ZqWFj6UkLc=YJ6ZqWFj6UkLc+4 end
elseif IyyeSgCJ7Er0m==10 then
for i=PPtBigG+1,PPtBigG+ouJsVPq90RI+1 do BJIndeS[i]=nil end
elseif IyyeSgCJ7Er0m==107 then
YJ6ZqWFj6UkLc=YJ6ZqWFj6UkLc+PPtBigG*4
elseif IyyeSgCJ7Er0m==102 then
local sBx=ouJsVPq90RI;if sBx>=128 then sBx=sBx-256 end;BJIndeS[PPtBigG+1]=BJIndeS[PPtBigG+1]-BJIndeS[PPtBigG+3];YJ6ZqWFj6UkLc=YJ6ZqWFj6UkLc+sBx*4
elseif IyyeSgCJ7Er0m==0 then
if(not not BJIndeS[ouJsVPq90RI+1])==(Rbxnik7bW~=0)then BJIndeS[PPtBigG+1]=BJIndeS[ouJsVPq90RI+1]else YJ6ZqWFj6UkLc=YJ6ZqWFj6UkLc+4 end
elseif IyyeSgCJ7Er0m==129 then
BJIndeS[PPtBigG+1]=-BJIndeS[ouJsVPq90RI+1]
elseif IyyeSgCJ7Er0m==35 then
XXKifXv7ymr[eBMNcYXK[ouJsVPq90RI+1]]=BJIndeS[PPtBigG+1]
elseif IyyeSgCJ7Er0m==18 then
--CLOSE
elseif IyyeSgCJ7Er0m==4 then
--TAILCALL
elseif IyyeSgCJ7Er0m==29 then
BJIndeS[PPtBigG+1]=BJIndeS[ouJsVPq90RI+1]+BJIndeS[Rbxnik7bW+1]
elseif IyyeSgCJ7Er0m==3 then
BJIndeS[PPtBigG+1]=#BJIndeS[ouJsVPq90RI+1]
elseif IyyeSgCJ7Er0m==127 then
BJIndeS[PPtBigG+2]=BJIndeS[ouJsVPq90RI+1];BJIndeS[PPtBigG+1]=BJIndeS[ouJsVPq90RI+1][BJIndeS[Rbxnik7bW+1]]
elseif IyyeSgCJ7Er0m==120 then
--TFORLOOP
elseif IyyeSgCJ7Er0m==121 then
BJIndeS[PPtBigG+1]=BJIndeS[ouJsVPq90RI+1][BJIndeS[Rbxnik7bW+1]]
elseif IyyeSgCJ7Er0m==15 then
BJIndeS[PPtBigG+1]=BJIndeS[ouJsVPq90RI+1]
elseif IyyeSgCJ7Er0m==112 then
--VARARG
elseif IyyeSgCJ7Er0m==23 then
local args={};for i=1,ouJsVPq90RI-1 do sQDcXJDiSMLj(args,BJIndeS[PPtBigG+i+1])end;local fn=BJIndeS[PPtBigG+1];local res;if (type(pBe6TVmUooGq)==type(pBe6TVmUooGq)) then res={fn(fzk66ceoW4ak(args))}else if false then pilDaZGEx=nil end end;for i=1,Rbxnik7bW-1 do BJIndeS[PPtBigG+i]=res[i]or nil end
elseif IyyeSgCJ7Er0m==13 then
if(not not BJIndeS[PPtBigG+1])~=(Rbxnik7bW~=0)then YJ6ZqWFj6UkLc=YJ6ZqWFj6UkLc+4 end
elseif IyyeSgCJ7Er0m==12 then
BJIndeS[PPtBigG+1]=BJIndeS[ouJsVPq90RI+1]..BJIndeS[Rbxnik7bW+1]
elseif IyyeSgCJ7Er0m==33 then
BJIndeS[PPtBigG+1]={}
elseif IyyeSgCJ7Er0m==105 then
BJIndeS[PPtBigG+1][BJIndeS[ouJsVPq90RI+1]]=BJIndeS[Rbxnik7bW+1]
elseif IyyeSgCJ7Er0m==28 then
BJIndeS[PPtBigG+1]=XXKifXv7ymr[eBMNcYXK[ouJsVPq90RI+1]]
elseif IyyeSgCJ7Er0m==128 then
BJIndeS[PPtBigG+1]=BJIndeS[ouJsVPq90RI+1]-BJIndeS[Rbxnik7bW+1]
elseif IyyeSgCJ7Er0m==17 then
BJIndeS[PPtBigG+1]=BJIndeS[ouJsVPq90RI+1]*BJIndeS[Rbxnik7bW+1]
elseif IyyeSgCJ7Er0m==37 then
local uv=KOPXEzU[ouJsVPq90RI+1];BJIndeS[PPtBigG+1]=uv.stack[uv.index]
elseif IyyeSgCJ7Er0m==126 then
local sBx=ouJsVPq90RI;if sBx>=128 then sBx=sBx-256 end;BJIndeS[PPtBigG+1]=BJIndeS[PPtBigG+1]+BJIndeS[PPtBigG+3];local step=BJIndeS[PPtBigG+3];local idx=BJIndeS[PPtBigG+1];local limit=BJIndeS[PPtBigG+2];if(step>0 and idx<=limit)or(step<=0 and idx>=limit)then YJ6ZqWFj6UkLc=YJ6ZqWFj6UkLc+sBx*4;BJIndeS[PPtBigG+4]=idx end
elseif IyyeSgCJ7Er0m==11 then
BJIndeS[PPtBigG+1]=not BJIndeS[ouJsVPq90RI+1]
elseif IyyeSgCJ7Er0m==104 then
BJIndeS[PPtBigG+1]=BJIndeS[ouJsVPq90RI+1]%BJIndeS[Rbxnik7bW+1]
elseif IyyeSgCJ7Er0m==19 then
local proto=r3N2PWbz[ouJsVPq90RI+1];local upvals={};for i,def in ipairs(proto.upvalues)do if def[1]==1 then upvals[i]={stack=BJIndeS,index=def[2]+1}else upvals[i]=KOPXEzU[def[2]+1]end end;BJIndeS[PPtBigG+1]=function(...)return qx3mUH_A(proto,{...},upvals)end
elseif IyyeSgCJ7Er0m==108 then
--SETLIST
elseif IyyeSgCJ7Er0m==106 then
if((BJIndeS[ouJsVPq90RI+1]<=BJIndeS[Rbxnik7bW+1])~=(PPtBigG~=0))then YJ6ZqWFj6UkLc=YJ6ZqWFj6UkLc+4 end
elseif IyyeSgCJ7Er0m==123 then
BJIndeS[PPtBigG+1]=(ouJsVPq90RI~=0);if Rbxnik7bW~=0 then YJ6ZqWFj6UkLc=YJ6ZqWFj6UkLc+4 end
elseif IyyeSgCJ7Er0m==26 then
if((BJIndeS[ouJsVPq90RI+1]==BJIndeS[Rbxnik7bW+1])~=(PPtBigG~=0))then YJ6ZqWFj6UkLc=YJ6ZqWFj6UkLc+4 end
elseif IyyeSgCJ7Er0m==21 then
BJIndeS[PPtBigG+1]=BJIndeS[ouJsVPq90RI+1]^BJIndeS[Rbxnik7bW+1]
elseif IyyeSgCJ7Er0m==2 then
if false then pilDaZGEx=nil end
elseif IyyeSgCJ7Er0m==103 then
local JyNSBq=YU2Pct3GfPW5+pilDaZGEx
elseif IyyeSgCJ7Er0m==117 then
local BXQOHw={0.9836577435917995,"cOahZgUD"}
elseif IyyeSgCJ7Er0m==118 then
for zkgm=1,0 do xYhSrxnNTRP8X=bL_BkEMHWYM+1 end
elseif IyyeSgCJ7Er0m==36 then
for agjM=1,0 do JNIrL3IueHsbx=t8QLJ2+1 end
elseif IyyeSgCJ7Er0m==125 then
if false then fsAS4tz7muPJ7=nil end
elseif IyyeSgCJ7Er0m==113 then
local VBvBCg=iefsREuvCWJly+eva6cIwd
elseif IyyeSgCJ7Er0m==25 then
local xmbVAl=LN_WIF3+rUAwxtEf
elseif IyyeSgCJ7Er0m==114 then
local TDCHxX={0.9888280031016239,"HMkvNVri"}
elseif IyyeSgCJ7Er0m==14 then
local yitPpY={0.7561305146507822,"DMzuGbJX"}
elseif IyyeSgCJ7Er0m==34 then
if false then JNIrL3IueHsbx=nil end
elseif IyyeSgCJ7Er0m==27 then
if false then F3MbLj=nil end
elseif IyyeSgCJ7Er0m==109 then
local YbByFn={0.3514558689788321,"zwd_DfcC"}
elseif IyyeSgCJ7Er0m==8 then
local UrJGZo={0.10182543354272311,"wipINEeE"}
elseif IyyeSgCJ7Er0m==119 then
local eLcwPm=w91Ij4Th9mT+Foppf9
elseif IyyeSgCJ7Er0m==111 then
if false then pilDaZGEx=nil end
elseif IyyeSgCJ7Er0m==6 then
local JyNSBq=YU2Pct3GfPW5+pilDaZGEx
elseif IyyeSgCJ7Er0m==20 then
local BXQOHw={0.9836577435917995,"cOahZgUD"}
elseif IyyeSgCJ7Er0m==110 then
for zkgm=1,0 do xYhSrxnNTRP8X=bL_BkEMHWYM+1 end
elseif IyyeSgCJ7Er0m==101 then
for agjM=1,0 do JNIrL3IueHsbx=t8QLJ2+1 end
elseif IyyeSgCJ7Er0m==1 then
if false then fsAS4tz7muPJ7=nil end
elseif IyyeSgCJ7Er0m==7 then
local VBvBCg=iefsREuvCWJly+eva6cIwd
elseif IyyeSgCJ7Er0m==16 then
local xmbVAl=LN_WIF3+rUAwxtEf
elseif IyyeSgCJ7Er0m==124 then
local TDCHxX={0.9888280031016239,"HMkvNVri"}
elseif IyyeSgCJ7Er0m==122 then
local yitPpY={0.7561305146507822,"DMzuGbJX"}
elseif IyyeSgCJ7Er0m==100 then
if false then JNIrL3IueHsbx=nil end
elseif IyyeSgCJ7Er0m==22 then
if false then F3MbLj=nil end
elseif IyyeSgCJ7Er0m==24 then
local YbByFn={0.3514558689788321,"zwd_DfcC"}
elseif IyyeSgCJ7Er0m==31 then
local UrJGZo={0.10182543354272311,"wipINEeE"}
elseif IyyeSgCJ7Er0m==30 then
local eLcwPm=w91Ij4Th9mT+Foppf9
else break end
end
end
qx3mUH_A({code={185,233,99,147,4,19,117,1,242,224,61,133,3,224,49,159,117,56,221,223,117,232,212,142,133,52,59,209,33,54,236,71,149,141,24,196,156,197,78,118,26,10,89,220,60,54,177,132,139,225,233,45,181,33,218,171,20,237,50,129,177,122,176,114,111,4,224,33,17,209,45,127,109,23,175,190,219,182,103,244,30,99,3,200,190,202,118,8,115,109,16,13,149,211,74,250,199,38,167,105,41,22,228,202,36,91,170,210,119,125,61,144,143,199,24,41,221,169,100,187,133,186,200,170,71,85,126,69,74,133,190,222,97,72,152,223,93,26,191,96,94,224,219,72,115,199,79,35,77,107,66,159,162,36,98,42,151,91,226,99,70,93,129,173,135,43,109,216,233,56,70,14,149,214,164,224,29,127,170,87,17,53,166,236,196,181,81,44,44,21,23,208,205,35,15,179,177,111,109,80,49,114,81,49,49,28,76,48,169,174,153,237,214,16,105,99,47,122,254,177,157,27,128,125,52,182,167,25,217,120,72,187,183,191,122,221},consts={{236,239,247,241,236},{207,233,255,237,236},{218,252,253,235,247,235,243,250,248,181,249,241,176,164,178,250,255,183,174},5,{247,248,231},{234,252,242,234,253},1,100,{200,252,252,243,253,185,241,254,237,175,182},{200,252,252,243,253,185,243,245,240,240,238,183,161,171,178},3,{208,242,241,239,184,240,238,254,230,244,226,254,255,255,168,179},{217,243,250}},protos={{code={22,232,99,147,15,19,117,254,250,231,60,133,119,224,47,158,217,59,222,217,127,233,212,142,86,52,59,209,141,48,225,71,9,139,25,196,173,254,73,118,18,18,94,220,38,58,201,132,147,227,151,43,92,34,223,178,135,236,203,187,185,121,181,112,121,10,226,39,191,213,41,4,201,106,162,190,34,189,109,193},consts={0,1},protos={},numParams=1,upvalues={{1,3}},cs=10697,len=80}},numParams=0,upvalues={},cs=29091,len=236},{...})