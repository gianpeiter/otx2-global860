function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 1257 then
		return false
	end

	if getPlayerStorageValue(cid, 100057) >= 1 then
		doTeleportThing(cid, toPosition, true)
		doTransformItem(item.uid, item.itemid + 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
	end

	return true
end