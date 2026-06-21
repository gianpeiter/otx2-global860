local config = {
	swimmingPosition = {x = 32968, y = 32626, z = 5},
	caveEntrancePosition = {x = 32968, y = 32631, z = 8},
	caveExitPosition = {x = 32971, y = 32620, z = 8}
}

local swimmingOutfit = {
	lookType = 267,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookTypeEx = 0,
	lookAddons = 0
}

function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	-- Jumping off the mountain edge into the water
	if position.x == 32966 and position.y == 32626 and position.z == 5 then
		doTeleportThing(cid, config.swimmingPosition)
		doSendMagicEffect(config.swimmingPosition, CONST_ME_WATERSPLASH)

		doRemoveCondition(cid, CONDITION_OUTFIT)
		doSetCreatureOutfit(cid, swimmingOutfit, -1)
        doCreatureSetLookDirection(cid, EAST)

	-- Splash effect when jumping down the waterfall
	elseif position.x == 32968 and position.y == 32630 and position.z == 7 then
		doSendMagicEffect(position, CONST_ME_WATERSPLASH)

	-- Teleport when entering the waterfall / cave
	elseif position.x == 32968 and position.y == 32629 and position.z == 7 then
		doTeleportThing(cid, config.caveEntrancePosition)
		doSendMagicEffect(config.caveEntrancePosition, CONST_ME_TELEPORT)
		doCreatureSetLookDirection(cid, SOUTH)

	-- Leaving the cave through teleport
	elseif position.x == 32967 and position.y == 32630 and position.z == 8 then
		doTeleportThing(cid, config.caveExitPosition)
		doCreatureSetLookDirection(cid, EAST)
		doSendMagicEffect(config.caveExitPosition, CONST_ME_TELEPORT)

		doRemoveCondition(cid, CONDITION_OUTFIT)
	end

	return true
end