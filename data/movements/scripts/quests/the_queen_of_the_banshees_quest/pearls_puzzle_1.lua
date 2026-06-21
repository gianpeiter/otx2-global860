function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	local item1 = getTileItemById({x = 32180, y = 31871, z = 15}, 2144)
	local item2 = getTileItemById({x = 32173, y = 31871, z = 15}, 2143)

	if item1.uid > 0 and item2.uid > 0 then
		doRelocate({x = 32176, y = 31869, z = 15}, {x = 32176, y = 31863, z = 15})
		doSendMagicEffect({x = 32176, y = 31863, z = 15}, CONST_ME_MAGIC_BLUE)

		doRemoveItem(item2.uid)
		doRemoveItem(item1.uid)

		doSendMagicEffect({x = 32173, y = 31871, z = 15}, CONST_ME_POFF)
		doSendMagicEffect({x = 32180, y = 31871, z = 15}, CONST_ME_POFF)
	else
		doRelocate({x = 32176, y = 31869, z = 15}, {x = 32176, y = 31870, z = 15})
		doTargetCombatHealth(0, cid, COMBAT_POISONDAMAGE, -100, -100, CONST_ME_NONE)
	end

	return true
end

function onAddItem(moveItem, tileItem, position)
	doRelocate({x = 32176, y = 31869, z = 15}, {x = 32176, y = 31870, z = 15})
	return true
end