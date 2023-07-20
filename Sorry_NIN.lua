include("common/lockstyle.lua")


function status_change(new,old)
	if new == "Dead" 
	then equip(sets.dead)
	end
	if windy() then
		equip(sets.windy)
	end
	
end

function get_sets()
	sets.dead = {
		body = "Federation Aketon"
	}
	sets.windy = {
		body = "Federation Aketon"
	}
end

function windy()
	if world.zone_id == 240 then
	return true
else
	false
end