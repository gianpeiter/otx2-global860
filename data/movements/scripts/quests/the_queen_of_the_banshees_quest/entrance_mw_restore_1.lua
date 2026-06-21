function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) and getTileItemById({x = 32259, y = 31891, z = 10}, 1498).uid == 0 then
		doRelocate({x = 32259, y = 31891, z = 10}, {x = 32259, y = 31892, z = 10})
		doCreateItem(1498, 1, {x = 32259, y = 31891, z = 10})

		local lever = getTileItemById({x = 32315, y = 31910, z = 12}, 1946)
		if lever.uid > 0 then
			doTransformItem(lever.uid, 1945)
		end
	end

	return true
end