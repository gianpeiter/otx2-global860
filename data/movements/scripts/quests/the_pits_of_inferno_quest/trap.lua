local config = {
	[10251] = {x = 32842, y = 32274, z = 10},
	[10252] = {x = 32842, y = 32275, z = 10},
	[10253] = {x = 32842, y = 32276, z = 10}
}

function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	local toPos = config[item.actionid]
	if not toPos then
		return true
	end

	doTeleportThing(cid, toPos)
	doSendMagicEffect(toPos, CONST_ME_FIREATTACK)

	return true
end