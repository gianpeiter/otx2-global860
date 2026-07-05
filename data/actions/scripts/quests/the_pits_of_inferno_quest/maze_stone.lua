function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1946 then
		return false
	end

	local stonePos = {
		x = toPosition.x - 1,
		y = toPosition.y + 1,
		z = toPosition.z
	}

	local stone = getTileItemById(stonePos, 1304)
	if stone.uid > 0 then
		doRemoveItem(stone.uid)
	end

	doTransformItem(item.uid, 1946)
	return true
end