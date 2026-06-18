local demonPositions = {
	{x = 33060, y = 31623, z = 15},
	{x = 33066, y = 31623, z = 15},
	{x = 33060, y = 31627, z = 15},
	{x = 33066, y = 31627, z = 15}
}

local function recreateParchment(pos)
	local tile = getTileItemById(pos, 1953)

	if tile and tile.uid > 0 then
		doSetItemActionId(tile.uid, 60999)
	else
		local uid = doCreateItem(1953, 1, pos)

		if uid > 0 then
			doSetItemText(uid, "Buried forever that he never shall return. Don\'t remove this seal or bad things may happen.")
			doSetItemActionId(uid, 60999)
		end
	end
end

function onRemoveItem(item, tileitem, position)

	doSetItemActionId(item.uid, 0)

	addEvent(recreateParchment, 2 * 60 * 60 * 1000, position)

    for i = 1, #demonPositions do
        local demon = doCreateMonster("Demon", demonPositions[i])

        if demon then
            doSendMagicEffect(getCreaturePosition(demon), CONST_ME_TELEPORT)
        end
    end

	return true
end