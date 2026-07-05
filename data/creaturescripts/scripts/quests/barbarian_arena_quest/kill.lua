function onKill(cid, target, lastHit)
	if not isPlayer(cid) or not isMonster(target) then
		return true
	end

	local pit = getPlayerStorageValue(cid, 51711)
	if pit < 1 or pit > 10 then
		return true
	end

	local arena = getPlayerStorageValue(cid, 51710)
	if arena < 1 then
		return true
	end

	local monsterName = string.lower(getCreatureName(target))
	if not isInArray(ARENA[arena].creatures, monsterName) then
		return true
	end

	-- Remove pillar and create teleport
	local pillarPos = PITS[pit].pillar
	local pillarItem = getTileItemById(pillarPos, SvargrondArena.itemPillar)

	if pillarItem.uid > 0 then
		doRemoveItem(pillarItem.uid)

		local teleport = doCreateItem(
			SvargrondArena.itemTeleport,
			1,
			PITS[pit].tp
		)

		if teleport > 0 then
			doSetItemActionId(teleport, 25200)
		end

		SvargrondArena.sendPillarEffect(pit)
	end

	setPlayerStorageValue(cid, 51711, pit + 1)

	doCreatureSay(
		cid,
		"Victory! Head through the new teleporter into the next room.",
		TALKTYPE_MONSTER
	)

	return true
end