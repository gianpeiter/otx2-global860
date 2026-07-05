function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	local pitId = getPlayerStorageValue(cid, 51711)
	if pitId < 1 or pitId > 10 then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
			"You cannot enter without Halvar's permission.")
		doTeleportThing(cid, fromPosition, true)
		return true
	end

	local arenaId = getPlayerStorageValue(cid, 51710)
	if not PITS[pitId] or not ARENA[arenaId] then
		doTeleportThing(cid, fromPosition, true)
		return true
	end

	local occupant = SvargrondArena.getPitOccupant(pitId, cid)
	if occupant then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
			getCreatureName(occupant) ..
			" is currently in the next arena pit. Please wait until " ..
			(getPlayerSex(occupant) == PLAYERSEX_FEMALE and "s" or "") ..
			"he is done fighting.")

		doTeleportThing(cid, fromPosition, true)
		return true
	end

	SvargrondArena.resetPit(pitId)
	SvargrondArena.scheduleKickPlayer(cid, pitId)

	doCreateMonster(
		ARENA[arenaId].creatures[pitId],
		PITS[pitId].summon
	)

	doTeleportThing(cid, PITS[pitId].center, true)
	doSendMagicEffect(PITS[pitId].center, CONST_ME_MAGIC_RED)

	doCreatureSay(
		cid,
		"FIGHT!",
		TALKTYPE_MONSTER
	)

	return true
end