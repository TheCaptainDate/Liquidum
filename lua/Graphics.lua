GE.Graphics = {}

function GE.Graphics:MainWindows()
        -- frame	
        
		-- "Красота требует жертв"
		draw.RoundedBox(8, (ScrW() / 2) - (GE.WIDTH / 2) - 10, (ScrH() / 2) - (GE.HEIGHT / 2) - 30, GE.WIDTH + 20, GE.HEIGHT + 40, Vector(255, 150, 50, 255))
        --surface.DrawRect((ScrW() / 2) - (GE.WIDTH / 2) - 10, (ScrH() / 2) - (GE.HEIGHT / 2) - 30, GE.WIDTH + 20, GE.HEIGHT + 40) --> TODO: terrible pos calc, rewrite (!!!)
       	--surface.SetDrawColor(250, 150, 50, 255)
	
        -- close button
        surface.SetDrawColor(clsBcolor)
        surface.DrawRect((ScrW() / 2) + (GE.WIDTH + 20) / 2 - 45, (ScrH() / 2) - (GE.HEIGHT + 40) / 2 - 10, 45, 20)
        surface.SetTextColor(0, 0, 0, 255)		
        surface.SetTextPos((ScrW() / 2) + (GE.WIDTH + 20) / 2 - 25, (ScrH() / 2) - (GE.HEIGHT + 40) / 2 - 8)
        surface.SetFont("DefaultBold")
        surface.DrawText("X")
       	
        -- game title
        surface.SetTextColor(0, 0, 0, 255)
        surface.SetTextPos((ScrW() / 2) - (GE.WIDTH / 2) + 10, (ScrH() / 2) - (GE.HEIGHT / 2) - 22)
        surface.SetFont("Trebuchet19")
        surface.DrawText(GE.Title)
       
        -- game background fill
        surface.SetDrawColor(GE.Graphics.GameFill)
        surface.DrawRect(ScrW() / 2 - GE.WIDTH / 2, ScrH() / 2 - GE.HEIGHT / 2, GE.WIDTH, GE.HEIGHT)
end
 
function GE.Graphics:DrawTexture(...)
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
                        Error("GE.Graphics:DrawTexture(texture, x, y, width, height [, color])")
                end
 
       
        local id = surface.GetTextureID(texture)
        surface.SetTexture(id)
        surface.SetDrawColor(color4)
        finalX = GE.X + x
        finalY = GE.Y + y
               
        if finalX < GE.X then finalX = GE.X
        elseif finalX > GE.X + GE.HEIGHT then finalX = GE.X + GE.HEIGHT end
       
        if finalY < GE.Y then finalY = GE.Y
        elseif finalY > GE.Y + GE.HEIGHT then finalY = GE.Y + GE.HEIGHT  end
        surface.DrawTexturedRect(finalX, finalY, width, height)
end
 
function GE.Graphics:DrawRect(...)
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
                Error("GE.Graphics:DrawRect(x, y, width, height [, rotation, color])")
        end
       
        finalPos = GE.Core:FixPosition(x, y)
       
        surface.SetTexture(surface.GetTextureID("models/airboat/airboat_blur02"))
        surface.SetDrawColor(color4)
        surface.DrawTexturedRectRotated(finalPos.x + width, finalPos.y + height, width, height, rotation)
end
 
function GE.Graphics:DrawText(...)
        args = {...}
       
        if #args == 5 then
                text = args[1]
                x = args[2]
                y = args[3]
                font = args[4]
                color4 = args[5]
        end
       
        finalPos = GE.Core:FixPosition(x, y)
       
        surface.SetFont(font)
        surface.SetTextPos(finalPos.x, finalPos.y)
        surface.SetTextColor(color4)
        surface.DrawText(text)
end
 
---> Main funcs (TODO: Edit this shit!)
function GE.Graphics:GameFrame(Title, xSize, ySize)
        GE.Title = Title
        GE.WIDTH = xSize
        GE.HEIGHT = ySize
        GE.X = ScrW() / 2 - GE.WIDTH / 2
    	GE.Y = ScrH() / 2 - GE.HEIGHT / 2
        GE.Draw = true 
        gui.EnableScreenClicker(true)
end

function GE.Graphics:Paint()
        if GE.Draw and GE.Registred then
                GE.Graphics:MainWindows()
               
                // afer all
                GE.Core.Draw()
        end
end
hook.Add("HUDPaint", "GE_Hud_Paint", function() GE.Graphics.Paint() end)