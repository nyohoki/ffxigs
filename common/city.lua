sets.fed = {
	body = "Federation Aketon"
}
sets.kin = {
	body = "Kingdom Aketon"
}
sets.rep = {
	body = "Republic Aketon"
}
sets.adou = {
	body = "Councilor's Garb"
}
function fed_city()
	if world.zone == "Windurst Woods"
		or "Windurst Walls"
		or "Windurst Waters"
		or "Port Windurst"
		or "Heaven's Tower"
	then return true
	end
	return false
end
function kin_city()
	if world.zone == "Southern San d'Oria"
		or "Northern San d'Oria"
		or "Port San d'Oria"
		or "Chateau d'Oraguille"
	then return true
	end
	return false
end
function rep_city()
	if world.zone == "Bastok Mines"
		or "Bastok Markets"
		or "Port Bastok"
		or "Metalworks"
	then return true
	end
	return false
end
function adou_city()
	if world.zone == "Western Adoulin"
		or "Eastern Adoulin"
	then return true
	end
	return false
end