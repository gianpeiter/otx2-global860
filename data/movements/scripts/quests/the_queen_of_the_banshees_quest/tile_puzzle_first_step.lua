function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) and getPlayerStorageValue(cid, 32999) <= 0 then
		setPlayerStorageValue(cid, 32999, 1)
	end

	doSendMagicEffect(position, CONST_ME_MAGIC_GREEN)
	return true
end

function onAddItem(moveitem, tileitem, position)
	doSendMagicEffect(position, CONST_ME_MAGIC_GREEN)
	return true
end