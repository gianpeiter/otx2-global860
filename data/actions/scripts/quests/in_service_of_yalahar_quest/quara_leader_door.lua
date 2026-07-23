function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 1257 and item.itemid ~= 9177 then
		return false
	end

	if getPlayerStorageValue(cid, 100022) == 1 and getPlayerStorageValue(cid, 100021) <= 1 then
		doTeleportThing(cid, toPosition, true)
		doTransformItem(item.uid, item.itemid + 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	end

	return true
end