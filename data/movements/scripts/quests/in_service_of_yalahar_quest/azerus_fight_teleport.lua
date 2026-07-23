function onStepIn(cid, item, position, fromPosition)
	-- Entrada da Last Fight
	if item.actionid == 9105 then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		doTeleportThing(cid, {x = 32784, y = 31174, z = 10})
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		doCreatureSay(cid, "The apparatus in the centre looks odd! You should inspect it.", TALKTYPE_MONSTER)

	-- Saída da Last Fight
	elseif item.actionid == 9106 then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		doTeleportThing(cid, {x = 32783, y = 31178, z = 9})
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end

	return true
end