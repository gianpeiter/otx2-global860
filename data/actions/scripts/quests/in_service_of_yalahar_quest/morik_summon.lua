function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 100042) == -1 then
		local monster = doCreateMonster("Morik the Gladiator", getThingPos(cid), true)

		if monster then
			doSendMagicEffect(getThingPos(monster), CONST_ME_TELEPORT)
			setPlayerStorageValue(cid, 100042, 1)
		end
	end

	return true
end