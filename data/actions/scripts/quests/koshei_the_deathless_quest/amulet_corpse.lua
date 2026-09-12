function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid ~= 8272 then
		return false
	end

	if getPlayerStorageValue(cid, 36205) == -1 then
		doPlayerRemoveItem(cid, 8266, 1)
		doRemoveItem(itemEx.uid)

		setPlayerStorageValue(cid, 36205, 1)

		doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)

		doCreatureSay(
			cid,
			"At last.. I have it back, my precious amulet. I am glad you didn't use it! I allow you to ...ahh... enter door ...ahh",
			TALKTYPE_MONSTER_SAY,
			false,
			0,
			toPosition
		)
	end

	return true
end