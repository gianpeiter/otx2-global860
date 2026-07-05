local destinations = {
    [10201] = {x = 32791, y = 32327, z = 10},
    [10202] = {x = 32791, y = 32331, z = 10}
}

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local destination = destinations[item.actionid]
    if not destination then
        return true
    end

    if getPlayerItemCount(cid, 1970) < 1 then
        doTeleportThing(cid, fromPosition, true)
        doSendMagicEffect(fromPosition, CONST_ME_TELEPORT)
        return true
    end

    doTeleportThing(cid, destination, true)
    doSendMagicEffect(destination, CONST_ME_TELEPORT)

    return true
end