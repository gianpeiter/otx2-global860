function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 6259 then
		return false
	end

	if getPlayerStorageValue(cid, 100041) == 1 or getPlayerStorageValue(cid, 100041) == 2 then
		doTeleportThing(cid, toPosition, true)
		doTransformItem(item.uid, item.itemid + 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
	end

	return true
end