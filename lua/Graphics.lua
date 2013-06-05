Liq.Graphics = {}

local clsBcolor = Color(250, 50, 50, 255)
local clsBhover = false

function Liq.Graphics:MainWindows()
        -- frame	
        
		-- "Красота требует жертв"
		draw.RoundedBox(8, (ScrW() / 2) - (Liq.WIDTH / 2) - 10, (ScrH() / 2) - (Liq.HEIGHT / 2) - 30, Liq.WIDTH + 20, Liq.HEIGHT + 40, Vector(255, 150, 50, 255))
        --surface.DrawRect((ScrW() / 2) - (Liq.WIDTH / 2) - 10, (ScrH() / 2) - (Liq.HEIGHT / 2) - 30, Liq.WIDTH + 20, Liq.HEIGHT + 40) --> TODO: terrible pos calc, rewrite (!!!)
       	--surface.SetDrawColor(250, 150, 50, 255)
	
        -- close button
        surface.SetDrawColor(clsBcolor)
        surface.DrawRect((ScrW() / 2) + (Liq.WIDTH + 20) / 2 - 45, (ScrH() / 2) - (Liq.HEIGHT + 40) / 2 - 10, 45, 20)
        surface.SetTextColor(0, 0, 0, 255)		
        surface.SetTextPos((ScrW() / 2) + (Liq.WIDTH + 20) / 2 - 25, (ScrH() / 2) - (Liq.HEIGHT + 40) / 2 - 8)
        surface.SetFont("DefaultBold")
        surface.DrawText("X")
       	
        -- game title
        surface.SetTextColor(0, 0, 0, 255)
        surface.SetTextPos((ScrW() / 2) - (Liq.WIDTH / 2) + 10, (ScrH() / 2) - (Liq.HEIGHT / 2) - 22)
        surface.SetFont("Trebuchet19")
        surface.DrawText(Liq.Title)
       
        -- game background fill
        surface.SetDrawColor(Liq.Graphics.GameFill)
        surface.DrawRect(ScrW() / 2 - Liq.WIDTH / 2, ScrH() / 2 - Liq.HEIGHT / 2, Liq.WIDTH, Liq.HEIGHT)
end
 
function Liq.Graphics:DrawTexture(...)
                args = {...}
                local texture
                local x
                local y
                local width
                local height
               
				--TODO: Fix this 'if'
                if #args == 5 then
                        texture = args[1]
                        x = args[2]
                        y = args[3]
                        width = args[4]
                        height = args[5]
                        color4 = Color(255, 255, 255, 255)
                elseif #args == 6 then
                        color4 = args[6]
                else
                        Error("Liq.Graphics:DrawTexture(texture, x, y, width, height [, color])")
                end
 
       
        local id = surface.GetTextureID(texture)
        surface.SetTexture(id)
        surface.SetDrawColor(color4)
        finalX = Liq.X + x
        finalY = Liq.Y + y
               
        if finalX < Liq.X then finalX = Liq.X
        elseif finalX > Liq.X + Liq.HEIGHT then finalX = Liq.X + Liq.HEIGHT end
       
        if finalY < Liq.Y then finalY = Liq.Y
        elseif finalY > Liq.Y + Liq.HEIGHT then finalY = Liq.Y + Liq.HEIGHT  end
        surface.DrawTexturedRect(finalX, finalY, width, height)
end
 
function Liq.Graphics:DrawRect(...)
        args = {...}
 
        if #args >= 4 and #args <=6 then
                x = args[1]
                y = args[2]
                width = args[3]
                height = args[4]
                color4 = Color(255, 255, 255, 255)
                rotation = 0
               
                if #args == 5 then
                        rotation = args[5]
                        color4 = Color(255, 255, 255, 255)
                elseif #args == 6 then
                        rotation = args[5]
                        color4 = args[6]
                end
                else
                Error("Liq.Graphics:DrawRect(x, y, width, height [, rotation, color])")
        end
       
        finalPos = Liq.Core:FixPosition(x, y)
       
        surface.SetTexture(surface.GetTextureID("models/airboat/airboat_blur02"))
        surface.SetDrawColor(color4)
        surface.DrawTexturedRectRotated(finalPos.x + width, finalPos.y + height, width, height, rotation)
end
 
function Liq.Graphics:DrawText(...)
        args = {...}
       
        if #args == 5 then
                text = args[1]
                x = args[2]
                y = args[3]
                font = args[4]
                color4 = args[5]
        end
       
        finalPos = Liq.Core:FixPosition(x, y)
       
        surface.SetFont(font)
        surface.SetTextPos(finalPos.x, finalPos.y)
        surface.SetTextColor(color4)
        surface.DrawText(text)
end
 
---> Main funcs (TODO: Edit this shit!)
function Liq.Graphics:GameFrame(Title, xSize, ySize)
        Liq.Title = Title
        Liq.WIDTH = xSize
        Liq.HEIGHT = ySize
        Liq.X = ScrW() / 2 - Liq.WIDTH / 2
    	Liq.Y = ScrH() / 2 - Liq.HEIGHT / 2
        Liq.Draw = true 
        gui.EnableScreenClicker(true)
end

function Liq.Graphics:Paint()
        if Liq.Draw and Liq.Registred then
                Liq.Graphics:MainWindows()
               
                // afer all
                Liq.Core.Draw()
        end
end
hook.Add("HUDPaint", "GE_Hud_Paint", function() Liq.Graphics.Paint() end)