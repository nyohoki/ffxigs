include("common/lockstyle.lua")

function get_sets()

	--JA sets
	sets.ja = {}
	
	sets.ja.jig = {legs="Horos Tights",feet="Maxixi Shoes"}
		sets.ja['Spectral Jig'] = (sets.ja.jig)
		sets.ja['Chocobo Jig II'] = (sets.ja.jig)
		
	sets.ja.samba = {head="Maxixi Tiara",back="Senuna's Mantle",feet="Charis Shoes +2"}
		sets.ja['Haste Samba'] = (sets.ja.samba)
		sets.ja['Drain Samba'] = (sets.ja.samba)
		sets.ja['Drain Samba II'] = (sets.ja.samba)
		sets.ja['Drain Samba III'] = (sets.ja.samba)
		sets.ja['Aspir Samba'] = (sets.ja.samba)
		sets.ja['Aspir Samba II'] = (sets.ja.samba)
	
	sets.ja.step = {head="Maxixi Tiara",back="Toetapper Mantle"}
		sets.ja['Box Step'] = (sets.ja.step)
		sets.ja['Stutter Step'] = (sets.ja.step)
		sets.ja['Quickstep'] = (sets.ja.step)
		sets.ja['Feather Step'] = set_combine(sets.ja.step,{feet="Charis Shoes +2"})
	
	sets.ja.waltz = {head="Etoile Tiara",body="Maxixi Casaque",back="Toetapper Mantle",feet="Maxixi Shoes"}
		sets.ja['Curing Waltz'] = (sets.ja.waltz)
		sets.ja['Curing Waltz II'] = (sets.ja.waltz)
		sets.ja['Curing Waltz III'] = (sets.ja.waltz)
		sets.ja['Curing Waltz IV'] = (sets.ja.waltz)
		sets.ja['Curing Waltz V'] = (sets.ja.waltz)
		sets.ja['Healing Waltz'] = (sets.ja.waltz)
		sets.ja['Divine Waltz'] = (sets.ja.waltz)
		sets.ja['Divine Waltz II'] = (sets.ja.waltz)
		
	sets.ja.saber = {legs="Horos Tights"}
		sets.ja['Saber Dance'] = (sets.ja.saber)
		
	sets.ja['No Foot Rise'] = {body="Etoile Casaque +2"}
	
	
	sets.ja['Climactic Flourish'] = {head="Maculele Tiara"}

	sets.ja['Reverse Flourish'] = {hands="Maculele Bangles"}
	
	--Aftercast sets
	sets.aftercast = {}
	
	sets.aftercast.idle = {
		feet="Tandava Crackows"}
	
	sets.aftercast.engaged = {ammo="Charis Feather",head="Meghanada Visor",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Digni. Earring",body="Meghanada Cuirie",hands="Meghanada Gloves",ring1="Epona's Ring",ring2="Rajas Ring",back="Toetapper Mantle",waist="Windbuffet Belt",legs="Meg. Chausses",feet="Meg. Jambeaux"}	
		
	--Weapon Skill sets
	sets.ws = {}
	
	sets.ws.rudra = {ammo="Charis Feather",head="Meghanada Visor",neck="Shadow Gorget",ear2="Brutal Earring",body="Maghanada Cuirie",hands="Meghanada Gloves",ring1="Ramuh Ring",ring2="Ramuh Ring",back="Senuna's Mantle",waist="Cuchulain's Belt",legs="Meg. Chausses",feet="Meg. Jambeaux"}
	
	sets.ws.evis = {ammo="Charis Feather",head="Meghanada Visor",neck="Shadow Gorget",ear2="Brutal Earring",body="Maghanada Cuirie",hands="Meghanada Gloves",ring1="Ramuh Ring",ring2="Ramuh Ring",back="Senuna's Mantle",waist="Cuchulain's Belt",legs="Meg. Chausses",feet="Meg. Jambeaux"}
	
	sets.ws.pyrrhic = {ammo="Charis Feather",head="Meghanada Visor",neck="Rancor Collar",ear2="Brutal Earring",body="Maghanada Cuirie",hands="Meghanada Gloves",ring1="Ramuh Ring",ring2="Ramuh Ring",back="Senuna's Mantle",waist="Cuchulain's Belt",legs="Meg. Chausses",feet="Meg. Jambeaux"}
		
	sets.ws.sharky = {ammo="Charis Feather",head="Meghanada Visor",neck="Rancor Collar",ear2="Brutal Earring",body="Maghanada Cuirie",hands="Meghanada Gloves",ring1="Ramuh Ring",ring2="Ramuh Ring",back="Senuna's Mantle",waist="Cuchulain's Belt",legs="Meg. Chausses",et="Meg. Jambeaux"}
	
 end
function precast(spell)
	if spell.type == 'Waltz' and buffactive['saber dance'] then windower.ffxi.cancel_buff(410)
	elseif spell.type == 'Samba' and buffactive['fan dance'] then windower.ffxi.cancel_buff(411)
	elseif spell.name == 'Spectral Jig' and buffactive.sneak then windower.ffxi.cancel_buff(71) end
	if spell.type == 'Jig' then equip(sets.ja.jig) end
	if player.status == 'Engaged' then equip({range=nil}) end
	if spell.type == 'Jig' then equip(sets.ja.jig) end
	if spell.type=='Samba' then equip(sets.ja.samba) end
	if sets.ja[spell.name] then equip(sets.ja[spell.name]) end
	--elseif sets.ws[spell.name] then equip(sets.ws[spell.name]) end
	--if spell.type == "Weapon Skill" then equip(sets.ws.general) end
	if spell.name == "Rudra's Storm" then equip(sets.ws.rudra) end
	if spell.name == "Evisceration" then equip(sets.ws.evis) end
	if spell.name == "Pyrrhic Kleos" then equip(sets.ws.pyrrhic) end
	if spell.name == "Shark Bite" then equip(sets.ws.sharky) end
	if buffactive["Climactic Flourish"] and spell.name == "Rudra's Storm" then set_combine(sets.ws.rudra,{head="Maculele Tiara"}) end
end
function midcast(spell)
end 
function aftercast(spell)
	if player.status == 'Engaged' then
		equip(sets.aftercast.engaged)
	else equip(sets.aftercast.idle)
	end
end	
function status_change(new,old)
	if new == 'Engaged' then
		equip(sets.aftercast.engaged)
		disable('main','sub','ammo')
	elseif new == 'Idle' then
		equip(sets.aftercast.idle)
	end	
end
--function auto_presto(spell)
	--if spell.type == "Step" then
		--local allRecasts = windower.ffxi.get_ability_recast()
		--local prestoCooldown = allRecasts[236]
		--local under3FMs = not buffactive["Finishing Move 3"] and not buffactive["Finishing Move 4"] and not buffactive["Finishing Move 5"]
		--if player.main_job_level >= 77 and prestoCooldown < 1 and underFMs then
			--cast_delay(1.1)
			--send_command('@input /ja "Presto" <me>')
		--end
	--end
--end