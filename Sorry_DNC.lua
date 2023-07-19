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
	
	include("dnc/waltz.lua")
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
	
	include("dnc/idle.lua")
	
	include("dnc/engaged.lua")	
		
	--Weapon Skill sets
	include("dnc/rudras_storm.lua")
	include("dnc/evisceration.lua")
	include("dnc/pyrrhic_kleos.lua")
	include("dnc/shark_bite.lua")	
 end
function precast(spell)
	if spell.type == 'Waltz' and buffactive['saber dance'] then windower.ffxi.cancel_buff(410)
	elseif spell.type == 'Samba' and buffactive['fan dance'] then windower.ffxi.cancel_buff(411) end
	include("common/precast_spectral_jig.lua")
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
		equip(sets.engaged)
	else equip(sets.aftercast.idle)
	end
end	
function status_change(new,old)
	if new == 'Engaged' then
		equip(sets.engaged)
		disable('main','sub','ammo')
	elseif new == 'Idle' then
		equip(sets.aftercast.idle)
	end	
end
include("equip/auto_presto.lua")
