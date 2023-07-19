include("common/lockstyle.lua")

function get_sets()

	--Preccast sets
	include("equip/brd_precast_song.lua")

	-- Midcast sets
	include("equip/brd_midcast_song.lua")

	include("equip/song_ballad.lua")
	include("equip/song_march.lua")
	include("equip/song_minuet.lua")
	include("equip/song_scherzo.lua")

	-- idle sets
	include("equip/brd_idle")

	-- engaged sets
	include("equip/brd_engaged_sj_whm.lua")
	include("equip/brd_engaged_sj_dnc.lua")

	-- Weapon Skill sets
	include("equip/brd_evisceration.lua")
	include("equip/brd_rudras_storm.lua")
	include("equip/brd_mordant_rime.lua")
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
end

function midcast(spell)
	if spell.type == "BardSong" 
		then equip(sets.brd_midcast_song)
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
		then equip(sets.brd_evisceration)
	end
	if spell.name == "Mordant Rime"
		then equip(sets.brd_mordan_rime)
	end
	if spell.name == "Rudra's Storm"
		then equip(sets.brd_rudras_storm)
	end
	
end
function aftercast(spell)
	if player.status == "Engaged" 
		and player.sub_job == "WHM"
			then equip(sets.brd_engaged_sj_whm)
		elseif player.sub_job == "DNC"
			then equip(sets.brd_engaged_sj_dnc)
	end
	if player.status == "Idle" 
		then equip(sets.brd_idle)
	end
end
function status_change(new,old)
	if new == "Engaged"
		and player.sub_job == "WHM"
			then equip(sets.brd_engaged_sj_whm)
		disable('main','sub','ammo')
	elseif new == "Engaged"
		and player.sub_job == "DNC"
			then equip(sets.brd_engaged_sj_dnc)
		disable('main','sub','ammo')
	end
	if new == "Idle" 
		then equip(sets.brd_idle)
	end
end