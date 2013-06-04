// THIS SECTION ONLY FOR TEST!
--[[
function upd()
        //print(GE.Graphics:FixPosition(10, 20))
end
 
function drw()
        time = time + 1
        GE.Graphics:DrawText("GE.Graphics:DrawTexture(texture, x, y, width, height [, color]", 10, 10, "Default", Color(255, 255, 255, 255))
        GE.Graphics:DrawTexture("trails/smoke", Math.sin(time / 50) * (GE.WIDTH), 50, 100, 50)
       
        GE.Graphics:DrawText("GE.Graphics:DrawRect(texture, x, y, width, height [, rotation, color]", 10, 120, "Default", Color(255, 255, 255, 255))
        GE.Graphics:DrawRect(Math.sin(time / 25) * (GE.WIDTH), 140, 100, 100, time * 4, Color(255, 50, 50, 255))
       
        GE.Graphics:DrawText("GE.Graphics:DrawText(text, x, y, font, color)", 10, 320, "Default", Color(255, 255, 255, 255))
        GE.Graphics:DrawText("HAAAAX111", 10, 340, "TargetID", Color(255, 50, 50, 255))
end
 
function init()
        print("hi there, i am init!")  
end
 
GE.Core:RegisterGame("Wow look at me - i am game engine! xD", 800, 600, init, upd, drw)
]]--