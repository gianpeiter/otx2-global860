function onStepIn(cid, item, position, fromPosition)

	if isPlayer(cid) and getPlayerStorageValue(cid, 32999) ~= 0 then
		setPlayerStorageValue(cid, 32999, 0)
	end

	doSendMagicEffect(position, CONST_ME_HITBYFIRE)
	return true
end

function onAddItem(moveItem, tileItem, position, cid)

	doSendMagicEffect(position, CONST_ME_HITBYFIRE)
	return true
end