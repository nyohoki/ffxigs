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
