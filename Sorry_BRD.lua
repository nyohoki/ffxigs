function sub_job_change(new, old)
    send_command(
		"wait 10; \
		input /lockstyleset 1"
	)
end

send_command(
	"wait 2; \
	input /lockstyleset 1"
)
function get_sets()

	--Preccast sets
	sets.precast_song = {
		range = "Angel Lyre+1",
		head = "Aoidos' Calot +1",
		neck = "Aoidos' Matiniee",
		ear1 = "Loquac. Earring",
		-- ear2 = "",
		body = "Sha'ir Manteel",
		hands = "Wayfarer Cuffs",
		ring1 = "Prolix Ring",
		ring2 = "Carb. Ring",
		back = "Twilight Cape",
		waist = "Embla Sash",
		legs = "Aeto. Trousers",
		feet = "Bihu Slippers +1"
	}

	-- Midcast sets
	sets.midcast_song = {
		head = "Aoidos' Calot +1",
		neck = "Aoidos' Matiniee",		
		ear1 = "Loquac. Earring",
		-- ear2 = "",
		body = "Fili Hongreline",
		hands = "Fili Manchettes",
		ring1 = "Prolix Ring",
		ring2 = "Carb. Ring",
		back = "Twilight Cape",
		waist = "Embla Sash",
		legs = "Fili Rhingrave",
		feet = "Bihu Slippers +1"
	}

	sets.song_ballad = {
		legs = "Fili Rhingrave"
	}
	sets.song_march = {
		hands = "Fili Manchettes"
	}
	sets.song_minuet = {
		body = "Fili Hongreline"
	}
	sets.song_scherzo = {
		feet = "Fili Cothurnes"
	}

	-- idle sets
	sets.idle = {
		-- head = "Aoidos' Calot +1",
		neck = "Twilight Torque",
		-- ear1 = "",
		-- ear2 = "",
		-- body = "Fili Hongreline",
		-- hands = "Fili Manchettes",
		ring1 = "Defending Ring",
		ring2 = "Shadow Ring",
		back = "Shadow Mantle",
		-- waist = "",
		-- legs = "Fili Rhingrave",
		feet = "Fili Cothurnes"
	}

	-- engaged sets
	sets.engaged_sj_whm = {
		range = "Gjallarhorn",
		head = "Aya. Zucchetto +2",
		neck = "Asperity Necklace",
		ear1 = "Bladeborn Earring",
		ear2 = "Steelflash Earring",
		body = "Ayanmo Corazza +2",
		hands = "Aya. Manopolas +2",
		ring1 = "Defending Ring",
		ring2 = "Rajas Ring",
		back = "Atheling Mantle",
		waist = "Windbuffet Belt +1",
		legs = "Aya. Cosciales +2",
		feet = "Aya. Gambieras +2"
	}
	sets.engaged_sj_dnc = {
		range = "Gjallarhorn",
		head = "Aya. Zucchetto +2",
		neck = "Asperity Necklace",
		ear1 = "Dudgeon Earring",
		ear2 = "Heartseeker Earring",
		body = "Ayanmo Corazza +2",
		hands = "Aya. Manopolas +2",
		ring1 = "Defending Ring",
		ring2 = "Rajas Ring",
		back = "Atheling Mantle",
		waist = "Windbuffet Belt +1",
		legs = "Aya. Cosciales +2",
		feet = "Aya. Gambieras +2"
	}

	-- Weapon Skill sets
	sets.evisceration = {
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
	sets.rudras_storm = {
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
	sets.mordant_rime = {
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
	if spell.type == "BardSong"
		then equip(sets.brd_precast_song)
	end
	if player.status == "Engaged"
		then equip({range=nil})
	end
	if spell.name == "Sneak"
	and buffactive.sneak
	then windower.ffxi.cancel_buff(71)
	end
	-- include("common/precast_sneak")
	--[[if spell.name == "Sneak"
		and buffactive.sneak
		then windower.ffxi.cancel_buff(71)
	end]]
end

function midcast(spell)
	if spell.type == "BardSong" 
		then equip(sets.midcast_song)
	end
	if string.find(spell.english,'Ballad')
		then equip(sets.song_ballad)
	end
	if string.find(spell.english,'Mazurka')
		then equip(sets.song_mazurka)
	end
	if string.find(spell.english,'Elegy')
		then equip(sets.song_elegy)
	end
	if string.find(spell.english,'Minne')
		then equip(sets.song_minne)
	end
	if string.find(spell.english,'Finale')
		then equip(sets.song_finale)
	end
	if string.find(spell.english,'Mambo')
		then equip(sets.song_mambo)
	end
	if string.find(spell.english,'Virelai')
		then equip(sets.song_virelai)
	end
	if string.find(spell.english,'Hymnus')
		then equip(sets.song_hymnus)
	end
	if string.find(spell.english,'Threnody')
		then equip(sets.song_threnody)
	end
	if string.find(spell.english,'Lullaby')
		then equip(sets.song_lullaby)
	end
	if string.find(spell.english,'March')
		then equip(sets.song_march)
	end
	if string.find(spell.english,'Requiem')
		then equip(sets.song_requiem)
	end
	if string.find(spell.english,'Carol')
		then equip(sets.song_carol)
	end
	if string.find(spell.english,'Prelude')
		then equip(sets.song_prelude)
	end
	if string.find(spell.english,'Etude')
		then equip(sets.song_etude)
	end
	if string.find(spell.english,'Madrigal')
		then equip(sets.song_madrigal)
	end
	if string.find(spell.english,'Minuet')
		then equip(sets.song_minuet)
	end
	if string.find(spell.english,'Scherzo')
		then equip(sets.song_scherzo)
	end
	
	-- spells
	
	-- weapon skills
	if spell.name == "Evisceration"
		then equip(sets.evisceration)
	end
	if spell.name == "Mordant Rime"
		then equip(sets.mordant_rime)
	end
	if spell.name == "Rudra's Storm"
		then equip(sets.rudras_storm)
	end
	
end
function aftercast(spell)
	if player.status == "Engaged" 
		and player.sub_job == "WHM"
			then equip(sets.engaged_sj_whm)
		elseif player.sub_job == "DNC"
			then equip(sets.engaged_sj_dnc)
	end
	if player.status == "Idle" 
		then equip(sets.idle)
	end
end
function status_change(new,old)
	if new == "Engaged"
		and player.sub_job == "WHM"
			then equip(sets.engaged_sj_whm)
		disable("main", "sub", "ammo")
	elseif new == "Engaged"
		and player.sub_job == "DNC"
			then equip(sets.engaged_sj_dnc)
		disable("main", "sub", "ammo")
	end
	if new == "Idle" 
		then equip(sets.idle)
	end
end
