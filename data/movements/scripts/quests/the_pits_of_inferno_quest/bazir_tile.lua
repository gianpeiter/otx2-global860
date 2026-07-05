local config = {
    [16772] = {x = 32754, y = 32365, z = 15},
    [16773] = {x = 32725, y = 32381, z = 15},
    [16774] = {x = 32827, y = 32241, z = 12},
    [50082] = {x = 32745, y = 32394, z = 14},
    [50083] = {x = 32745, y = 32392, z = 14}
}

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local destination = config[item.actionid]
    if not destination then
        return true
    end

    doTeleportThing(cid, destination)
    doSendMagicEffect(destination, CONST_ME_TELEPORT)
    return true
end