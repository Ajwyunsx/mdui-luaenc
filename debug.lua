--[[Lua Obfuscator v3.0]]
local q0wOu6l3b=function()return true end
local Qm113eCB=634
local knlWiVeOE=828
local vQmOpOZqR=384
local fosMdzrDi="wLKGOOoy"
local XiOvCNbLNQp5=442
local v1OhBttCi="VHzvENUy"
local V2STyK8="fWfRPKTE"
local Z51pTbWYYFgx=951
local bmG1UWfX="gzsjSLJZ"
local jiuFL0std="FQkjglSa"
local N_2KAqVUMP=152
local hTr3AnSZ=370
local aVMDEY="phthWpmQ"
local lRjDO_LmT=924
local cnMjnbYTX4I8L="WieUdCsx"
local pfwfL2C="WVvpxPsj"
local jmp0g7utEGJgu=725
local G5ueD126w4G="tkiqp_Tx"
local QmGyuFu="TRStiGWM"
local yPIrvp7="OdacoNfT"
local WBcPiZfJo445k="CUssOgVI"
local kS7yWTEPmAJQl=104
local Hmi_7AGA=210
local H7cHE4LU0sz5T="jhmhZZXB"
local xlw4zUG8fwO=623
local PXWcfKVUF=385
local Ua4cmYkCdiP=250
local HWnSTYAr0E="PCTmExUD"
local aYASmHM=594
local sx8H9Yn5L3rMl=815
local bEmL7fRqycFyK="UMoQcORd"
local H8zY68=302
local marXrYSBT0=471
local Bk6Dzle6j5u=559
local SI9VefIsrsz="XBdJsPxR"
local xX6N0N="JKPZLRgc"
local Gft_CPrjSgG=130
local Uc7A0lXQHU=929
local wNw0Sk="Ht_qhfLl"
local Ut6BcFHd="ghNjrrmN"
local pWn7oTBMNyNYE=593
local s021aRzt7EhcT="HmFqkGNT"
local BZ5qfP0NFjVj=112
local IDNSpBOSYXqP=100
local j2Y8h6x="LpvaAJqN"
local xYtnuU=1
local JVuqBu9="AbrlsynZ"
local MB6XCZ="zWJqqnTN"
local cY_d4W="NLoIgxvk"
local dkcMrtGfD=925
local _orDvs=(os and os.time and os.time())or(tick and tick())or 1
local akOaxHSQxQZ=table.insert
local PMyc7zq=table.unpack or unpack
local A15B1aRV=_G or _ENV or{}
local OMKIFO=function(a,b)local p,c=1,0;while a>0 and b>0 do local ra,rb=a%2,b%2;if ra~=rb then c=c+p end;a,b,p=(a-ra)/2,(b-rb)/2,p*2 end;if a<b then a=b end;while a>0 do local ra=a%2;if ra>0 then c=c+p end;a,p=(a-ra)/2,p*2 end;return c end
local DyzWlbeB3q=function(data,keys)local r={};for i=1,#data do local v=data[i];for j=#keys,1,-1 do local k=keys[j];v=v-k[((i-1)%#k)+1];if v<0 then v=v+256 end end;r[i]=v end;return r end
local qvTOf_NxFQMI=function(data,seed)local state=seed;local taps=0x80200003;local r={};for i=1,#data do local lsb=state%2;state=math.floor(state/2);if lsb==1 then state=OMKIFO(state,taps)end;r[i]=OMKIFO(data[i],state%256)end;return r end
local slz3e2aCeSFG=function(data,a,b,c,d,seed)local r={};local x=seed;for i=1,#data do local y=((i-1)*7+13)%256;local z=((i-1)*11+17)%256;local f=(a*x*x*x+b*y*y+c*z+d)%256;r[i]=(data[i]-f)%256;x=(x*17+(i-1)+31)%256 end;return r end
local zHPWNCm=function(data,cs,len)if #data~=len then return false end;local sum=0;for i=1,#data do sum=sum+data[i]end;return(sum%65536)==cs end
local function _lUEcgRFEd8(chunk,args,upvals)
local key1,key2,key3={255,68,226,236,2,244,242,64,172,229,25,34,33,170,166,48},{163,118,255,188,93,173,27,101},{225,72,174,126}
local raw=chunk.code
if not zHPWNCm(raw,chunk.cs,chunk.len)then error("Tampered")end
local dec=qvTOf_NxFQMI(raw,55829)
dec=slz3e2aCeSFG(dec,5,27,20,32,95)
local XL5d5_oFBMby=DyzWlbeB3q(dec,{key3,key2,key1})
local MxgOAzEoVcHrC=chunk.consts
local AMBrRLS8fjUFZ=chunk.protos
local UthfW3R=upvals or{}
local p_no7knH={}
for i=1,#(args or{})do p_no7knH[i]=args[i]end
local njr72y=1
while (not not true) do
local ufuHF0JI1BVea=XL5d5_oFBMby[njr72y]
local IMLoWZpF_Z=XL5d5_oFBMby[njr72y+1]
local MXfbGd=XL5d5_oFBMby[njr72y+2]
local nSBhFRfr_S=XL5d5_oFBMby[njr72y+3]
njr72y=njr72y+4
if ufuHF0JI1BVea==114 then
njr72y=njr72y+IMLoWZpF_Z*4
elseif ufuHF0JI1BVea==106 then
local sBx=MXfbGd;if sBx>=128 then sBx=sBx-256 end;p_no7knH[IMLoWZpF_Z+1]=p_no7knH[IMLoWZpF_Z+1]+p_no7knH[IMLoWZpF_Z+3];local step=p_no7knH[IMLoWZpF_Z+3];local idx=p_no7knH[IMLoWZpF_Z+1];local limit=p_no7knH[IMLoWZpF_Z+2];if(step>0 and idx<=limit)or(step<=0 and idx>=limit)then njr72y=njr72y+sBx*4;p_no7knH[IMLoWZpF_Z+4]=idx end
elseif ufuHF0JI1BVea==6 then
p_no7knH[IMLoWZpF_Z+1]=p_no7knH[MXfbGd+1]%p_no7knH[nSBhFRfr_S+1]
elseif ufuHF0JI1BVea==105 then
--TFORLOOP
elseif ufuHF0JI1BVea==128 then
p_no7knH[IMLoWZpF_Z+2]=p_no7knH[MXfbGd+1];p_no7knH[IMLoWZpF_Z+1]=p_no7knH[MXfbGd+1][p_no7knH[nSBhFRfr_S+1]]
elseif ufuHF0JI1BVea==117 then
p_no7knH[IMLoWZpF_Z+1]=MxgOAzEoVcHrC[MXfbGd+1]
elseif ufuHF0JI1BVea==17 then
p_no7knH[IMLoWZpF_Z+1]=p_no7knH[MXfbGd+1]
elseif ufuHF0JI1BVea==27 then
if((p_no7knH[MXfbGd+1]==p_no7knH[nSBhFRfr_S+1])~=(IMLoWZpF_Z~=0))then njr72y=njr72y+4 end
elseif ufuHF0JI1BVea==0 then
if(not not p_no7knH[IMLoWZpF_Z+1])~=(nSBhFRfr_S~=0)then njr72y=njr72y+4 end
elseif ufuHF0JI1BVea==129 then
local sBx=MXfbGd;if sBx>=128 then sBx=sBx-256 end;p_no7knH[IMLoWZpF_Z+1]=p_no7knH[IMLoWZpF_Z+1]-p_no7knH[IMLoWZpF_Z+3];njr72y=njr72y+sBx*4
elseif ufuHF0JI1BVea==103 then
p_no7knH[IMLoWZpF_Z+1]=(MXfbGd~=0);if nSBhFRfr_S~=0 then njr72y=njr72y+4 end
elseif ufuHF0JI1BVea==24 then
p_no7knH[IMLoWZpF_Z+1][p_no7knH[MXfbGd+1]]=p_no7knH[nSBhFRfr_S+1]
elseif ufuHF0JI1BVea==10 then
local uv=UthfW3R[MXfbGd+1];uv.stack[uv.index]=p_no7knH[IMLoWZpF_Z+1]
elseif ufuHF0JI1BVea==119 then
local args={};for i=1,MXfbGd-1 do akOaxHSQxQZ(args,p_no7knH[IMLoWZpF_Z+i+1])end;local fn=p_no7knH[IMLoWZpF_Z+1];local res;if (not not true) then res={fn(PMyc7zq(args))}else for Gmhz=1,0 do Bk6Dzle6j5u=v1OhBttCi+1 end end;for i=1,nSBhFRfr_S-1 do p_no7knH[IMLoWZpF_Z+i]=res[i]or nil end
elseif ufuHF0JI1BVea==124 then
local proto=AMBrRLS8fjUFZ[MXfbGd+1];local upvals={};for i,def in ipairs(proto.upvalues)do if def[1]==1 then upvals[i]={stack=p_no7knH,index=def[2]+1}else upvals[i]=UthfW3R[def[2]+1]end end;p_no7knH[IMLoWZpF_Z+1]=function(...)return _lUEcgRFEd8(proto,{...},upvals)end
elseif ufuHF0JI1BVea==14 then
if((p_no7knH[MXfbGd+1]<=p_no7knH[nSBhFRfr_S+1])~=(IMLoWZpF_Z~=0))then njr72y=njr72y+4 end
elseif ufuHF0JI1BVea==115 then
--CLOSE
elseif ufuHF0JI1BVea==112 then
p_no7knH[IMLoWZpF_Z+1]={}
elseif ufuHF0JI1BVea==16 then
p_no7knH[IMLoWZpF_Z+1]=p_no7knH[MXfbGd+1]*p_no7knH[nSBhFRfr_S+1]
elseif ufuHF0JI1BVea==122 then
p_no7knH[IMLoWZpF_Z+1]=p_no7knH[MXfbGd+1]..p_no7knH[nSBhFRfr_S+1]
elseif ufuHF0JI1BVea==102 then
--TAILCALL
elseif ufuHF0JI1BVea==33 then
p_no7knH[IMLoWZpF_Z+1]=p_no7knH[MXfbGd+1]+p_no7knH[nSBhFRfr_S+1]
elseif ufuHF0JI1BVea==126 then
local res={};for i=0,MXfbGd-2 do akOaxHSQxQZ(res,p_no7knH[IMLoWZpF_Z+i+1])end;return PMyc7zq(res)
elseif ufuHF0JI1BVea==12 then
if((p_no7knH[MXfbGd+1]<p_no7knH[nSBhFRfr_S+1])~=(IMLoWZpF_Z~=0))then njr72y=njr72y+4 end
elseif ufuHF0JI1BVea==32 then
A15B1aRV[MxgOAzEoVcHrC[MXfbGd+1]]=p_no7knH[IMLoWZpF_Z+1]
elseif ufuHF0JI1BVea==22 then
p_no7knH[IMLoWZpF_Z+1]=p_no7knH[MXfbGd+1]/p_no7knH[nSBhFRfr_S+1]
elseif ufuHF0JI1BVea==5 then
if(not not p_no7knH[MXfbGd+1])==(nSBhFRfr_S~=0)then p_no7knH[IMLoWZpF_Z+1]=p_no7knH[MXfbGd+1]else njr72y=njr72y+4 end
elseif ufuHF0JI1BVea==2 then
p_no7knH[IMLoWZpF_Z+1]=A15B1aRV[MxgOAzEoVcHrC[MXfbGd+1]]
elseif ufuHF0JI1BVea==3 then
--VARARG
elseif ufuHF0JI1BVea==23 then
--SETLIST
elseif ufuHF0JI1BVea==8 then
p_no7knH[IMLoWZpF_Z+1]=#p_no7knH[MXfbGd+1]
elseif ufuHF0JI1BVea==7 then
p_no7knH[IMLoWZpF_Z+1]=-p_no7knH[MXfbGd+1]
elseif ufuHF0JI1BVea==125 then
p_no7knH[IMLoWZpF_Z+1]=p_no7knH[MXfbGd+1][p_no7knH[nSBhFRfr_S+1]]
elseif ufuHF0JI1BVea==107 then
p_no7knH[IMLoWZpF_Z+1]=not p_no7knH[MXfbGd+1]
elseif ufuHF0JI1BVea==37 then
p_no7knH[IMLoWZpF_Z+1]=p_no7knH[MXfbGd+1]-p_no7knH[nSBhFRfr_S+1]
elseif ufuHF0JI1BVea==123 then
for i=IMLoWZpF_Z+1,IMLoWZpF_Z+MXfbGd+1 do p_no7knH[i]=nil end
elseif ufuHF0JI1BVea==120 then
local uv=UthfW3R[MXfbGd+1];p_no7knH[IMLoWZpF_Z+1]=uv.stack[uv.index]
elseif ufuHF0JI1BVea==36 then
p_no7knH[IMLoWZpF_Z+1]=p_no7knH[MXfbGd+1]^p_no7knH[nSBhFRfr_S+1]
elseif ufuHF0JI1BVea==127 then
for Gmhz=1,0 do Bk6Dzle6j5u=v1OhBttCi+1 end
elseif ufuHF0JI1BVea==26 then
local TlYvEP=HWnSTYAr0E+wNw0Sk
elseif ufuHF0JI1BVea==118 then
if false then pWn7oTBMNyNYE=nil end
elseif ufuHF0JI1BVea==108 then
for fozd=1,0 do fosMdzrDi=aYASmHM+1 end
elseif ufuHF0JI1BVea==34 then
if false then WBcPiZfJo445k=nil end
elseif ufuHF0JI1BVea==113 then
local aAHlxk={0.49542656406925323,"EfNNiPES"}
elseif ufuHF0JI1BVea==1 then
if false then bmG1UWfX=nil end
elseif ufuHF0JI1BVea==110 then
if false then hTr3AnSZ=nil end
elseif ufuHF0JI1BVea==19 then
local uZyZop=WBcPiZfJo445k+HWnSTYAr0E
elseif ufuHF0JI1BVea==20 then
for eOKA=1,0 do sx8H9Yn5L3rMl=V2STyK8+1 end
elseif ufuHF0JI1BVea==21 then
if false then V2STyK8=nil end
elseif ufuHF0JI1BVea==28 then
local EHNsWR={0.6386411904848659,"zELmmjFN"}
elseif ufuHF0JI1BVea==9 then
local nlyLPn={0.7514467564099334,"XmfxEHzL"}
elseif ufuHF0JI1BVea==116 then
if false then xX6N0N=nil end
elseif ufuHF0JI1BVea==11 then
for LlMO=1,0 do JVuqBu9=Uc7A0lXQHU+1 end
elseif ufuHF0JI1BVea==4 then
for Gmhz=1,0 do Bk6Dzle6j5u=v1OhBttCi+1 end
elseif ufuHF0JI1BVea==100 then
local TlYvEP=HWnSTYAr0E+wNw0Sk
elseif ufuHF0JI1BVea==13 then
if false then pWn7oTBMNyNYE=nil end
elseif ufuHF0JI1BVea==29 then
for fozd=1,0 do fosMdzrDi=aYASmHM+1 end
elseif ufuHF0JI1BVea==18 then
if false then WBcPiZfJo445k=nil end
elseif ufuHF0JI1BVea==121 then
local aAHlxk={0.49542656406925323,"EfNNiPES"}
elseif ufuHF0JI1BVea==31 then
if false then bmG1UWfX=nil end
elseif ufuHF0JI1BVea==30 then
if false then hTr3AnSZ=nil end
elseif ufuHF0JI1BVea==35 then
local uZyZop=WBcPiZfJo445k+HWnSTYAr0E
elseif ufuHF0JI1BVea==104 then
for eOKA=1,0 do sx8H9Yn5L3rMl=V2STyK8+1 end
elseif ufuHF0JI1BVea==101 then
if false then V2STyK8=nil end
elseif ufuHF0JI1BVea==25 then
local EHNsWR={0.6386411904848659,"zELmmjFN"}
elseif ufuHF0JI1BVea==111 then
local nlyLPn={0.7514467564099334,"XmfxEHzL"}
elseif ufuHF0JI1BVea==15 then
if false then xX6N0N=nil end
elseif ufuHF0JI1BVea==109 then
for LlMO=1,0 do JVuqBu9=Uc7A0lXQHU+1 end
else break end
end
end
_lUEcgRFEd8({code={110,29,246,5,213,130,214,26,30,184,87,240,148,3,169,119,118,10,131,209,231,40,128,105,187,77,92,108,206,71,8,253,121,58,21,32,220,39,13,196,73,134,57,248,88,107,152,255,122,62,4,193,121,166,66,250,86,34,220,114,255,183,114,211,40,104,19,20,226,163,77,182,56,46,73,17,176,234,66,153,14,54,163,225,7,91,187,81,1,130,225,75,5,28,56,139,111,198,160,158,147,153,192,201,188,225,203,160,96,64,131,147,242,2,38,35,12,35,25,73,198,246,196,4,84,133,225,185,191,124,80,150,255,157,181,101,2,184,216,120,148,136,100,80,136,125,183,30,186,202,221,98,215,139,236,229,79,133,98,11,227,65,36,249,63,85,198,229,38,102,237,205,225,205,41,17,235,13,148,201,151,2,169,75,114,224,152,30,143,26,20,178,53,154,19,236,185,86,42,215,164,41,113,93,215,1,58,223,128,72,135,185,132,130,99,123,253,39,126,206,139,127,130,148,114,64,139,248,174,225,19,106,128,205,205,237},consts={"print","Start","Factorial of 5 is: ",5,"key","value",1,100,"Table key: ","Table index 1: ",3,"Loop iteration: ","End"},protos={{code={211,28,246,5,223,130,214,27,29,185,84,240,226,3,167,118,102,13,140,211,99,47,128,105,43,77,92,108,42,65,5,253,213,0,20,32,75,62,12,196,74,158,36,248,63,111,144,255,224,64,6,195,126,187,73,253,170,33,199,120,89,182,119,209,33,82,29,22,79,167,73,179,132,61,78,17,26,31,88,172},consts={0,1},protos={},numParams=1,upvalues={{1,3}},cs=8883,len=80}},numParams=0,upvalues={},cs=29925,len=236},{...})