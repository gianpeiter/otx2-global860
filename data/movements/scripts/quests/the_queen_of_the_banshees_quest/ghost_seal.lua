function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	if getPlayerStorageValue(cid, 32998) == -1 then
		doCreateMonster("ghost", {x = 32275, y = 31901, z = 13})
		doCreateMonster("ghost", {x = 32276, y = 31905, z = 13})

		setPlayerStorageValue(cid, 32998, 1)
		setPlayerStorageValue(cid, 100088, 2)

		doRelocate(position, {x = 32266, y = 31849, z = 15})
		doSendMagicEffect({x = 32266, y = 31849, z = 15}, 14)

		doCreateMonster("demon skeleton", {x = 32275, y = 31903, z = 13})
	else
		doRelocate(position, {x = 32277, y = 31903, z = 13})
		doSendMagicEffect({x = 32277, y = 31903, z = 13}, 1)

		doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -55, -55, CONST_ME_NONE)
	end

	return true
end