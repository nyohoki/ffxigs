--[[function sub_job_change(new, old)
	send_command("wait 2; input /lockstyleset 1")
end
send_command("wait 2; input /lockstyleset 1")
--]]
include("common/lockstyle.lua")
function get_sets()

	--Preccast sets
	sets.precast = {}
	
	sets.precast.song = {
		range = "Angel Lyre+1",
		head = "Aoidos' Calot +1",
		neck = "Aoidos' Matiniee",
		ear1 = "Loquac. Earring",
		body = "Sha'ir Manteel",
		hands = "Wayfarer Cuffs",
		ring2 = "Prolix Ring",
		back = "Twilight Cape",
		-- waist = "Aoidos' Belt",
		waist = "Embla Sash",
		legs = "Aeto. Trousers",
		feet = "Bihu Slippers +1"}

	--Midcast sets
	sets.midcast = {}
	
	sets.midcast.song = {
		head = "Aoidos' Calot +1",
		neck = "Aoidos' Matiniee",
		ear1 = "Loquac. Earring",
		body = "Fili Hongreline",
		hands = "Fili Manchettes",
		ring1 = "Prolix Ring",
		back = "Twilight Cape",
		-- waist = "Gleeman's Belt",
		waist = "Embla Sash",
		legs = "Fili Rhingrave",
		feet = "Bihu Slippers +1",
		ring2 = "Carb. Ring"
	}
		
	-- Midcast Songs
	sets.midcast.ballad = {legs = "Fili Rhingrave"}
	sets.midcast.march = {hands = "Fili Manchettes"}
	sets.midcast.minuet = {body = "Fili Hongreline"}
	sets.midcast.scherzo = {feet = "Fili Cothurnes"}
	
	--Aftercast sets
	sets.aftercast = {}
	
	sets.aftercast.idle = {
		-- head = "Aoidos' Calot +1",
		neck = "Twilight Torque",
		-- ear1 = "",
		-- ear2 = "",
		-- body = "Fili Hongreline",
		-- hands = "Fili Manchettes",
		ring1 = "Defending Ring",
		ring2 = "Shadow Ring",
		back = "Shadow Mantle",
		-- legs = "Fili Rhingrave",
		feet = "Fili Cothurnes"
	}
	tp_sets = {}
	tp_sets["whm"] = {
		range = "Gjallarhorn",
		head = "Aya. Zucchetto +2",
		body = "Ayanmo Corazza +2",
		back = "Atheling Mantle",
		neck = "Asperity Necklace",
		hands = "Aya. Manopolas +2",
		waist = "Windbuffet Belt +1",
		ear1 = "Bladeborn Earring",
		ring1 = "Defending Ring",
		legs = "Aya. Cosciales +2",
		ear2 = "Steelflash Earring",
		ring2 = "Rajas Ring",
		feet = "Aya. Gambieras +2"
	}
	sets.engaged_whm = {
		range = "Gjallarhorn",
		head = "Aya. Zucchetto +2",
		neck = "Asperity Necklace",
		ear1 = "Bladeborn Earring",
		body = "Ayanmo Corazza +2",
		hands = "Aya. Manopolas +2",
		ring1 = "Defending Ring",
		back = "Atheling Mantle",
		waist = "Windbuffet Belt +1",
		legs = "Aya. Cosciales +2",
		ear2 = "Steelflash Earring",
		ring2 = "Rajas Ring",
		feet = "Aya. Gambieras +2"
	}
	sets.engaged_dnc = {
		range = "Gjallarhorn",
		head = "Aya. Zucchetto +2",
		neck = "Asperity Necklace",
		ear1 = "Dudgeon Earring",
		body = "Ayanmo Corazza +2",
		hands = "Aya. Manopolas +2",
		ring1 = "Defending Ring",
		back = "Atheling Mantle",
		waist = "Windbuffet Belt +1",
		legs = "Aya. Cosciales +2",
		ear2 = "Heartseeker Earring",
		ring2 = "Rajas Ring",
		feet = "Aya. Gambieras +2"
	}	
		
	--Weapon Skill sets
	sets.ws = {}
	
	sets.ws["Evisceration"] = {
		head = "Aya. Zucchetto +2",
		neck = "Rancor Collar",
		ear1 = "Moonshade Earring",
		ear2 = "Brutal Earring",
		body = "Ayanmo Corazza +2",
		hands = "Aya. Manopolas +2",
		ring1 = "Ramuh Ring",
		ring2 = "Ramuh Ring",
		back = "Atheling Mantle",
		waist = "Cuchulain's Belt",
		legs = "Aya. Cosciales +2",
		feet = "Aya. Gambieras  +2"
	}

	sets.ws["Rudra's Storm"] = {
		head = "Aya. Zucchetto +2",
		neck = "Rancor Collar",
		ear1 = "Moonshade Earring",
		ear2 = "Brutal Earring",
		body = "Ayanmo Corazza +2",
		hands = "Aya. Manopolas +2",
		ring1 = "Ramuh Ring",
		ring2 = "Ramuh Ring",
		back = "Atheling Mantle",
		waist = "Cuchulain's Belt",
		legs = "Aya. Cosciales +2",
		feet = "Aya. Gambieras  +2"
	}
		
	sets.ws["Mordant Rime"] = {
		range = "Iron Ram Horn",
		head = "Wayfarer Circlet",
		neck = "Piper's Torque",
		ear1 = "Aoidos' Earring",
		ear2 = "Moonshade Earring",
		body = "Wayfarer Robe",
		hands = "Fili Manchettes",
		ring1 = "Carb. Ring",
		ring2 = "Carb. Ring",
		back = "Mesmeric Cape",
		waist = "Gleeman's Belt",
		legs = "Fili Rhingrave",
		feet = "Inyanga Crackows"
	}
 end
