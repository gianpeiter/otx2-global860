local arenaCondition = createConditionObject(CONDITION_OUTFIT)
setConditionParam(arenaCondition, CONDITION_PARAM_TICKS, 120000)
addOutfitCondition(arenaCondition, {lookType = 111})

function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	if item.actionid == 25300 then
		doAddCondition(cid, arenaCondition)

		setPlayerStorageValue(cid, 51711, -1)
		doTeleportThing(cid, SvargrondArena.kickPosition, true)

		doCreatureSay(cid, "Coward!", TALKTYPE_MONSTER)
		SvargrondArena.cancelEvents(cid)
		return true
	end

	local pitId = getPlayerStorageValue(cid, 51711)
	local arenaId = getPlayerStorageValue(cid, 51710)

	if pitId > 10 then
		doTeleportThing(cid, SvargrondArena.rewardPosition, true)
		setPlayerStorageValue(cid, 51711, 0)

		if arenaId == 1 then
			doSendMagicEffect(SvargrondArena.rewardPosition, CONST_ME_FIREWORK_BLUE)
			setPlayerStorageValue(cid, 51721, 1)
			doCreatureSay(cid, "Welcome back, little hero!", TALKTYPE_MONSTER)

		elseif arenaId == 2 then
			doSendMagicEffect(SvargrondArena.rewardPosition, CONST_ME_FIREWORK_YELLOW)
			setPlayerStorageValue(cid, 51722, 1)
			doCreatureSay(cid, "Congratulations, brave warrior!", TALKTYPE_MONSTER)

		elseif arenaId == 3 then
			doSendMagicEffect(SvargrondArena.rewardPosition, CONST_ME_FIREWORK_RED)
			setPlayerStorageValue(cid, 51723, 1)
			doCreatureSay(cid, "Respect and honour to you, champion!", TALKTYPE_MONSTER)
		end

		setPlayerStorageValue(
			cid,
			51710,
			getPlayerStorageValue(cid, 51710) + 1
		)

		doCreatureSay(
			cid,
			"Congratulations! You completed " .. ARENA[arenaId].name ..
			" arena, you should take your reward now.",
			TALKTYPE_MONSTER
		)

		setPlayerStorageValue(cid, ARENA[arenaId].questLog, 2)

		SvargrondArena.cancelEvents(cid)
		return true
	end

	local occupant = SvargrondArena.getPitOccupant(pitId, cid)
	if occupant then
		doPlayerSendTextMessage(
			cid,
			MESSAGE_EVENT_ADVANCE,
			getCreatureName(occupant) ..
			" is currently in the next arena pit. Please wait until " ..
			(getPlayerSex(occupant) == PLAYERSEX_FEMALE and "s" or "") ..
			"he is done fighting."
		)

		doTeleportThing(cid, fromPosition, true)
		return true
	end

	SvargrondArena.cancelEvents(cid)
	SvargrondArena.resetPit(pitId)
	SvargrondArena.scheduleKickPlayer(cid, pitId)

	doCreateMonster(
		ARENA[arenaId].creatures[pitId],
		PITS[pitId].summon
	)

	doTeleportThing(cid, PITS[pitId].center, true)
	doSendMagicEffect(PITS[pitId].center, CONST_ME_MAGIC_RED)

	doCreatureSay(cid, "Fight!", TALKTYPE_MONSTER)

	return true
end