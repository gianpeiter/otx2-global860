local config = {
    [39511] = {
        fromPosition = {x = 32739, y = 32392, z = 14},
        toPosition = {x = 32739, y = 32393, z = 14}
    },
    [39512] = {
        teleportPlayer = true,
        fromPosition = {x = 32739, y = 32393, z = 14},
        toPosition = {x = 32739, y = 32392, z = 14}
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local useItem = config[item.actionid]
    if not useItem then
        return true
    end

    if useItem.teleportPlayer then
        local playerPos = {x = 32712, y = 32392, z = 13}
        doTeleportThing(cid, playerPos)
        doSendMagicEffect(playerPos, CONST_ME_TELEPORT)
        doCreatureSay(cid, "Beauty has to be rewarded! Muahahaha!", TALKTYPE_MONSTER)
    end

    local tapestry = getTileItemById(useItem.fromPosition, 6434)
    if tapestry.uid > 0 then
        doRemoveItem(tapestry.uid)

        local uid = doCreateItem(6434, 1, useItem.toPosition)

        if item.actionid == 39512 then
            doSetItemActionId(uid, 39511)
        end
    end

    return true
end