local removals = {
	{x = 33295, y = 31677, z = 15},
	{x = 33296, y = 31677, z = 15},
	{x = 33297, y = 31677, z = 15},
	{x = 33298, y = 31677, z = 15},
	{x = 33299, y = 31677, z = 15}
}

local stoneId = 1304

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		for _, pos in ipairs(removals) do
			local stone = getTileItemById(pos, stoneId)
			if stone.uid > 0 then
				doRemoveItem(stone.uid)
			end
		end

		doTransformItem(item.uid, 1946)

	elseif item.itemid == 1946 then
		for _, pos in ipairs(removals) do
			if getTileItemById(pos, stoneId).uid == 0 then
				doCreateItem(stoneId, 1, pos)
			end
		end

		doTransformItem(item.uid, 1945)
	end

	return true
end