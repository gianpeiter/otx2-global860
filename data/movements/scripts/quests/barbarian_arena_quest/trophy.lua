function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	local arenaId = ARENA_TROPHY[item.actionid]
	if not arenaId then
		return true
	end

	local storage = arenaId.trophyStorage
	if getPlayerStorageValue(cid, storage) == 1 then
		return true
	end

	local rewardPosition = getCreaturePosition(cid)
	rewardPosition.y = rewardPosition.y - 1

	local rewardItem = doCreateItem(arenaId.trophy, 1, rewardPosition)
	if rewardItem > 0 then
		doSetItemSpecialDescription(
			rewardItem,
			string.format(arenaId.desc, getCreatureName(cid))
		)
	end

	setPlayerStorageValue(cid, storage, 1)
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
	doTransformItem(item.uid, item.itemid - 1)

	return true
end