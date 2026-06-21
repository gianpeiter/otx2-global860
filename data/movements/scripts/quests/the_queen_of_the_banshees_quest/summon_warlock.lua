function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	if getPlayerStorageValue(cid, 12984) == -1 then
		doCreateMonster("Warlock", {x = 32216, y = 31841, z = 15})
		doCreateMonster("Warlock", {x = 32216, y = 31834, z = 15})
		setPlayerStorageValue(cid, 12984, 1)
	end

	return true
end