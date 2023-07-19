include("common/lockstyle.lua")


function get_sets()

	--Job Ability Sets
	sets.ja = {}
	
	sets.ja['Meditate'] = {head="Myochin Kabuto",hands="Saotome Kote"}
	
	--Aftercast
	sets.aftercast = {}
	
	sets.aftercast.engaged = {
		head="Aetosaur Helm",
		neck="Agasaya's Collar",
		ear2="Brutal Earring",
		body="Aetosaur Jerkin",
		hands="Aetosaur Gloves",
		ring2="Rajas Ring",
		back="Atheling Mantle",
		waist="Windbuffet Belt",
		legs="Aeto. Trousers",
		feet="Aeto. Ledelsens"} 
		
	sets.aftercast.idle = {
		head="Aetosaur Helm",
		body="Republic Aketon",
		feet="Aeto. Ledelsens"}
end
function precast(spell)
	if player.status == 'Engaged' then equip({range=nil}) end
end
function midcast(spell)
	if sets.ja[spell.name] then equip(sets.ja[spell.name]) end
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