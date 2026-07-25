function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid ~= 20537 then
		return false
	end

	if getPlayerStorageValue(cid, 100058) == 2 and getPlayerStorageValue(cid, 100060) == -1 then
		setPlayerStorageValue(cid, 100060, 1)
		doPlayerRemoveItem(cid, 2344, 1)
		doPlayerAddItem(cid, 2356, 1)
		setPlayerStorageValue(cid, 100062, 11)
		doSendMagicEffect(toPosition, 29)
	end

	return true
end