function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	if getPlayerStorageValue(cid, 32993) == -1 then
		doCreateItem(1490, 1, {x = 32171, y = 31854, z = 15})
		doCreateItem(1490, 1, {x = 32170, y = 31854, z = 15})

		setPlayerStorageValue(cid, 32993, 1)
        setPlayerStorageValue(cid, 100093, 2)

		doRelocate(position, {x = 32272, y = 31849, z = 15})
		doSendMagicEffect({x = 32272, y = 31849, z = 15}, CONST_ME_ENERGYAREA)

		doCreateItem(1490, 1, {x = 32172, y = 31854, z = 15})
		doCreateItem(1490, 1, {x = 32170, y = 31855, z = 15})
		doCreateItem(1490, 1, {x = 32171, y = 31855, z = 15})
		doCreateItem(1490, 1, {x = 32172, y = 31855, z = 15})
		doCreateItem(1490, 1, {x = 32170, y = 31856, z = 15})
		doCreateItem(1490, 1, {x = 32171, y = 31856, z = 15})
		doCreateItem(1490, 1, {x = 32172, y = 31856, z = 15})

		doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -33, -33, CONST_ME_NONE)
	else
		doRelocate(position, {x = 32171, y = 31854, z = 15})
		doSendMagicEffect({x = 32171, y = 31854, z = 15}, CONST_ME_DRAWBLOOD)

		doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -155, -155, CONST_ME_NONE)
	end

	return true
end