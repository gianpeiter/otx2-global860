local ovens = {
	1786, 1787, 1788, 1789, 1790,
	1791, 1792, 1793, 9911, 9912
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if not itemEx or itemEx.uid <= 0 then
		return true
	end

	if isInArray(ovens, itemEx.itemid) then
		if doPlayerRemoveItem(cid, 9733, 1) then
			setPlayerStorageValue(cid, 100032, 1)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
		end
	end

	return true
end