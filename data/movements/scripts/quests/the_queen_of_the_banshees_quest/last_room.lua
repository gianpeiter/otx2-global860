function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	if getPlayerStorageValue(cid, 32991) < 1 then
		setPlayerStorageValue(cid, 32991, 1)
	end

	local teleportPos = {x = 32201, y = 31845, z = 7}

	doTeleportThing(cid, teleportPos, true)

	return true
end