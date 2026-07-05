local stonePosition = {x = 32826, y = 32274, z = 11}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 1945 then
		return true
	end

	doTransformItem(item.uid, 1946)

	local stone = getTileItemById(stonePosition, 1285)
	if stone.uid > 0 then
		doRemoveItem(stone.uid)
		doSendMagicEffect(stonePosition, CONST_ME_POFF)
	end

	return true
end