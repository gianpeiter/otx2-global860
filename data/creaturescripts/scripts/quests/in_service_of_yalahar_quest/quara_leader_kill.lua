local config = {
	bosses = {
		["Inky"] = {stor = 100028},
		["Sharptooth"] = {stor = 100029},
		["Splasher"] = {stor = 100030}
	}
}

function onKill(cid, target, damage, flags)
	if not isMonster(target) then
		return true
	end

	if getPlayerStorageValue(cid, 100086) ~= 21 then
		return true
	end

	local boss = config.bosses[getCreatureName(target)]
	if not boss then
		return true
	end

	if getPlayerStorageValue(cid, boss.stor) < 1 then
		setPlayerStorageValue(cid, boss.stor, 1)
	end

	if getPlayerStorageValue(cid, 100028) == 1 and
		getPlayerStorageValue(cid, 100029) == 1 and
		getPlayerStorageValue(cid, 100030) == 1 then
		setPlayerStorageValue(cid, 100086, 22)
	end

	return true
end