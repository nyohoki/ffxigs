function get_sets()
	tp_index = 1
	idle_index = 1
	
	sets.ja ={}
	sets.ja['Sneak Attack'] = {hands="Raid. Armlets +1"}

	--I Just Don't Know Fam
	sets.idle = {}
	sets.idle.Normal = {feet="Trotter Boots"}	
	
	--Melee Sets
	tp_set_names = {"TH","Acc","Eva"}
	--sets.tp.index = {"TH","Acc","Eva"}
	--tp_ind = 1
	sets.tp = {}
	sets.tp["TH"] = {range="Raider's Bmrng.",head="Meghanada Visor",neck="Asperity Necklace",ear2="Brutal Earring",body="Maghanada Cuirie",hands="Plun. Armlets",ring1="Epona's Ring",ring2="Rajas Ring",back="Atheling Mantle",waist="Windbuffet Belt",legs="Meg. Chausses",feet="Skulk. Poulaines"}
	
	sets.tp["Acc"] = {range="Raider's Bmrng.",head="Meghanada Visor",neck="Asperity Necklace",ear2="Brutal Earring",body="Maghanada Cuirie",hands="Meghanada Gloves",ring1="Epona's Ring",ring2="Rajas Ring",back="Atheling Mantle",waist="Windbuffet Belt",legs="Meg. Chausses",feet="Meg. Jambeaux"}
		
	sets.tp["Eva"] = {range="Raider's Bmrng.",head="Meghanada Visor",neck="Evasion Torque",ear2="Brutal Earring",body="Maghanada Cuirie",hands="Meghanada Gloves",ring1="Garuda Ring",ring2="Garuda Ring",back="Boxer's Mantle",waist="Sveltesse Gouriz",legs="Meg. Chausses",feet="Meg. Jambeaux"}
		
	--Weapon Skill sets
	sets.WS = {}
	sets.WS.SA = {}
	sets.WS.TA = {}
	sets.WS.SATA = {}
	
	sets.WS["Mandalic Stab"] = {head="Meghanada Visor",neck="Shadow Gorget",ear2="Brutal Earring",body="Maghanada Cuirie",hands="Meghanada Gloves",ring1="Ramuh Ring",ring2="Ramuh Ring",back="Atheling Mantle",waist="Cuchulain's Belt",legs="Meg. Chausses",feet="Meg. Jambeaux"}
	
	sets.WS["Evisceration"] = {head="Meghanada Visor",neck="Shadow Gorget",ear2="Brutal Earring",body="Maghanada Cuirie",hands="Meghanada Gloves",ring1="Ramuh Ring",ring2="Ramuh Ring",back="Atheling Mantle",waist="Cuchulain's Belt",legs="Meg. Chausses",feet="Meg. Jambeaux"}
	
	sets.WS["Rudra's Storm"] = {head="Meghanada Visor",neck="Shadow Gorget",ear2="Brutal Earring",body="Maghanada Cuirie",hands="Meghanada Gloves",ring1="Ramuh Ring",ring2="Ramuh Ring",back="Atheling Mantle",waist="Cuchulain's Belt",legs="Meg. Chausses",feet="Meg. Jambeaux"}
	
	sets.WS.SA["Mandalic Stab"] = set_combine(sets.WS["Mandalic Stab"],{hands="Raid. Armlets +1",back="Toutatis's Cape"})
	
	sets.WS.SA["Evisceration"] = set_combine(sets.WS["Evisceration"],{hands="Raid. Armlets +1",back="Toutatis's Cape"})
end

function precast(spell)
	if sets.ja[spell.english] then
		equip(sets.ja[spell.english])	
	elseif spell.type=="WeaponSkill" then
		if sets.WS[spell.english] then equip(sets.WS[spell.english]) end
		if buffactive['Sneak Attack'] and buffactive['Trick Attack'] and sets.WS.SATA[spell.english] then equip(sets.WS.SATA[spell.english])
		elseif buffactive['Sneak Attack'] and sets.WS.SA[spell.english] then equip(sets.WS.SA[spell.english])
		elseif buffactive['Trick Attack'] and sets.WS.TA[spell.english] then equip(sets.WS.TA[spell.english])
		end
	end
end 

function midcast(spell)

end

function aftercast(spell)
    if player.status=='Engaged' then
        equip(sets.tp[tp_set_names[tp_index]])
    else
        equip(sets.idle[idle_Set_Names])
    end
end

function status_change(new,old)
	if new == 'Engaged' then
		equip(sets.tp[tp_set_names[tp_index]])
	elseif new == 'Idle' then
		equip(sets.idle.Normal)
	end
end

function self_command(command)
    if command == "toggle tp set" then
        tp_index = tp_index +1
		if tp_index > #tp_set_names then tp_index = 1 end
        send_command('@input /echo '..tp_set_names[tp_index]..' Set On')
        equip(sets.tp[tp_set_names[tp_index]])
	elseif command == "tp" then
        tp_index = "Acc"
        send_command('@input /echo Melee Set on')
        equip(sets.TP["Acc"])
    end
end