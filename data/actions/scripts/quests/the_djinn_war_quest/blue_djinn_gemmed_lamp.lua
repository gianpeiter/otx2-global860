function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid ~= 20541 then
		return false
	end

	if getPlayerStorageValue(cid, 9032) == 6 and doPlayerRemoveItem(cid, 2344, 1) then
		setPlayerStorageValue(cid, 9032, 7)
		doSendMagicEffect(toPosition, 29)
		doPlayerAddItem(cid, 2356, 1)
		setPlayerStorageValue(cid, 100064, 13)
	end

	return true
end