local config = {
	bosses = {
		["Morik the Gladiator"] = {stor = 100031}
	}
}

function onKill(cid, target, damage, flags)
	if not isMonster(target) then
		return true
	end

	if getPlayerStorageValue(cid, 100031) ~= 1 then
		return true
	end

	local boss = config.bosses[getCreatureName(target)]
	if not boss then
		return true
	end

	if getPlayerStorageValue(cid, boss.stor) < 2 then
		setPlayerStorageValue(cid, boss.stor, 2)
	end

	return true
end