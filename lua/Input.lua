GE.Input = {}

//What??? There is no listeners...
function GE.Input:RegisterListener(listener)
       
end

function GE.Input:MouseClicked(mdata)
        if clsBhover and mdata == MOUSE_LEFT then
                GE.Draw = false
                gui.EnableScreenClicker(false)
               
                ------ WRITE DESTROY FUNCTION (!!!)
                MsgN("==Sorry, now you get ton of errors==")
                GE = nil
        end            
end
hook.Add("GUIMousePressed", "GE_MouseClicked", function(mdata) GE.Input:MouseClicked(mdata) end)
