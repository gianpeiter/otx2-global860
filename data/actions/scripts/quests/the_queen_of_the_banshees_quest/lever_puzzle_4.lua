function onUse(cid, item, fromPosition, itemEx, toPosition)
	local pos = {x = 32311, y = 31975, z = 13}

	if item.itemid == 1945 then
		doTransformItem(item.uid, 1946)

		local campfire = getTileItemById(pos, 1423)
		if campfire.uid > 0 then
			doRemoveItem(campfire.uid)
		end

		campfire = getTileItemById(pos, 1421)
		if campfire.uid > 0 then
			doRemoveItem(campfire.uid)
		end

		doCreateItem(1421, 1, pos)

	elseif item.itemid == 1946 then
		doTransformItem(item.uid, 1945)

		local campfire = getTileItemById(pos, 1421)
		if campfire.uid > 0 then
			doRemoveItem(campfire.uid)
		end

		campfire = getTileItemById(pos, 1423)
		if campfire.uid > 0 then
			doRemoveItem(campfire.uid)
		end

		doCreateItem(1423, 1, pos)
	end

	return true
end