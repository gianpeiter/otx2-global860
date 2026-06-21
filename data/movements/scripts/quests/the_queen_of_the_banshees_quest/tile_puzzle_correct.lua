function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) then
		if getPlayerStorageValue(cid, 32999) ~= 0 then
			doSendMagicEffect(position, CONST_ME_MAGIC_GREEN)
		else
			doSendMagicEffect(position, CONST_ME_HITBYFIRE)
		end
	end

	return true
end

function onAddItem(moveitem, tileitem, position)
	doSendMagicEffect(position, CONST_ME_MAGIC_GREEN)
	return true
end