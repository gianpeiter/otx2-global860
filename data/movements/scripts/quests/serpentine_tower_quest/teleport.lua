local config = {
    [5630] = {
        teleportPosition = {x = 33145, y = 32863, z = 7},
        effect = CONST_ME_MAGIC_GREEN,
        potPosition = {x = 33151, y = 32864, z = 7}
    },

    [5631] = {
        teleportPosition = {x = 33147, y = 32864, z = 7},
        effect = CONST_ME_MAGIC_GREEN
    }
}

local potPosition = {x = 33145, y = 32862, z = 7}

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local teleportConfig = config[item.actionid]
    if not teleportConfig then
        return true
    end

    if teleportConfig.potPosition then
        local potItem = getTileItemById(potPosition, 2562)

        if potItem and potItem.uid > 0 then
            doTeleportThing(cid, teleportConfig.potPosition)
            doSendMagicEffect(teleportConfig.potPosition, teleportConfig.effect)
            return true
        end
    end

    doTeleportThing(cid, teleportConfig.teleportPosition)
    doSendMagicEffect(teleportConfig.teleportPosition, teleportConfig.effect)

    return true
end