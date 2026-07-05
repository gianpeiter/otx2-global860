function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	local stonePos = {x = 32849, y = 32282, z = 10}
	local leverPos = {x = 32850, y = 32268, z = 10}

	local stone = getTileItemById(stonePos, 1304)
	local lever = getTileItemById(leverPos, 1946)

	if stone.uid == 0 and lever.uid > 0 then
		doCreateItem(1304, 1, stonePos)
		doTransformItem(lever.uid, 1945)
		doCreatureSay(cid, "You hear a rumbling from far away.", TALKTYPE_MONSTER, false)
	end

    doTransformItem(item.uid, item.itemid - 1)

	return true
end