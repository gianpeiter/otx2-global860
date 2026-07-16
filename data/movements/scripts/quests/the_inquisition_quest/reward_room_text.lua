function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	if getPlayerStorageValue(cid, 6076) == -1 then
		setPlayerStorageValue(cid, 6076, 1)
		doCreatureSay(cid, "You can choose exactly one of these chests. Choose wisely!", TALKTYPE_ORANGE_1)
	end

	return true
end