function onStepIn(cid, item, position, fromPosition)

	if not isPlayer(cid) then
		return true
	end

	local blood = getTileItemById({x = 32243, y = 31892, z = 14}, 2016)

	if getPlayerStorageValue(cid, 32995) == -1 and blood.uid > 0 then
		doRemoveItem(blood.uid)
		doSendMagicEffect({x = 32243, y = 31892, z = 14}, CONST_ME_MAGIC_RED)

		setPlayerStorageValue(cid, 32995, 1)
		setPlayerStorageValue(cid, 100091, 2)

		doRelocate(position, {x = 32261, y = 31849, z = 15})
		doSendMagicEffect({x = 32261, y = 31849, z = 15}, CONST_ME_MAGIC_RED)
	else
		doRelocate(position, {x = 32249, y = 31892, z = 14})
		doSendMagicEffect({x = 32249, y = 31892, z = 14}, CONST_ME_DRAWBLOOD)

		doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -55, -55, CONST_ME_NONE)
	end

	return true
end