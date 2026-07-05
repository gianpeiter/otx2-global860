local config = {
    teleportPos = {x = 32806, y = 32328, z = 15},
    actionIds = {
        [50095] = true,
        [50096] = true,
        [50097] = true,
        [50098] = true,
        [50099] = true,
        [50100] = true,
        [50101] = true,
        [50102] = true,
        [50103] = true,
        [50104] = true
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if not config.actionIds[item.actionid] then
        return true
    end

    if item.itemid == 1945 then
        doTeleportThing(cid, config.teleportPos)
        doSendMagicEffect(config.teleportPos, CONST_ME_TELEPORT)
        doTransformItem(item.uid, 1946)
    end

    return true
end