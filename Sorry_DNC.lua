include("common/lockstyle.lua")
include("common/city.lua")
function get_sets()
	

	--JA sets
	include("dnc/jig.lua")
	include("dnc/samba.lua")
	include("dnc/step.lua")
	include("dnc/feather.lua")
	include("dnc/waltz.lua")
	include("dnc/sabre.lua")
	include("dnc/nfr.lua")
	include("dnc/climatic.lua")
	include("dnc/reverse.lua")
	include("dnc/samba.lua")

	--Aftercast sets
	include("dnc/idle.lua")
	include("dnc/engaged.lua")	
		
	--Weapon Skill sets
	include("dnc/evisceration")
	include("dnc/rudras_storm.lua")
	include("dnc/pyrrhic_kleos.lua")
	include("dnc/shark_bite.lua")	
 end

function precast(spell)
	if spell.type == "Waltz"
		and buffactive["saber dance"]
		then windower.ffxi.cancel_buff(410)
	elseif spell.type == "Samba"
		and buffactive["fan dance"]
		then windower.ffxi.cancel_buff(411)
	end
	if spell.name == "Saber Dance"
		then equip(sets.sabre)
	end
	if spell.name == "Spectral Jig"
		and buffactive.sneak
		then windower.ffxi.cancel_buff(71)
	end
	if spell.type == "Jig"
		then equip(sets.jig)
	end
	if spell.type == "Samba"
		then equip(sets.samba)
	end
	if spell.type == "Waltz"
		then equip(sets.waltz)
	end
	if spell.name == "Reverse Flourish"
		then equip(sets.reverse)
	end
	if spell.name == "Climatic Flourish"
		then equip(sets.climatic)
	end
	if spell.name == "No Foot Rise"
		then equip(sets.nfr)
	end
	if spell.name == "Rudra's Storm"
		then equip(sets.rudras_storm)
	end
	if spell.name == "Evisceration"
		then equip(sets.evisceration)
	end
	if spell.name == "Pyrrhic Kleos"
		then equip(sets.pyrrhic_kleos)
	end
	if spell.name == "Shark Bite"
		then equip(sets.shark_bite)
	end
	if buffactive["Climactic Flourish"]
		and spell.name == "Rudra's Storm"
		then set_combine(
			sets.rudras_storm, {
				head = "Maculele Tiara"
			}
		)
	end
	if buffactive["Climactic Flourish"]
		and spell.name == "Evisceration"
		then set_combine(
			sets.evisceration, {
				head = "Maculele Tiara"
			}
		)
	end
	if spell.name == "Box Step"
		then equip(sets.step)
	end
	if spell.name == "QuickStep"
		then equip(sets.step)
	end
	if spell.name == "StutterStep"
		then equip(sets.step)
	end
	if spell.name == "Feather Step"
		then equip(sets.feather_step)
	end
end

function midcast(spell)
end 

function aftercast(spell)
	if player.status == "Engaged"
		then equip(sets.engaged)
	else equip(sets.idle)
	end
end	

function status_change(new,old)
	if new == "Engaged"
		then equip(sets.engaged)
	elseif new == "Idle"
		then equip(sets.idle)
	end
end