function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray({7915, 7916}, itemEx.itemid) and itemEx.actionid == 20530 then
		-- Good Matrix Crystal
		if item.itemid == 9744 and getPlayerStorageValue(cid, 100023) == -1 then
			doSendMagicEffect(toPosition, 49)
			setPlayerStorageValue(cid, 100023, 1)
			doPlayerRemoveItem(cid, 9744, 1)

		-- Bad Matrix Crystal
		elseif item.itemid == 9743 and getPlayerStorageValue(cid, 100024) == -1 then
			doSendMagicEffect(toPosition, 66)
			setPlayerStorageValue(cid, 100024, 1)
			doPlayerRemoveItem(cid, 9743, 1)
		end
	end

	return true
end