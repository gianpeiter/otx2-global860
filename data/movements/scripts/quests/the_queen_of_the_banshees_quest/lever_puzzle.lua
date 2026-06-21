function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid)
		and getPlayerStorageValue(cid, 32997) == -1
		and getTileItemById({x = 32309, y = 31975, z = 13}, 1421).uid > 0
		and getTileItemById({x = 32309, y = 31976, z = 13}, 1421).uid > 0
		and getTileItemById({x = 32311, y = 31975, z = 13}, 1421).uid > 0
		and getTileItemById({x = 32311, y = 31976, z = 13}, 1421).uid > 0
		and getTileItemById({x = 32313, y = 31975, z = 13}, 1423).uid > 0
		and getTileItemById({x = 32313, y = 31976, z = 13}, 1423).uid > 0 then

		doSendMagicEffect({x = 32311, y = 31978, z = 13}, CONST_ME_MAGIC_BLUE)
		setPlayerStorageValue(cid, 32997, 1)
		setPlayerStorageValue(cid, 100089, 2)

		doRelocate(position, {x = 32261, y = 31856, z = 15})
		doSendMagicEffect({x = 32261, y = 31856, z = 15}, CONST_ME_TELEPORT)

	else
		doRelocate(position, {x = 32311, y = 31977, z = 13})
		doSendMagicEffect({x = 32311, y = 31977, z = 13}, CONST_ME_DRAWBLOOD)

		doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -250, -250, CONST_ME_NONE)
	end

	return true
end