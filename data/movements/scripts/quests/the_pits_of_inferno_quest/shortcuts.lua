local setting = {
	[10000] = 10000
}

function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	local storage = setting[item.actionid]
	if storage and getPlayerStorageValue(cid, storage) ~= 1 then
		setPlayerStorageValue(cid, storage, 1)
	end

	return true
end