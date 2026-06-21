local wallPos = {x = 32259, y = 31890, z = 10}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	local wall = getTileItemById(wallPos, 1498)

	if item.itemid == 1945 then
		doTransformItem(item.uid, 1946)

		if wall.uid > 0 then
			doRemoveItem(wall.uid)
		end

	elseif item.itemid == 1946 then
		doTransformItem(item.uid, 1945)

		if wall.uid <= 0 then
			doRelocate(wallPos, {x = 32259, y = 31889, z = 10})
			doCreateItem(1498, 1, wallPos)
		end
	end

	return true
end