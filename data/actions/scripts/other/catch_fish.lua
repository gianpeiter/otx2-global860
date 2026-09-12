function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid ~= 5554 then
		return false
	end

	if math.random(10) ~= 1 then
		doCreatureSay(cid, "The golden fish escaped.", TALKTYPE_MONSTER_SAY)
		return true
	end

	doCreatureSay(cid, "You catch a golden fish in the bowl.", TALKTYPE_MONSTER_SAY)
	doTransformItem(item.uid, 5929)
	doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)

	return true
end