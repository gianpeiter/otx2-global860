function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 1225 then
		return false
	end

	if getPlayerStorageValue(cid, 62382) == 2 then
		doTeleportThing(cid, toPosition, true)
		doTransformItem(item.uid, item.itemid + 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
	end

	return true
end