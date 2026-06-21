local doors = {
    [20509] = 32998, -- primeiro selo
	[20510] = 32997, -- segundo selo
	[20511] = 32996, -- terceiro selo
	[20512] = 32995, -- quarto selo
	[20513] = 32994, -- quinto selo
	[20514] = 32993, -- sexto selo
	[20515] = 32992  -- sétimo selo
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 1225 then
		return false
	end

	local storage = doors[item.actionid]
	if not storage then
		return false
	end

	if getPlayerStorageValue(cid, storage) == 1 then
		doTeleportThing(cid, toPosition, true)
		doTransformItem(item.uid, 1226)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,
			"The door seems to be sealed against unwanted intruders.")
	end

	return true
end