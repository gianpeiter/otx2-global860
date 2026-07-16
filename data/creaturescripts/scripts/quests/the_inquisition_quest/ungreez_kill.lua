function onKill(cid, target, mostDamage, damage, flags, war)
	if not isMonster(target) then
		return true
	end

	if getCreatureName(target):lower() ~= "ungreez" then
		return true
	end

	if getPlayerStorageValue(cid, 100078) == 20 then
		setPlayerStorageValue(cid, 57684, 2)
		setPlayerStorageValue(cid, 100078, 21)
	end

	return true
end