function get_sets()

	--Preccast sets
	sets.precast = {}
	
	sets.precast.song = {
		range="Angel Lyre+1",
		head="Aoidos' Caolt +1",
		neck="Aoidos' Matiniee",
		ear1="Loquac. Earring",
		body="Sha'ir Manteel",
		hands="Wayfarer Cuffs",
		ring2="Prolix Ring",
		back="Twilight Cape",
		waist="Aoidos' Belt",
		legs="Aeto. Trousers",
		feet="Bihu Slippers +1"}

	--Midcast sets
	sets.midcast = {}
	
	sets.midcast.song = {
		head="Aoidos' Calot +1",
		neck="Aoidos' Matiniee",
		ear1="Loquac. Earring",
		body="Fili Hongreline",
		hands="Fili Manchettes",
		ring1="Prolix Ring",
		ring2="Carb. Ring",
		back="Twilight Cape",
		waist="Gleeman's Belt",
		legs="Fili Rhingrave",
		feet="Bihu Slippers +1"}
		
	-- Midcast Songs
	sets.midcast.ballad = {legs="Fili Rhingrave"}
	sets.midcast.mazurka = {range="Vihuela"}
	sets.midcast.elegy = {range="Syrinx"}
	sets.midcast.minne = {range="Syrinx"}
	sets.midcast.finale = {range="Ney"}
	sets.midcast.mambo = {range="Vihuela"}
	sets.midcast.virelai = {range="Cyt. Anglica +1"}
	sets.midcast.hymnus = {range="Angel Lyre"}
	sets.midcast.threnody = {range="Sorrowful Harp"}
	sets.midcast.lullaby = {range="Nursemaid's Harp"}
	sets.midcast.march = {range="Iron Ram Horn",hands="Fili Manchettes"}
	sets.midcast.requiem = {range="Hamelin Flute"}
	sets.midcast.carol = {range="Crumhorn +1"}
	sets.midcast.prelude = {range="Angel's Flute +1"}
	sets.midcast.etude = {range="Rose Harp +1"}
	sets.midcast.madrigal = {range="Traversiere+1"}
	sets.midcast.minuet = {range="Cornette +2",body="Fili Hongreline"}
	sets.midcast.scherzo = {feet="Fili Cothurnes"}
	
	--Aftercast sets
	sets.aftercast = {}
	
	sets.aftercast.idle = {
		range="Oneiros Harp",
		head="Aoidos' Calot +1",
		body="Fili Hongreline",
		hands="Fili Manchettes",
		legs="Fili Rhingrave",
		feet="Fili Cothurnes"}
	
	sets.aftercast.engaged = {
		range="Angel Lyre",
		head="Aetosaur Helm",
		neck="Agasaya's Collar",
		ear2="Brutal Earring",
		body="Aetosaur Jerkin",
		hands="Aetosaur Gloves",
		ring1="Prolix Ring",
		ring2="Rajas Ring",
		back="Atheling Mantle",
		waist="Windbuffet Belt",
		legs="Aeto. Trousers",
		feet="Aeto. Ledelsens"}	
		
	--Weapon Skill sets
	sets.ws = {}
	
	sets.ws['Evisceration'] = {
		range="Angel Lyre",
		head="Aetosaur Helm",
		neck="Rancor Collar",
		ear2="Brutal Earring",
		body="Aetosaur Jerkin",
		hands="Aetosaur Gloves",
		ring1="Ramuh Ring",
		ring2="Ramuh Ring",
		back="Atheling Mantle",
		waist="Cuchulain's Belt",
		legs="Byakko's Haidate",
		feet="Aeto. Ledelsens"}
		
	sets.ws['Mordant Rime'] = {
		range="Iron Ram Horn",
		head="Wayfarer Circlet",
		neck="Piper's Torque",
		ear2="Brutal Earring",
		body="Wayfarer Robe",
		hands="Wayfarer Cuffs",
		ring1="Carb. Ring",
		ring2="Ramuh Ring",
		back="Mesmeric Cape",
		waist="Gleeman's Belt",
		legs="Wayfarer Slops",
		feet="Wayfarer Clogs "}
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