function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    doSendMagicEffect(position, CONST_ME_TELEPORT)

    local sacrificePos = {x = 32816, y = 31601, z = 9}
    local sacrificeItem = getTileItemById(sacrificePos, 2319)

    if sacrificeItem.uid == 0 then
        local destination = {x = 32818, y = 31599, z = 9}

        doTeleportThing(cid, destination)
        doSendMagicEffect(destination, CONST_ME_TELEPORT)

        return true
    end

    doRemoveItem(sacrificeItem.uid, 1)

    if getPlayerStorageValue(cid, 100500) == 1 then
        doPlayerSetStorageValue(cid, 100500, 0)
    end

    local destination = {x = 32701, y = 31639, z = 6}

    doTeleportThing(cid, destination)
    doSendMagicEffect(destination, CONST_ME_TELEPORT)

    return true
end