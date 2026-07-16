function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 1223 then
		return false
	end

	local storages = {
		10001,
		10002,
		10003,
		10004,
		10005,
		10006,
		10007
	}

	for _, storage in ipairs(storages) do
		if getPlayerStorageValue(cid, storage) ~= 1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
			return true
		end
	end

	doTeleportThing(cid, toPosition, true)
	doTransformItem(item.uid, 1224)

	return true
end