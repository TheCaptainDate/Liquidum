Liq = {}
Liq.Core = {}
include("Graphics.lua")

Liq.Graphics.GameFill = Color(100, 100, 250, 255)
Liq.Registed = false
local time = 0
local oldTime =  0
local newTime = 0
Liq.deltaTime = 0

function Liq.Core:RegisterGame(title, x, y, init, update, paint)
        Liq.Graphics:GameFrame(title, x, y)
        Liq.Core.Init = init
        Liq.Core.UpdateFunc = update
        Liq.Core.Draw = paint
       
        init() ---> init game's stuff
       
        // after all // human after all :D
        Liq.Registred = true
end

function Liq.Core:Update()
        if Liq.Registred then
				newTime = CurTime()
				Liq.deltaTime = oldTime - newTime
				oldTime = CurTime()
                local cpx, cpy = input.GetCursorPos()
                       
                if cpx >= ScrW() / 2 + (Liq.WIDTH + 20) / 2 - 45 and cpx <= ScrW() / 2 + (Liq.WIDTH + 20) / 2 and
                        cpy >= ScrH() / 2 - (Liq.HEIGHT + 40) / 2 - 10 and cpy <=  ScrH() / 2 - (Liq.HEIGHT + 40) / 2 + 10 then
                        clsBcolor = Color(250, 0, 0, 255)
                        clsBhover = true;
                else
                        clsBcolor = Color(250, 50, 50, 255)
                        clsBhover = false;
                end
               
                // after all
                Liq.Core.UpdateFunc()
        end
end    
hook.Add("PostRenderVGUI", "GE_Update", function() Liq.Core:Update() end) --> TODO: find better hook

function Liq.Core:FixPosition(x, y) --> must be fixed
        finalX = Liq.X + x
        finalY = Liq.Y + y
           
        if finalX < Liq.X then finalX = Liq.X
        elseif finalX > Liq.X + Liq.HEIGHT then finalX = Liq.X + Liq.HEIGHT end
           
        if finalY < Liq.Y then finalY = Liq.Y
        elseif finalY > Liq.Y + Liq.HEIGHT then finalY = Liq.Y + Liq.HEIGHT  end
 
        --return 1
        return Vector(finalX, finalY, 0)
end