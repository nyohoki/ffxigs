include("common/lockstyle.lua")
include("common/nighttime.lua")

function status_change(new,old)
	if nighttime()
		then equip(sets.nighttime)
	end
	if new == "Dead" 
		then equip(sets.dead)
	end
end

function get_sets()
	sets.dead = {
		body = "Federation Aketon"
	}
	sets.nightboots = {
		feet = "Ninja Kyahan"
	}
end
