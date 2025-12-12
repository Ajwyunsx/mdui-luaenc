--[[Lua Obfuscator v3.0]]
local akTugEZeav=function()return true end
local _JYAqcFcOoXhZ=563
local sFIi8lGh="EdYcbdyt"
local Q_FIwfM="XQQ_WqO_"
local vYnnGBOF0x="dcPhbeyD"
local ZWQb8gXGRo3j="gZXewEPk"
local NdyX2a37pCa=841
local AaUnAL7icByF="SKZln_ac"
local Orgr3PO=388
local OcOKOPmXOI="nDyHZRiY"
local Ybd9Y0DFhKHqC="WudtjsDJ"
local j0oz1gJd3ed=842
local FPkwpKghu="ZbRqpynf"
local i_jcu9eEaD=560
local Jz0AiYrsgvPi="tDHnPmYe"
local TpPOTAf="BUKDPWVM"
local fFPoHP=922
local KN0ChjMGNOxG="HvWzKiKg"
local X7jknRYVeNBr=5
local ZAv8dktyFiNy=925
local PfR4gW17i=898
local JS0dbOAMIq=948
local yJ7yYXaw="cWGbljcI"
local ZeZ9_HXBMy="XFTojcrl"
local NrkK_ISyD=392
local RSJPWmXxUXg="GOJiEdmT"
local LSkTfN=398
local O4um8yx7fvs="gFidTQyK"
local UK0wUgpw="hbQsWdGU"
local FKks6_FIj511k="cNJbnbxF"
local Nl5r0d=376
local fbHkmR_r0yX=618
local a_5zb1lZkuVzS="DxyrNRHe"
local uGgUKNhM1LTJ=57
local jXrV4o6c76Nur="VAQPAamQ"
local GWlQ5WOeSGqF=985
local bxdZjAc_Xy="DICTofSb"
local o9pzruq5=268
local Y_wK5NLDiZhb=572
local qIE96TmLo=455
local JrMCG1En0T_E5=560
local upCIbq2_DqsMs="OEolAUlK"
local VjFEBaSpGXOC=48
local VsLV92wrsdW3="lrjUvbUh"
local ObTRkmrh=493
local fq6_GSzm=865
local fP_BO1o5hZ0=38
local XDj2aM="NhyhtLYi"
local RZCHHrRSb650=265
local eqhZqQP7sMsi=975
local WZRQ_6=310
local oK800BG4J1GJU=(os and os.time and os.time())or(tick and tick())or 1
local uDFBsUFKRlY2=table.insert
local F5kQWsQLPMpZB=table.unpack or unpack
local KVDOJN_mZe=_G or _ENV or{}
local ziA2W_=function(a,b)local p,c=1,0;while a>0 and b>0 do local ra,rb=a%2,b%2;if ra~=rb then c=c+p end;a,b,p=(a-ra)/2,(b-rb)/2,p*2 end;if a<b then a=b end;while a>0 do local ra=a%2;if ra>0 then c=c+p end;a,p=(a-ra)/2,p*2 end;return c end
local UXda35s=function(data,keys)local r={};for i=1,#data do local v=data[i];for j=#keys,1,-1 do local k=keys[j];v=v-k[((i-1)%#k)+1];if v<0 then v=v+256 end end;r[i]=v end;return r end
local YLRkCRG21Ha=function(data,seed)local state=seed;local taps=0x80200003;local r={};for i=1,#data do local lsb=state%2;state=math.floor(state/2);if lsb==1 then state=ziA2W_(state,taps)end;r[i]=ziA2W_(data[i],state%256)end;return r end
local FaOqu3QUG=function(data,a,b,c,d,seed)local r={};local x=seed;for i=1,#data do local y=((i-1)*7+13)%256;local z=((i-1)*11+17)%256;local f=(a*x*x*x+b*y*y+c*z+d)%256;r[i]=(data[i]-f)%256;x=(x*17+(i-1)+31)%256 end;return r end
local WiwHVG=function(data,cs,len)if #data~=len then return false end;local sum=0;for i=1,#data do sum=sum+data[i]end;return(sum%65536)==cs end
local function EIYkFWRokcW_(chunk,args,upvals)
local key1,key2,key3={202,159,98,67,231,161,155,251,33,35,255,17,221,80,217,28},{55,203,252,197,206,1,19,161},{154,240,33,83}
local raw=chunk.code
if not WiwHVG(raw,chunk.cs,chunk.len)then error("Tampered")end
local dec=YLRkCRG21Ha(raw,64253)
dec=FaOqu3QUG(dec,16,14,8,33,209)
local L_ue7W=UXda35s(dec,{key3,key2,key1})
local YTswfHwOOh=chunk.consts
local FYidfW=chunk.protos
local LtKt3MJpaGQi=upvals or{}
local Yfyrw8G={}
for i=1,#(args or{})do Yfyrw8G[i]=args[i]end
local FWdCrs5FN9Uv9=1
while (type(oK800BG4J1GJU)==type(oK800BG4J1GJU)) do
local FAZINRgWB=L_ue7W[FWdCrs5FN9Uv9]
local FgP72EB2FF=L_ue7W[FWdCrs5FN9Uv9+1]
local hN4Gr7PMpy=L_ue7W[FWdCrs5FN9Uv9+2]
local NBpvDoWry4=L_ue7W[FWdCrs5FN9Uv9+3]
FWdCrs5FN9Uv9=FWdCrs5FN9Uv9+4
if FAZINRgWB==10 then
Yfyrw8G[FgP72EB2FF+1]=not Yfyrw8G[hN4Gr7PMpy+1]
elseif FAZINRgWB==14 then
if((Yfyrw8G[hN4Gr7PMpy+1]==Yfyrw8G[NBpvDoWry4+1])~=(FgP72EB2FF~=0))then FWdCrs5FN9Uv9=FWdCrs5FN9Uv9+4 end
elseif FAZINRgWB==106 then
Yfyrw8G[FgP72EB2FF+2]=Yfyrw8G[hN4Gr7PMpy+1];Yfyrw8G[FgP72EB2FF+1]=Yfyrw8G[hN4Gr7PMpy+1][Yfyrw8G[NBpvDoWry4+1]]
elseif FAZINRgWB==0 then
--SETLIST
elseif FAZINRgWB==104 then
Yfyrw8G[FgP72EB2FF+1]=Yfyrw8G[hN4Gr7PMpy+1]-Yfyrw8G[NBpvDoWry4+1]
elseif FAZINRgWB==25 then
local res={};for i=0,hN4Gr7PMpy-2 do uDFBsUFKRlY2(res,Yfyrw8G[FgP72EB2FF+i+1])end;return F5kQWsQLPMpZB(res)
elseif FAZINRgWB==117 then
FWdCrs5FN9Uv9=FWdCrs5FN9Uv9+FgP72EB2FF*4
elseif FAZINRgWB==116 then
Yfyrw8G[FgP72EB2FF+1]=Yfyrw8G[hN4Gr7PMpy+1]*Yfyrw8G[NBpvDoWry4+1]
elseif FAZINRgWB==31 then
Yfyrw8G[FgP72EB2FF+1]=Yfyrw8G[hN4Gr7PMpy+1]%Yfyrw8G[NBpvDoWry4+1]
elseif FAZINRgWB==9 then
Yfyrw8G[FgP72EB2FF+1]=-Yfyrw8G[hN4Gr7PMpy+1]
elseif FAZINRgWB==23 then
if((Yfyrw8G[hN4Gr7PMpy+1]<=Yfyrw8G[NBpvDoWry4+1])~=(FgP72EB2FF~=0))then FWdCrs5FN9Uv9=FWdCrs5FN9Uv9+4 end
elseif FAZINRgWB==11 then
--CLOSE
elseif FAZINRgWB==30 then
local uv=LtKt3MJpaGQi[hN4Gr7PMpy+1];uv.stack[uv.index]=Yfyrw8G[FgP72EB2FF+1]
elseif FAZINRgWB==4 then
if((Yfyrw8G[hN4Gr7PMpy+1]<Yfyrw8G[NBpvDoWry4+1])~=(FgP72EB2FF~=0))then FWdCrs5FN9Uv9=FWdCrs5FN9Uv9+4 end
elseif FAZINRgWB==29 then
--TFORLOOP
elseif FAZINRgWB==121 then
Yfyrw8G[FgP72EB2FF+1]=Yfyrw8G[hN4Gr7PMpy+1]/Yfyrw8G[NBpvDoWry4+1]
elseif FAZINRgWB==113 then
Yfyrw8G[FgP72EB2FF+1]=Yfyrw8G[hN4Gr7PMpy+1]^Yfyrw8G[NBpvDoWry4+1]
elseif FAZINRgWB==13 then
local sBx=hN4Gr7PMpy;if sBx>=128 then sBx=sBx-256 end;Yfyrw8G[FgP72EB2FF+1]=Yfyrw8G[FgP72EB2FF+1]-Yfyrw8G[FgP72EB2FF+3];FWdCrs5FN9Uv9=FWdCrs5FN9Uv9+sBx*4
elseif FAZINRgWB==18 then
Yfyrw8G[FgP72EB2FF+1]=Yfyrw8G[hN4Gr7PMpy+1][Yfyrw8G[NBpvDoWry4+1]]
elseif FAZINRgWB==7 then
Yfyrw8G[FgP72EB2FF+1]=Yfyrw8G[hN4Gr7PMpy+1]..Yfyrw8G[NBpvDoWry4+1]
elseif FAZINRgWB==3 then
Yfyrw8G[FgP72EB2FF+1]={}
elseif FAZINRgWB==100 then
--TAILCALL
elseif FAZINRgWB==120 then
Yfyrw8G[FgP72EB2FF+1][Yfyrw8G[hN4Gr7PMpy+1]]=Yfyrw8G[NBpvDoWry4+1]
elseif FAZINRgWB==129 then
local proto=FYidfW[hN4Gr7PMpy+1];local upvals={};for i,def in ipairs(proto.upvalues)do if def[1]==1 then upvals[i]={stack=Yfyrw8G,index=def[2]+1}else upvals[i]=LtKt3MJpaGQi[def[2]+1]end end;Yfyrw8G[FgP72EB2FF+1]=function(...)return EIYkFWRokcW_(proto,{...},upvals)end
elseif FAZINRgWB==15 then
Yfyrw8G[FgP72EB2FF+1]=Yfyrw8G[hN4Gr7PMpy+1]
elseif FAZINRgWB==12 then
KVDOJN_mZe[YTswfHwOOh[hN4Gr7PMpy+1]]=Yfyrw8G[FgP72EB2FF+1]
elseif FAZINRgWB==1 then
if(not not Yfyrw8G[hN4Gr7PMpy+1])==(NBpvDoWry4~=0)then Yfyrw8G[FgP72EB2FF+1]=Yfyrw8G[hN4Gr7PMpy+1]else FWdCrs5FN9Uv9=FWdCrs5FN9Uv9+4 end
elseif FAZINRgWB==101 then
for i=FgP72EB2FF+1,FgP72EB2FF+hN4Gr7PMpy+1 do Yfyrw8G[i]=nil end
elseif FAZINRgWB==107 then
Yfyrw8G[FgP72EB2FF+1]=(hN4Gr7PMpy~=0);if NBpvDoWry4~=0 then FWdCrs5FN9Uv9=FWdCrs5FN9Uv9+4 end
elseif FAZINRgWB==37 then
--VARARG
elseif FAZINRgWB==108 then
local sBx=hN4Gr7PMpy;if sBx>=128 then sBx=sBx-256 end;Yfyrw8G[FgP72EB2FF+1]=Yfyrw8G[FgP72EB2FF+1]+Yfyrw8G[FgP72EB2FF+3];local step=Yfyrw8G[FgP72EB2FF+3];local idx=Yfyrw8G[FgP72EB2FF+1];local limit=Yfyrw8G[FgP72EB2FF+2];if(step>0 and idx<=limit)or(step<=0 and idx>=limit)then FWdCrs5FN9Uv9=FWdCrs5FN9Uv9+sBx*4;Yfyrw8G[FgP72EB2FF+4]=idx end
elseif FAZINRgWB==124 then
local args={};for i=1,hN4Gr7PMpy-1 do uDFBsUFKRlY2(args,Yfyrw8G[FgP72EB2FF+i+1])end;local fn=Yfyrw8G[FgP72EB2FF+1];local res;if (type(oK800BG4J1GJU)==type(oK800BG4J1GJU)) then res={fn(F5kQWsQLPMpZB(args))}else for FXaU=1,0 do ZAv8dktyFiNy=UK0wUgpw+1 end end;for i=1,NBpvDoWry4-1 do Yfyrw8G[FgP72EB2FF+i]=res[i]or nil end
elseif FAZINRgWB==8 then
Yfyrw8G[FgP72EB2FF+1]=#Yfyrw8G[hN4Gr7PMpy+1]
elseif FAZINRgWB==111 then
Yfyrw8G[FgP72EB2FF+1]=YTswfHwOOh[hN4Gr7PMpy+1]
elseif FAZINRgWB==35 then
if(not not Yfyrw8G[FgP72EB2FF+1])~=(NBpvDoWry4~=0)then FWdCrs5FN9Uv9=FWdCrs5FN9Uv9+4 end
elseif FAZINRgWB==17 then
Yfyrw8G[FgP72EB2FF+1]=KVDOJN_mZe[YTswfHwOOh[hN4Gr7PMpy+1]]
elseif FAZINRgWB==34 then
local uv=LtKt3MJpaGQi[hN4Gr7PMpy+1];Yfyrw8G[FgP72EB2FF+1]=uv.stack[uv.index]
elseif FAZINRgWB==114 then
Yfyrw8G[FgP72EB2FF+1]=Yfyrw8G[hN4Gr7PMpy+1]+Yfyrw8G[NBpvDoWry4+1]
elseif FAZINRgWB==20 then
for FXaU=1,0 do ZAv8dktyFiNy=UK0wUgpw+1 end
elseif FAZINRgWB==21 then
for oadV=1,0 do a_5zb1lZkuVzS=Ybd9Y0DFhKHqC+1 end
elseif FAZINRgWB==123 then
local DjmzVC=j0oz1gJd3ed+AaUnAL7icByF
elseif FAZINRgWB==24 then
if false then AaUnAL7icByF=nil end
elseif FAZINRgWB==127 then
if false then TpPOTAf=nil end
elseif FAZINRgWB==28 then
local MlooQM={0.4579951765669181,"ZwOIwDoH"}
elseif FAZINRgWB==5 then
if false then eqhZqQP7sMsi=nil end
elseif FAZINRgWB==6 then
if false then RZCHHrRSb650=nil end
elseif FAZINRgWB==16 then
if false then AaUnAL7icByF=nil end
elseif FAZINRgWB==26 then
if false then ZeZ9_HXBMy=nil end
elseif FAZINRgWB==36 then
if false then OcOKOPmXOI=nil end
elseif FAZINRgWB==33 then
for FYtZ=1,0 do JrMCG1En0T_E5=VjFEBaSpGXOC+1 end
elseif FAZINRgWB==110 then
if false then fq6_GSzm=nil end
elseif FAZINRgWB==119 then
local BIUgho={0.6944827821713015,"KZJz_vtE"}
elseif FAZINRgWB==105 then
local GuFxKS={0.7978928885483629,"XGztCmjj"}
elseif FAZINRgWB==126 then
for FXaU=1,0 do ZAv8dktyFiNy=UK0wUgpw+1 end
elseif FAZINRgWB==2 then
for oadV=1,0 do a_5zb1lZkuVzS=Ybd9Y0DFhKHqC+1 end
elseif FAZINRgWB==112 then
local DjmzVC=j0oz1gJd3ed+AaUnAL7icByF
elseif FAZINRgWB==115 then
if false then AaUnAL7icByF=nil end
elseif FAZINRgWB==32 then
if false then TpPOTAf=nil end
elseif FAZINRgWB==128 then
local MlooQM={0.4579951765669181,"ZwOIwDoH"}
elseif FAZINRgWB==118 then
if false then eqhZqQP7sMsi=nil end
elseif FAZINRgWB==102 then
if false then RZCHHrRSb650=nil end
elseif FAZINRgWB==19 then
if false then AaUnAL7icByF=nil end
elseif FAZINRgWB==125 then
if false then ZeZ9_HXBMy=nil end
elseif FAZINRgWB==22 then
if false then OcOKOPmXOI=nil end
elseif FAZINRgWB==109 then
for FYtZ=1,0 do JrMCG1En0T_E5=VjFEBaSpGXOC+1 end
elseif FAZINRgWB==103 then
if false then fq6_GSzm=nil end
elseif FAZINRgWB==122 then
local BIUgho={0.6944827821713015,"KZJz_vtE"}
elseif FAZINRgWB==27 then
local GuFxKS={0.7978928885483629,"XGztCmjj"}
else break end
end
end
EIYkFWRokcW_({code={110,134,235,249,215,154,129,208,118,190,235,238,30,96,87,72,176,79,1,43,190,11,199,148,124,176,144,176},consts={[[onCreatePost]],[[goodNoteHit]],[[onDestroy]]},protos={{code={222,134,235,249,208,157,129,208,132,191,235,238,29,103,84,72,162,76,1,43,185,8,198,148,219,79,146,182,52,81,76,37,55,203,252,183,151,192,38,68,46,30,55,197,235,97,92,11,160,161,79,205,189,188,155,251,241,81,152,116,80,173,63,91,168,18,147,192,207,24,49,243,150,189,111,46,253,30,229,20,3,97,168,125,145,148,0,115,54,251,199,30,5,175,54,31,42,207,7,118,99,203,222,57,16,11,178,1,233,75,252,69,39,63,135,41,56,121,122,181,72,74,20,183,55,129,45,86,141,88,195,82,102,5,63,11,10,90,96,210,144,121,208,8,33,177,69,142,232,220,162,31,96,186,106,201,13,82,253,226,248,234,230,57,85,81,26,93,172,200,81,116,86,157,44,51,60,248,26,157,130,222,42,28,2,55,91,171,175,12,238,55,181,52,179,214},consts={[[addHaxeLibrary]],[[FlxSprite]],[[flixel]],[[FlxTween]],[[flixel.tweens]],[[FlxEase]],[[ClientPrefs]],[[Std]],[[Math]],[[Reflect]],[[luaDebugMode]],[[runHaxeCode]],[[
        var colorSplash:Int = 0xFFFBEFA6; 
        var manualOffsetX:Float = 0; 
        var manualOffsetY:Float = 0; 

        var targetPrefs = ClientPrefs;
        if (Reflect.hasField(ClientPrefs, 'data')) targetPrefs = Reflect.field(ClientPrefs, 'data');
        Reflect.setProperty(targetPrefs, 'noteSplashes', false);

        game.setOnLuas('createTechSplash', function(dir:Int) {
            var strum = game.playerStrums.members[dir];
            
            if (strum == null) return;

            var hud = game.camHUD;
            
            var center = strum.getMidpoint();
            var cX = center.x + manualOffsetX;
            var cY = center.y + manualOffsetY;

            var sqSize = 95; 
            var thick = 2;
            var half = sqSize / 2;

            var linesData = [
                [0, -half, sqSize, thick], // Top
                [0, half, sqSize, thick],  // Bottom
                [-half, 0, thick, sqSize], // Left
                [half, 0, thick, sqSize]   // Right
            ];

            for (data in linesData) {
                var lx = cX + data[0] - (data[2]/2);
                var ly = cY + data[1] - (data[3]/2);

                var line = new FlxSprite(lx, ly);
                line.makeGraphic(Std.int(data[2]), Std.int(data[3]), colorSplash);
                line.cameras = [hud];

                line.alpha = 1;
                FlxTween.tween(line, {alpha: 0}, 0.25, {
                    onComplete: function(twn:FlxTween) { line.destroy(); }
                });
                game.add(line);
            }

            var segments = 16; 
            var radius = 38; 
            var segLen = 22;

            for (i in 0...segments) {
                var angle = i * (360 / segments);
                var rad = angle * (Math.PI / 180);

                var rLine = new FlxSprite(0, 0);
                rLine.makeGraphic(segLen, thick, colorSplash);
                rLine.cameras = [hud];

                var offX = Math.cos(rad) * radius;
                var offY = Math.sin(rad) * radius;
                
                rLine.x = cX - (segLen/2) + offX;
                rLine.y = cY - (thick/2) + offY;
                rLine.angle = angle + 90; 
                rLine.alpha = 0.9;

                var destX = cX - (segLen/2) + (Math.cos(rad) * (radius + 12));
                var destY = cY - (thick/2) + (Math.sin(rad) * (radius + 12));

                FlxTween.tween(rLine, {x: destX, y: destY, alpha: 0}, 0.3, {
                    ease: FlxEase.circOut,
                    onComplete: function(twn:FlxTween) { rLine.destroy(); }
                });
                game.add(rLine);
            }

            for (j in 0...4) {
                var pSize = 13;
                var part = new FlxSprite(cX - pSize/2, cY - pSize/2);
                part.makeGraphic(pSize, pSize, colorSplash);
                part.cameras = [hud];
                // part.angle = 45; 

                var pAng = (j * 90) - 45; 
                var pRad = pAng * (Math.PI / 180);
                var pDist = 110;

                var goX = (cX - pSize/2) + Math.cos(pRad) * pDist;
                var goY = (cY - pSize/2) + Math.sin(pRad) * pDist;

                FlxTween.tween(part, {x: goX, y: goY, angle: pAng + 180}, 0.35, {ease: FlxEase.expoOut});
                FlxTween.tween(part, {alpha: 0}, 0.35, {startDelay: 0.1});
                FlxTween.tween(part.scale, {x: 0, y: 0}, 0.35, {
                    ease: FlxEase.expoIn,
                    onComplete: function(twn:FlxTween) { part.destroy(); }
                });
                game.add(part);
            }
        });
    ]]},protos={},numParams=0,upvalues={},cs=23599,len=196},{code={222,130,235,249,208,145,141,208,132,187,235,238,29,107,88,72,2,48,15,43,89,4,199,148,70,72,158,176,222,93,77,37,55,207,248,183,128,193,36,70,44,18,56,197,139,101,90,11,0,164,69,205,74,187,224,249,243,90,152,116,176,169,59,91,8,30,235,192,184,27,203,241,246,191,102,46,240,2,237,20,172,108,84,127,143,106,0,115,208,242,203,30,5,173,53,31,43,186,124,70,122,63,208,59,126,21,178,0,133,74,202,69,135,58,125,41,36,124,11,181,51,65,18,177,55,129,35,86,141,88,195,82,6,5,54,11,151,91,146,212,153,110,210,10,41,218,68,142},consts={[[setPropertyFromGroup]],[[notes]],[[noteSplashDisabled]],[[getPropertyFromGroup]],[[rating]],[[sick]],[[createTechSplash]]},protos={},numParams=4,upvalues={},cs=17266,len=148},{code={222,134,235,249,208,157,129,208,132,191,235,238,29,103,84,72,173,78,1,41,179,13,200,148},consts={[[runHaxeCode]],[[
        var targetPrefs = ClientPrefs;
        if (Reflect.hasField(ClientPrefs, 'data')) targetPrefs = Reflect.field(ClientPrefs, 'data');
        Reflect.setProperty(targetPrefs, 'noteSplashes', true);
    ]]},protos={},numParams=0,upvalues={},cs=3459,len=24}},numParams=0,upvalues={},cs=3967,len=28},{...})