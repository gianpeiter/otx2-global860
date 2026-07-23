function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 20527 and getPlayerStorageValue(cid, 100039) == 1 then
		doPlayerRemoveItem(cid, 9737, 1)
		doCreateItem(9738, 1, toPosition)
		doSendMagicEffect(toPosition, CONST_ME_CARNIPHILA)

		for i = 1, 2 do
			local monster = doCreateMonster("Tormented Ghost", getThingPos(cid), true)
			if monster then
				doSendMagicEffect(getThingPos(monster), CONST_ME_TELEPORT)
			end
		end

		doPlayerSetStorageValue(cid, 100040, 1)
		doPlayerSetStorageValue(cid, 100086, 19)
	end

	return true
end