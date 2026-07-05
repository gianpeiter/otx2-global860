local setting = {
	requiredLevel = 100,
	daily = false,

	centerDemonRoomPosition = {x = 33221, y = 31659, z = 13},

	demonsPositions = {
		{x = 33219, y = 31657, z = 13},
		{x = 33221, y = 31657, z = 13},
		{x = 33223, y = 31659, z = 13},
		{x = 33224, y = 31659, z = 13},
		{x = 33220, y = 31661, z = 13},
		{x = 33222, y = 31661, z = 13}
	},

	playersPositions = {
		{fromPos = {x = 33225, y = 31671, z = 13}, toPos = {x = 33222, y = 31659, z = 13}},
		{fromPos = {x = 33224, y = 31671, z = 13}, toPos = {x = 33221, y = 31659, z = 13}},
		{fromPos = {x = 33223, y = 31671, z = 13}, toPos = {x = 33220, y = 31659, z = 13}},
		{fromPos = {x = 33222, y = 31671, z = 13}, toPos = {x = 33219, y = 31659, z = 13}}
	}
}

local function isPlayerInRoom(centerPos)
	local spectators = getSpectators(centerPos, false, true, 4, 4, 4, 4)
	return #spectators > 0
end

local function removeMonstersInRoom(centerPos)
	local spectators = getSpectators(centerPos, false, false, 4, 4, 4, 4)

	for _, uid in ipairs(spectators) do
		if isMonster(uid) then
			doRemoveCreature(uid)
		end
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.itemid == 1945 then

		for i = 1, #setting.playersPositions do
			local player = getTopCreature(setting.playersPositions[i].fromPos).uid

			if player == 0 or not isPlayer(player) then
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
					"Four players are required to start the quest.")
				return true
			end

			if getPlayerLevel(player) < setting.requiredLevel then
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
					"All the players need to be level " .. setting.requiredLevel .. " or higher.")
				return true
			end
		end

		if isPlayerInRoom(setting.centerDemonRoomPosition) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
				"A team is already inside the quest room.")
			return true
		end

		for i = 1, #setting.demonsPositions do
			doCreateMonster("Angry Demon", setting.demonsPositions[i])
		end

		for i = 1, #setting.playersPositions do
			local player = getTopCreature(setting.playersPositions[i].fromPos).uid

			doTeleportThing(player, setting.playersPositions[i].toPos)
			doSendMagicEffect(setting.playersPositions[i].toPos, CONST_ME_TELEPORT)
		end

		doTransformItem(item.uid, 1946)

	elseif item.itemid == 1946 then

		if setting.daily then
			doPlayerSendCancel(cid, "Sorry, not possible.")
			return true
		end

		if isPlayerInRoom(setting.centerDemonRoomPosition) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
				"A team is already inside the quest room.")
			return true
		end

		removeMonstersInRoom(setting.centerDemonRoomPosition)

		doTransformItem(item.uid, 1945)
	end

	return true
end