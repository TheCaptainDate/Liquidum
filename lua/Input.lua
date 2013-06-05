Liq.Input = {}

function Liq.Input:RegisterListener(listener)
       
end

function Liq.Input:MouseClicked(mdata)
        if clsBhover and mdata == MOUSE_LEFT then
                Liq.Draw = false
                gui.EnableScreenClicker(false)
               
                ------ WRITE DESTROY FUNCTION (!!!)
                MsgN("==Sorry, now you get ton of errors==")
                Liq = nil
        end            
end
hook.Add("GUIMousePressed", "GE_MouseClicked", function(mdata) Liq.Input:MouseClicked(mdata) end)