function precast(spell)
	if spell.type == 'BardSong' then
		equip(sets.precast.song)
	end
	if player.status == 'Engaged' then equip({range=nil}) end
end
function midcast(spell)
	if spell.type == 'BardSong' then equip(sets.midcast.song) end
		if string.find(spell.english,'Ballad') then equip(sets.midcast.ballad) end
		if string.find(spell.english,'Mazurka') then equip(sets.midcast.mazurka) end
		if string.find(spell.english,'Elegy') then equip(sets.midcast.elegy) end
		if string.find(spell.english,'Minne') then equip(sets.midcast.minne) end
		if string.find(spell.english,'Finale') then equip(sets.midcast.finale) end
		if string.find(spell.english,'Mambo') then equip(sets.midcast.mambo) end
		if string.find(spell.english,'Virelai') then equip(sets.midcast.virelai) end
		if string.find(spell.english,'Hymnus') then equip(sets.midcast.hymnus) end
		if string.find(spell.english,'Threnody') then equip(sets.midcast.threnody) end
		if string.find(spell.english,'Lullaby') then equip(sets.midcast.lullaby) end
		if string.find(spell.english,'March') then equip(sets.midcast.march) end
		if string.find(spell.english,'Requiem') then equip(sets.midcast.requiem) end
		if string.find(spell.english,'Carol') then equip(sets.midcast.carol) end
		if string.find(spell.english,'Prelude') then equip(sets.midcast.prelude) end
		if string.find(spell.english,'Etude') then equip(sets.midcast.Etude) end
		if string.find(spell.english,'Madrigal') then equip(sets.midcast.madrigal) end
		if string.find(spell.english,'Minuet') then equip(sets.midcast.minuet) end
		if string.find(spell.english,'Scherzo') then equip(sets.midcast.scherzo) end
	if sets.ws[spell.name] then equip(sets.ws[spell.name]) end
	
end
function aftercast(spell)
	if player.status == "Engaged" 
		and player.sub_job == "WHM"
			then equip(sets.engaged_whm)
		elseif player.sub_job == "DNC"
			then equip(sets.engaged_dnc)
		end
	end
	if player.status == "Idle" 
		then equip(sets.aftercast.idle)
	end
end	
function status_change(new,old)
	--[[if new == "Engaged" and player.sub_job == "WHM"
		then equip(sets.engaged_whm)
		disable('main','sub','ammo')
	elseif new == "Engaged" and player.sub_job == "DNC"
		then equip(sets.engaged_dnc)
		disable('main','sub','ammo')]]
	if new == "Idle"
	then equip(sets.aftercast.idle)
	end
end
