function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 5288 then
		return false
	end

	if getPlayerStorageValue(cid, 100016) >= 2 or getPlayerStorageValue(cid, 100015) > 3 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
	else
		doTeleportThing(cid, toPosition, true)
		doTransformItem(item.uid, item.itemid + 1)
		setPlayerStorageValue(cid, 100044, 1)
	end

	return true
end