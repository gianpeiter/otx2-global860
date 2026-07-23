function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 9277 and item.itemid ~= 9280 then
		return false
	end

	if getPlayerStorageValue(cid, 100037) == 1 and
	   getPlayerStorageValue(cid, 100023) == -1 and
	   getPlayerStorageValue(cid, 100024) == -1 then
		doTeleportThing(cid, toPosition, true)
		doTransformItem(item.uid, item.itemid + 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
	end

	return true
end