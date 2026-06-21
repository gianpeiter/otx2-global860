function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) and getPlayerStorageValue(cid, 32999) == 1 and getPlayerStorageValue(cid, 32996) == -1 then
		setPlayerStorageValue(cid, 32996, 1)
		setPlayerStorageValue(cid, 100090, 2)

		doRelocate(position, {x = 32268, y = 31856, z = 15})
		doSendMagicEffect({x = 32268, y = 31856, z = 15}, 14)
	else
		doRelocate(position, {x = 32191, y = 31938, z = 14})
		doSendMagicEffect({x = 32191, y = 31938, z = 14}, CONST_ME_DRAWBLOOD)

		if isPlayer(cid) then
			doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -55, -55, CONST_ME_NONE)
		end
	end

	return true
end