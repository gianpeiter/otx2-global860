function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	local gate = getTileItemById({x = 32214, y = 31850, z = 15}, 1484)

	if getPlayerStorageValue(cid, 32994) == -1 and gate.uid > 0 then
		doRelocate(position, {x = 32271, y = 31857, z = 15})
		setPlayerStorageValue(cid, 32994, 1)
		setPlayerStorageValue(cid, 100092, 2)

		doSendMagicEffect({x = 32271, y = 31857, z = 15}, 14)

		doSendMagicEffect({x = 32217, y = 31846, z = 14}, 12)
		doSendMagicEffect({x = 32215, y = 31844, z = 14}, 12)
		doSendMagicEffect({x = 32215, y = 31846, z = 14}, 12)
		doSendMagicEffect({x = 32217, y = 31847, z = 14}, 12)
		doSendMagicEffect({x = 32213, y = 31847, z = 14}, 12)
		doSendMagicEffect({x = 32217, y = 31848, z = 14}, 12)
		doSendMagicEffect({x = 32215, y = 31848, z = 14}, 12)

		doCreateItem(1491, 1, {x = 32215, y = 31848, z = 15})

		local coalBasin = {
			{x = 32214, y = 31850, z = 15},
			{x = 32215, y = 31850, z = 15},
			{x = 32216, y = 31850, z = 15}
		}

		for _, pos in ipairs(coalBasin) do
			local wall = getTileItemById(pos, 1484)
			if wall.uid > 0 then
				doRemoveItem(wall.uid)
				doCreateItem(1485, 1, pos)
			end
		end

		local levers = {
			{x = 32220, y = 31842, z = 15},
			{x = 32220, y = 31843, z = 15},
			{x = 32220, y = 31844, z = 15},
			{x = 32220, y = 31845, z = 15},
			{x = 32220, y = 31846, z = 15}
		}

		for _, pos in ipairs(levers) do
			local lever = getTileItemById(pos, 1945)
			if lever.uid > 0 then
				doTransformItem(lever.uid, 1946)
			end
		end
	else
		doRelocate(position, {x = 32215, y = 31848, z = 15})
		doSendMagicEffect({x = 32215, y = 31848, z = 15}, CONST_ME_DRAWBLOOD)
		doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -55, -55, CONST_ME_NONE)
	end

	return true
end