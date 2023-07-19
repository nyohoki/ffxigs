include("common/lockstyle.lua")


function get_sets()
	
	--Job Ability Sets
	sets.ja = {}
	sets.ja["Rampart"] = {head="Valor Coronet"}
	sets.ja["Cover"] = {head="Gallant Coronet"}
	sets.ja["Shield Bash"] = {Hands="Vlr. Gauntlets +2"}
	sets.ja["Sentinel"] = {feet="Vlr. Leggings +2"}
	
	--Engaged Sets
	sets.engaged = {}
	sets.engaged.normal = {main="Eminent Scimitar",sub="Eminent Shield",head="Aetosaur Helm",neck="Twilight Torque",ear1="Suppanomimi",ear2="Digni. Earring",body="Cab. Surcoat",hands="Aetosaur Gloves",ring1="Raja's Ring",ring2="Dark Ring", augments={"Phys. Damage Taken -3%",{"Breath Damage Taken -3%"}},back="Testudo Mantle",wasit="Windbuffet Belt",legs="Aeto. Trousers",feet="Aeto. Ledelsens"}
	
	--sets.engaged.normal = {main="Eminent Scimitar",sub="Eminent Shield",head="Aetosaur Helm",neck="Twilight Torque",ear1="Suppanomimi",ear2="Digni. Earring",body="Cab. Surcoat",hands="Vlr. Gauntlets +2",ring1="Titan Ring",ring2="Dark Ring", augments={"Phys. Damage Taken -3%",{"Breath Damage Taken -3%"}},back="Testudo Mantle",wasit="Windbuffet Belt",legs="Cab. Breeches",feet="Aeto. Ledelsens"}
	
	--Idle Sets
	sets.idle = {}
	sets.idle.normal = {main="Eminent Scimitar",sub="Eminent Shield",head="Aetosaur Helm",neck="Twilight Torque",ear1="Suppanomimi",ear2="Digni. Earring",body="Cab. Surcoat",hands="Aetosaur Gloves",ring1="Raja's Ring",ring2="Dark Ring", augments={"Phys. Damage Taken -3%",{"Breath Damage Taken -3%"}},back="Aptitude Mantle",wasit="Windbuffet Belt",legs="Aeto. Trousers",feet="Aeto. Ledelsens"}
	
	
	--Dead Set
	sets.dead = {}
	sets.dead.one = {body="Federation Aketon"}
end

function precast(spell)
end

function midcast(spell)
end

function aftercast(spell)
	if player.status=='Engaged' then
        equip(sets.engaged.normal)
    else
        equip(sets.idle.normal)
    end

end

function status_change(new,old)
	if new == 'Engaged' then
		equip(sets.engaged.normal)
	elseif new == 'Idle' then
		equip(sets.idle.normal)
	elseif new == "Dead" then
		equip(sets.dead.one)
	end
end