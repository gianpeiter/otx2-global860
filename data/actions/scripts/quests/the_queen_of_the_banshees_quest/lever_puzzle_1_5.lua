function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1946 and getPlayerStorageValue(cid, 32994) ~= 1 then
		doTransformItem(item.uid, 1945)

		doSendMagicEffect(getThingPos(item.uid), 13)

		doSendMagicEffect({x = 32217, y = 31843, z = 14}, 12)
		doSendMagicEffect({x = 32218, y = 31842, z = 14}, 12)
		doSendMagicEffect({x = 32219, y = 31841, z = 14}, 12)
		doSendMagicEffect({x = 32217, y = 31845, z = 14}, 12)
		doSendMagicEffect({x = 32218, y = 31845, z = 14}, 12)
		doSendMagicEffect({x = 32219, y = 31845, z = 14}, 12)
		doSendMagicEffect({x = 32220, y = 31845, z = 14}, 12)

	elseif item.itemid == 1946 then
		doSendMagicEffect(getThingPos(item.uid), 12)
		doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -170, -170, CONST_ME_NONE)
	end

	return true
end