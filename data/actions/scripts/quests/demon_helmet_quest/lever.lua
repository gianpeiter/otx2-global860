local stonePos = {x = 33314, y = 31592, z = 15}
local teleportPos = {x = 33316, y = 31591, z = 15}
local tpToPos = {x = 33328, y = 31592, z = 14}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.itemid == 1945 then

		local stone = getTileItemById(stonePos, 1355)
		if stone.uid > 0 then
			doRemoveItem(stone.uid)
		end

		local tp = getTileItemById(teleportPos, 1387)
		if tp.uid > 0 then
			doRemoveItem(tp.uid)
		end

		doRelocate(teleportPos, {x = 33317, y = 31591, z = 15})

		doCreateTeleport(1387, tpToPos, teleportPos)

		doTransformItem(item.uid, 1946)

	elseif item.itemid == 1946 then

		local tp = getTileItemById(teleportPos, 1387)
		if tp.uid > 0 then
			doRemoveItem(tp.uid)
		end

		doRelocate(stonePos, {x = 33315, y = 31592, z = 15})

		doCreateItem(1355, 1, stonePos)

		doTransformItem(item.uid, 1945)
	end

	return true
end