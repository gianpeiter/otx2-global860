function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getTilePzInfo(getCreaturePosition(cid)) ~= true) then
		doPlayerSendCancel(cid, "You can only use this item while in a Protection Zone.")
		return true
	end

	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	doSendMagicEffect(getTownTemplePosition(getPlayerTown(cid)), CONST_ME_TELEPORT)

	doRemoveItem(item.uid, 1)
	return true
end