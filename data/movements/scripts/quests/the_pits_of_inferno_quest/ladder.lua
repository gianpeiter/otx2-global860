local ladderPos = {x = 32854, y = 32321, z = 11}

function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	local ladder = getTileItemById(ladderPos, 5543)
	if ladder.uid == 0 then
		doCreateItem(5543, 1, ladderPos)
		doCreatureSay(cid, "You hear a rumbling from far away.", TALKTYPE_MONSTER_SAY)
	end

	doTransformItem(item.uid, item.itemid - 1)

	return true
end

function onStepOut(cid, item, position, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	local ladder = getTileItemById(ladderPos, 5543)
	if ladder.uid > 0 then
		doRemoveItem(ladder.uid)
		doCreatureSay(cid, "You hear a rumbling from far away.", TALKTYPE_MONSTER_SAY)
	end

	doTransformItem(item.uid, item.itemid + 1)

	return true
end