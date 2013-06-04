GE = {}
GE.Core = {}   
local clsBcolor = Color(250, 50, 50, 255)
local clsBhover = false

GE.Graphics.GameFill = Color(100, 100, 250, 255)
GE.Registed = false
local time = 0
local oldTime =  0
local newTime = 0
GE.deltaTime = 0

function GE.Core:RegisterGame(title, x, y, init, update, paint)
        GE.Graphics:GameFrame(title, x, y)
        GE.Core.Init = init
        GE.Core.UpdateFunc = update
        GE.Core.Draw = paint
       
        init() ---> init game's stuff
       
        // after all // human after all :D
        GE.Registred = true
end

function GE.Core:Update()
        if GE.Registred then
				newTime = CurTime()
				GE.deltaTime = oldTime - newTime
				oldTime = CurTime()
                local cpx, cpy = input.GetCursorPos()
                       
                if cpx >= ScrW() / 2 + (GE.WIDTH + 20) / 2 - 45 and cpx <= ScrW() / 2 + (GE.WIDTH + 20) / 2 and
                        cpy >= ScrH() / 2 - (GE.HEIGHT + 40) / 2 - 10 and cpy <=  ScrH() / 2 - (GE.HEIGHT + 40) / 2 + 10 then
                        clsBcolor = Color(250, 0, 0, 255)
                        clsBhover = true;
                else
                        clsBcolor = Color(250, 50, 50, 255)
                        clsBhover = false;
                end
               
                // after all
                GE.Core.UpdateFunc()
        end
end    
hook.Add("PostRenderVGUI", "GE_Update", function() GE.Core:Update() end) --> TODO: find better hook

function GE.Core:FixPosition(x, y) --> must be fixed
        finalX = GE.X + x
        finalY = GE.Y + y
           
        if finalX < GE.X then finalX = GE.X
        elseif finalX > GE.X + GE.HEIGHT then finalX = GE.X + GE.HEIGHT end
           
        if finalY < GE.Y then finalY = GE.Y
        elseif finalY > GE.Y + GE.HEIGHT then finalY = GE.Y + GE.HEIGHT  end
 
        --return 1
        return Vector(finalX, finalY, 0)
end