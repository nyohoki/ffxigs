include("common/lockstyle.lua")


function get_sets()
	--Job Ability Sets
	sets.ja = {}
	sets.ja["Afflatus Solace"] = {body="Orison Bliaud +1"}
	sets.ja["Divine Veil"] = {head="Orison Cap +2"}
	sets.ja["Divine Caress"] = {hands="Orison Mitts +1"}
	sets.ja["Martyr"] = {hands="Clr. Mitts +2"}
	sets.ja["Allatus Misery"] = {}
	
	--White Magic Sets
	sets.wm = {}
	sets.wm["Auspice"] = {feet="Orsn. Duckbills +1"}
	sets.wm["Protectra V"] = {ring1="Sheltered Ring",feet="Clr. Duckbills +2"}
	sets.wm["ShellraV"] = {ring1="Sheltered Ring",legs="Piety Pantaloons"}
	sets.wm.regen = {body="Cleric's Briault",hands="Orison Mitts +1"}
	sets.wm.barspells = {head="Orison Cap +2",legs="Cleric's Pantaln."}
	sets.wm.cursna = {back="Alaunus's Cape",feet="Vanya Clogs"}
	sets.wm.cure = {main="Queller Rod",sub="Genbu's Shield",head="Orison Cap +2",ear2="Orison Earring",body="Orison Bliaud +1",hands="Clr. Mitts +2",legs="Cleric's Pantaln.",feet="Vanya Clogs"}
	sets.wm.enhance = {}
	sets.wm["Stoneskin"] = {}
	
		
	--Engaged Sets
	sets.engaged = {}
	sets.engaged.normal ={}
	
	--Resting Sets
	sets.rest = {}
	sets.rest.normal = {main="Pluto's Staff",head="Orvail Corona +1"}
	
	--Idle Sets
	sets.idle = {}
	sets.idle.normal = {main="Queller Rod",sub="Genbu's Shield",feet="Chironic Slippers",}
	
	--Fast Cast Sets
	sets.fc = {}
	sets.fc.normal = {head="Nahtirah Hat",ear1="Loquac. Earring",body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Prolix Ring",waist="Witful Belt",legs="Orvail Pants +1",feet="Wayfarer Clogs"}
	sets.fc.cure = {main="Queller Rod",head="Nahtirah Hat",ear1="Loquac. Earring",body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Prolix Ring",waist="Witful Belt",legs="Orvail Pants +1",feet="Chironic Slippers"}
	
end

function precast(spell)
	if spell.name == "Cure" then equip(sets.fc.cure) end
	if spell.name == "Cure II" then equip(sets.fc.cure) end
	if spell.name == "Cure III" then equip(sets.fc.cure) end
	if spell.name == "Cure IV" then equip(sets.fc.cure) end
	if spell.name == "Cure V" then equip(sets.fc.cure) end
	if spell.name == "Cure VI" then equip(sets.fc.cure) end
	if spell.name == "Cursna" then equip(sets.fc.normal) end
	if spell.type == "White Magic" then equip(sets.fc.normal) end
	if spell.type == "Black Magic" then equip(sets.fc.normal) end
end

function midcast(spell)
	if spell.name == "Protectra V" then equip(sets.wm["Protectra V"]) end
	if spell.name == "Auspice" then equip(sets.wm["Auspice"]) end
	if spell.name == "Cursna" then equip(sets.wm.cursna) end
	if string.find(spell.english,'Cure') then equip(sets.wm.cure) end
end

function aftercast(spell)
	if player.status == "Idle" then equip(sets.idle.normal) end
	if player.status == "Engaged" then equip(sets.engaged.normal) end
end

function status_change(new,old)
	if new == "Resting" then equip(sets.rest.normal) end
	if new == "Idle" then equip(sets.idle.normal) end
	if new == "Engaged" then equip(sets.engaged.normal) end
end