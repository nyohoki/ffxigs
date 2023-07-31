send_command(
	"wait 2; \
	input /lockstyleset 1"
)
function sub_job_change(new, old)
    send_command(
		"wait 10; \
		input /lockstyleset 1"
	)
end

function get_sets()
	

	--JA sets
	sets.jig = {
		legs = "Horos Tights",
		feet = "Maxixi Shoes"
	}
	sets.samba = {
		head = "Maxixi Tiara",
		back = "Senuna's Mantle",
		feet = "Charis Toe Shoes +2"
	}
	sets.step = {
		head = "Maxixi Tiara",
		back = "Toetapper Mantle",
		feet = "Etoile Toe Shoes"
	}
	sets.feather_step = {
		head = "Maxixi Tiara",
		back = "Toetapper Mantle",
		feet = "Charis Toe Shoes +2"
	}
	sets.waltz = {
		head = "Mummu Bonnet +2",
		body = "Maxixi Casaque",
		back = "Toetapper Mantle",
		feet = "Maxixi Shoes"
	}
	sets.sabre = {
		legs = "Horos Tights"
	}
	sets.no_foot_rise = {
		body = "Etoile Casaque +2"
	}
	sets.climatic_flourish = {
		head = "Maculele Tiara"
	}
	sets.reverse_flourish = {
		hands = "Maculele Bangles"
	}
	sets.samba = {
		head = "Maxixi Tiara",
		back = "Senuna's Mantle",
		feet = "Charis Shoes +2"
	}

	--Aftercast sets
	sets.idle = {
		head = "Mummu Bonnet +2",
		neck = "Twilight Torque",
		-- ear1 = "",
		-- ear2 = "",
		body = "Mummu Jacket +2",
		hands = "Mummu Wrists +2",
		ring1 = "Defending Ring",
		ring2 = "Karieyh Ring",
		-- back = "",
		-- waist = "",
		legs = "Mummu Kecks +2",
		feet = "Tandava Crackows"
	}
	sets.engaged = {
		ammo = "Charis Feather",
		head = "Mummu Bonnet +2",
		neck = "Asperity Necklace",
		ear1 = "Dudgeon Earring",
		ear2 = "Heartseeker Earring",
		body = "Mummu Jacket +2",
		hands = "Mummu Wrists +2",
		ring1 = "Epona's Ring",
		ring2 = "Mummu Ring",
		back = "Toetapper Mantle",
		waist = "Windbuffet Belt +1",
		legs = "Meg. Chausses +2",
		feet = "Mummu Gamash. +2"
	}
		
	--Weapon Skill sets
	sets.evisceration = {
		ammo = "Charis Feather",
		head = "Mummu Bonnet +2",
		neck = "Shadow Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Brutal Earring",
		body = "Meg. Cuirie +2",
		hands = "Meg. Gloves +2",
		ring1 = "Ramuh Ring",
		ring2 = "Karieyh Ring",
		back = "Toetapper Mantle",
		waist = "Cuchulain's Belt",
		legs = "Mummu Kecks +2",
		feet = "Mummu Gamash. +2"
	}
	sets.rudras_storm = {
		ammo = "Charis Feather",
		head = "Mummu Bonnet +2",
		neck = "Shadow Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Brutal Earring",
		body = "Mummu Jacket +2",
		hands = "Meg. Gloves +2",
		ring1 = "Ramuh Ring",
		ring2 = "Karieyh Ring",
		back = "Toetapper Mantle",
		waist = "Cuchulain's Belt",
		legs = "Mummu Kecks +2",
		feet = "Mummu Gamash. +2"
	}
	sets.pyrrhic_kleos = {
		ammo = "Charis Feather",
		head = "Meghanada Visor +2",
		neck = "Asperity Necklace",
		ear1 = "Moonshade Earring",
		ear2 = "Brutal Earring",
		body = "Meg. Cuirie +2",
		hands = "Meg. Gloves +2",
		ring1 = "Ramuh Ring",
		ring2 = "Karieyh Ring",
		back = "Toetapper Mantle",
		waist = "Cuchulain's Belt",
		legs = "Meg. Chausses +2",
		feet = "Meg. Jam. +2"
	}
	sets.shark_bite = {
		ammo = "Charis Feather",
		head = "Mummu Bonnet +2",
		neck = "Shadow Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Brutal Earring",
		body = "Mummu Jacket +2",
		hands = "Meg. Gloves +2",
		ring1 = "Ramuh Ring",
		ring2 = "Karieyh Ring",
		back = "Toetapper Mantle",
		waist = "Cuchulain's Belt",
		legs = "Mummu Kecks +2",
		feet = "Mummu Gamash. +2"
	}
	sets.aeolian_edge = {
		ammo = "Phtm. Tathlum",
		head = "Herculean Helm",
		neck = "Stoicheion Medal",
		ear1 = "Hecate's Earring",
		ear2 = "Friomisi Earring",
		body = "Wayfarer Robe",
		hands = "Meg. Gloves +2",
		ring1 = "Shiva Ring",
		ring2 = "Karieyh Ring",
		back = "Toetapper Mantle",
		waist = "Cuchulain's Belt",
		legs = "Wayfarer Slops",
		feet = "Wayfarer Clogs"
	}
 end
 function auto_presto(spell)
	if spell.type == "Step"
		then if player.main_job_level >= 77
			and windower.ffxi.get_ability_recast()[236] < 1
			and not buffactive["Finishing Move 3"]
			and not buffactive["Finishing Move 4"]
			and not buffactive["Finishing Move 5"]
				then cast_delay(1.1)
				send_command('@input /ja "Presto" <me>')
		end
	end
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
		then equip(sets.reverse_flourish)
	end
	if spell.name == "Climatic Flourish"
		then equip(sets.climatic_flourish)
	end
	if spell.name == "No Foot Rise"
		then equip(sets.no_foot_rise)
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
	if spell.english == "Aeolian Edge"
		then equip(sets.aeolian_edge)
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
