function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 5114 then
		return false
	end

	if getPlayerStorageValue(cid, 57684) == 1 then
		doTeleportThing(cid, toPosition, true)
		doTransformItem(item.uid, item.itemid + 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
	end

	return true
end