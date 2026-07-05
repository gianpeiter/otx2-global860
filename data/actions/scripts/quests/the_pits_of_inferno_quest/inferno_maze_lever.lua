local config = {
    portalPos = {x = 32816, y = 32345, z = 13},
    destination = {x = 32767, y = 32366, z = 15},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.actionid ~= 50105 then
        return true
    end

    local portal = getTileItemById(config.portalPos, 1387)

    if portal.uid == 0 then
        local wall = getTileItemById(config.portalPos, 385)
        if wall.uid > 0 then
            doRemoveItem(wall.uid)
        end

        doCreateItem(8586, 1, config.portalPos)
        doCreateTeleport(1387, config.destination, config.portalPos)
        doSendMagicEffect(config.portalPos, CONST_ME_TELEPORT)
        doSendMagicEffect({x = 32818, y = 32345, z = 13}, CONST_ME_TELEPORT)
    else
        doRemoveItem(portal.uid)

        local ground = getTileItemById(config.portalPos, 8586)
        if ground.uid > 0 then
            doRemoveItem(ground.uid)
        end

        doCreateItem(385, 1, config.portalPos)
        doSendMagicEffect(config.portalPos, CONST_ME_POFF)
    end

    if item.itemid == 1945 then
        doTransformItem(item.uid, 1946)
    else
        doTransformItem(item.uid, 1945)
    end

    return true
end