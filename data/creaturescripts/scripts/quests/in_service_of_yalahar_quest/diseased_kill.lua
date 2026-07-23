local config = {
	bosses = {
		["Diseased Fred"] = {stor = 100025},
		["Diseased Dan"] = {stor = 100026},
		["Diseased Bill"] = {stor = 100027}
	}
}

function onKill(cid, target, damage, flags)
	if not isMonster(target) then
		return true
	end

	if getPlayerStorageValue(cid, 100013) ~= 3 then
		return true
	end

	local boss = config.bosses[getCreatureName(target)]
	if not boss then
		return true
	end

	if getPlayerStorageValue(cid, boss.stor) < 1 then
		setPlayerStorageValue(cid, boss.stor, 1)
	end

	if getPlayerStorageValue(cid, 100025) == 1 and
		getPlayerStorageValue(cid, 100026) == 1 and
		getPlayerStorageValue(cid, 100027) == 1 then
		setPlayerStorageValue(cid, 100086, 8)
	end

	return true
end