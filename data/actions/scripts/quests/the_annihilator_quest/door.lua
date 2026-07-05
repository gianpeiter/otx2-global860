function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 5132 then
		return false
	end

	if getPlayerStorageValue(cid, 51711) == 1 then
		doTransformItem(item.uid, item.itemid + 1)
		doTeleportThing(cid, toPosition, true)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	end

	return true
end