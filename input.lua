local xx; 
 local yy; 
 local xx2; 
 local yy2; 
 local char = "dad" 
 local ofs = 45; 
 local followchars = true 
 
 function onEvent(name, value1, value2) 
     if name == "Camera Movement" then 
         local number = tonumber(value1) 
         if number == 1 then 
             char = "bf" 
         elseif number == 0 then 
             char = "dad" 
         elseif number == 2 then 
             char = "gf" 
         end 
     end 
 end 
 
 function onUpdate() 
     xx = getMidpointX("dad") + 150 + getProperty("dad.cameraPosition[0]") + getProperty("opponentCameraOffset[0]") 
     yy = getMidpointY("dad") - 100 + getProperty("dad.cameraPosition[1]") + getProperty("opponentCameraOffset[1]") 
     xx2 = getMidpointX("boyfriend") - 100 - getProperty("boyfriend.cameraPosition[0]") - getProperty("boyfriendCameraOffset[0]") 
     yy2 = getMidpointY("boyfriend") - 100 + getProperty("boyfriend.cameraPosition[1]") + getProperty("boyfriendCameraOffset[1]") 
     xx3 = getMidpointX("gf") + getProperty("gf.cameraPosition[0]") - getProperty("girlfriendCameraOffset[0]") 
     yy3 = getMidpointY("gf") + getProperty("gf.cameraPosition[1]") + getProperty("girlfriendCameraOffset[1]") 
     if followchars == true then 
         if char == "dad" then 
             if getProperty('dad.animation.curAnim.name') == 'singLEFT' then 
                 triggerEvent('Camera Follow Pos',xx-ofs,yy) 
             end 
             if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then 
                 triggerEvent('Camera Follow Pos',xx+ofs,yy) 
             end 
             if getProperty('dad.animation.curAnim.name') == 'singUP' then 
                 triggerEvent('Camera Follow Pos',xx,yy-ofs) 
             end 
             if getProperty('dad.animation.curAnim.name') == 'singDOWN' then 
                 triggerEvent('Camera Follow Pos',xx,yy+ofs) 
             end 
             if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then 
                 triggerEvent('Camera Follow Pos',xx-ofs,yy) 
             end 
             if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then 
                 triggerEvent('Camera Follow Pos',xx+ofs,yy) 
             end 
             if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then 
                 triggerEvent('Camera Follow Pos',xx,yy-ofs) 
             end 
             if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then 
                 triggerEvent('Camera Follow Pos',xx,yy+ofs) 
             end 
             if getProperty('dad.animation.curAnim.name') == 'idle-alt' then 
                 triggerEvent('Camera Follow Pos',xx,yy) 
             end 
             if getProperty('dad.animation.curAnim.name') == 'idle' then 
                 triggerEvent('Camera Follow Pos',xx,yy) 
             end 
         elseif char == "bf" then 
             
             if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then 
                 triggerEvent('Camera Follow Pos',xx2-ofs,yy2) 
             end 
             if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then 
                 triggerEvent('Camera Follow Pos',xx2+ofs,yy2) 
             end 
             if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then 
                 triggerEvent('Camera Follow Pos',xx2,yy2-ofs) 
             end 
             if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then 
                 triggerEvent('Camera Follow Pos',xx2,yy2+ofs) 
             end 
             if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then 
                 triggerEvent('Camera Follow Pos',xx2,yy2) 
             end 
             if getProperty('boyfriend.animation.curAnim.name') == 'idle' then 
                 triggerEvent('Camera Follow Pos',xx2,yy2) 
             end 
         elseif char == "gf" then 
             --setProperty("defaultCamZoom",0.9) 
             
             if getProperty('gf.animation.curAnim.name') == 'singLEFT' then 
                 triggerEvent('Camera Follow Pos',xx3-ofs,yy3) 
             end 
             if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then 
                 triggerEvent('Camera Follow Pos',xx3+ofs,yy3) 
             end 
             if getProperty('gf.animation.curAnim.name') == 'singUP' then 
                 triggerEvent('Camera Follow Pos',xx3,yy3-ofs) 
             end 
             if getProperty('gf.animation.curAnim.name') == 'singDOWN' then 
                 triggerEvent('Camera Follow Pos',xx3,yy3+ofs) 
             end 
             if getProperty('gf.animation.curAnim.name') == 'idle-alt' then 
                 triggerEvent('Camera Follow Pos',xx3,yy3) 
             end 
             if getProperty('gf.animation.curAnim.name') == 'idle' then 
                 triggerEvent('Camera Follow Pos',xx3,yy3) 
             end 
         end 
     else 
         triggerEvent('Camera Follow Pos','','') 
     end 
 end 
 
 function onSongStart() 
 triggerEvent('Camera Follow Pos',xx,yy) 
 end