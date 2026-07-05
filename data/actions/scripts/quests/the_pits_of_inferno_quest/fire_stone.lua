function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		local stonePos = {x = 32849, y = 32282, z = 10}
		local stone = getTileItemById(stonePos, 1304)

		if stone.uid > 0 then
			doRemoveItem(stone.uid)
			doSendMagicEffect(stonePos, CONST_ME_EXPLOSIONAREA)
			doTransformItem(item.uid, 1946)
		end
	end

	return true
end