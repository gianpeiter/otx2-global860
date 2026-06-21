function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1946 and getTileItemById({x = 32220, y = 31842, z = 15}, 1945).uid > 0 and getPlayerStorageValue(cid, 32994) ~= 1 then
		doTransformItem(item.uid, 1945)

		doSendMagicEffect(getThingPos(item.uid), 13)

		doSendMagicEffect({x = 32217, y = 31843, z = 14}, 12)
		doSendMagicEffect({x = 32217, y = 31844, z = 14}, 12)
		doSendMagicEffect({x = 32217, y = 31845, z = 14}, 12)
		doSendMagicEffect({x = 32218, y = 31843, z = 14}, 12)
		doSendMagicEffect({x = 32218, y = 31845, z = 14}, 12)
		doSendMagicEffect({x = 32219, y = 31842, z = 14}, 12)
		doSendMagicEffect({x = 32219, y = 31846, z = 14}, 12)

		local tile = getTileItemById({x = 32214, y = 31850, z = 15}, 1485)
		if tile.uid > 0 then
			doTransformItem(tile.uid, 1484)
		end

		tile = getTileItemById({x = 32215, y = 31850, z = 15}, 1485)
		if tile.uid > 0 then
			doTransformItem(tile.uid, 1484)
		end

		tile = getTileItemById({x = 32216, y = 31850, z = 15}, 1485)
		if tile.uid > 0 then
			doTransformItem(tile.uid, 1484)
		end

	elseif item.itemid == 1946 then
		doSendMagicEffect(getThingPos(item.uid), 12)
		doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -170, -170, CONST_ME_NONE)
	end

	return true
end