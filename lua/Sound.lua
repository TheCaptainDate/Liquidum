Liq.Sound = {}

function Liq.Sound:Play(...)
	args = {...}
	--surface.PlaySound(sound)
	sound = ""
	pitch = 100
	volume = 100
	plyPos = LocalPlayer():GetPos()
	--pos = Vector()
	pan = 0
	flag = false
	
	if #args >= 1 and #args <=6 then
		sound = args[1]
		if #args == 2 then
			pitch = args[2]
		elseif #args == 3 then
			pitch = args[2]
			volume = args[3]
		elseif #args == 4 then
			pitch = args[2]
			volume = args[3]
			pan = args[4]
			--pos = args[4]
		end
	else
		Error("Liq.Sound:Play(sound [, pitch, volume, pos (as Vector)])")
	end
	--Vector(pos.x + plyPos.x, pos.y + plyPos.y, pos.z + plyPos.z)
	vec = Vector(plyPos.x, plyPos.y, plyPos.z)
	WorldSound(sound, pan, volume, pitch)
end