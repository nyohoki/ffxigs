include("common/lockstyle.lua")


function status_change(new,old)
	if new == "Dead" 
    then equip(sets.dead)
	end
end

function get_sets()
    sets.dead = {
        body = "Federation Aketon"
    }
end