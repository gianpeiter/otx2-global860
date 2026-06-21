local wallPos = {x = 32266, y = 31860, z = 11}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	local wall = getTileItemById(wallPos, 1498)

	if item.itemid == 1945 then
		doTransformItem(item.uid, 1946)

		if wall.uid > 0 then
			doRemoveItem(wall.uid)

			local wall = getTileItemById(wallPos, 407)
			if wall.uid > 0 then
				doTransformItem(wall.uid, 408)
			end
		end

	elseif item.itemid == 1946 then
		doTransformItem(item.uid, 1945)

		if wall.uid <= 0 then
			local wall = getTileItemById(wallPos, 408)
			if wall.uid > 0 then
				doTransformItem(wall.uid, 407)
			end

			doCreateItem(1498, 1, wallPos)
		end
	end

	return true
end