local stonePosition = {x = 32826, y = 32274, z = 11}
local teleportPosition = {x = 32826, y = 32273, z = 12}
local leverPosition = {x = 32826, y = 32263, z = 12}

function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	doTeleportThing(cid, teleportPosition, true)
	doSendMagicEffect(teleportPosition, CONST_ME_EXPLOSIONAREA)

	if getTileItemById(stonePosition, 1285).uid == 0 then
		doCreateItem(1285, 1, stonePosition)
	end

	local lever = getTileItemById(leverPosition, 1946)
	if lever.uid > 0 then
		doTransformItem(lever.uid, 1945)
	end

	return true
end