include("common/lockstyle.lua")

function get_sets()

	--Preccast sets
	include("equip/brd-precast-song.lua")

	-- Midcast sets
	include("equip/brd-midcast-song.lua")

	include("equip/song-ballad.lua")
	include("equip/song-march.lua")
	include("equip/song-minuet.lua")
	include("equip/song-scherzo.lua")

	-- idle sets
	include("equip/brd-idle")

	-- engaged sets
	include("equip.brd-engaged-sj-whm.lua")
	include("equip/brd-engaged-sj-dnc.lua")

	-- Weapon Skill sets
	include("equip/brd-evisceration.lua")
	include("equip/brd-rudras_storm.lua")
	include("equip/brd-mordant_rime.lua")
end

function precast(spell)
	if spell.type == "BardSong"
		then equip(sets.brd-precast-song)
	end
	if player.status == "Engaged" then equip({range=nil}) end
end

function midcast(spell)
	if spell.type == "BardSong" 
		then equip(sets.brd-midcast-song)
	end
	if string.find(spell.english,'Ballad')
		then equip(sets.song-ballad)
	end
	if string.find(spell.english,'Mazurka')
		then equip(sets.song-mazurka)
	end
	if string.find(spell.english,'Elegy')
		then equip(sets.song-elegy)
	end
	if string.find(spell.english,'Minne')
		then equip(sets.song-minne)
	end
	if string.find(spell.english,'Finale')
		then equip(sets.song-finale)
	end
	if string.find(spell.english,'Mambo')
		then equip(sets.song-mambo)
	end
	if string.find(spell.english,'Virelai')
		then equip(sets.song-virelai)
	end
	if string.find(spell.english,'Hymnus')
		then equip(sets.song-hymnus)
	end
	if string.find(spell.english,'Threnody')
		then equip(sets.song-threnody)
	end
	if string.find(spell.english,'Lullaby')
		then equip(sets.song-lullaby)
	end
	if string.find(spell.english,'March')
		then equip(sets.song-march)
	end
	if string.find(spell.english,'Requiem')
		then equip(sets.song-requiem)
	end
	if string.find(spell.english,'Carol')
		then equip(sets.song-carol)
	end
	if string.find(spell.english,'Prelude')
		then equip(sets.song-prelude)
	end
	if string.find(spell.english,'Etude')
		then equip(sets.song-Etude)
	end
	if string.find(spell.english,'Madrigal')
		then equip(sets.song-madrigal)
	end
	if string.find(spell.english,'Minuet')
		then equip(sets.song-minuet)
	end
	if string.find(spell.english,'Scherzo')
		then equip(sets.song-scherzo)
	end
	
	-- spells
	if sets.ws[spell.name]
		then equip(sets.ws[spell.name])
	end
	
	-- weapon skills
	if spell.name == "Evisceration"
		then equip(sets.brd-evisceration)
	end
	if spell.name == "Mordant Rime"
		then equip(sets.brd-mordan_rime)
	end
	if spell.name == "Rudra's Storm"
		then equip(sets.brd-rudras_storm)
	end
	
end
function aftercast(spell)
	if player.status == "Engaged" 
		and player.sub_job == "WHM"
			then equip(sets.brd-engaged-sj-whm)
		elseif player.sub_job == "DNC"
			then equip(sets.engaged_dnc)
		end
	end
	if player.status == "Idle" 
		then equip(sets.brd-idle)
	end
end	
function status_change(new,old)
	if new == "Engaged" and player.sub_job == "WHM"
		then equip(sets.brd-engaged-sj-whm)
		disable('main','sub','ammo')
	elseif new == "Engaged" and player.sub_job == "DNC"
		then equip(sets.engaged_dnc)
		disable('main','sub','ammo')
	if new == "Idle"
	then equip(sets.brd-idle)
	end
end
