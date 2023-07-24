function nighttime()
	if world.time >= 17*60
		or world.time < 7*60
	then return true
	end
	return false
end