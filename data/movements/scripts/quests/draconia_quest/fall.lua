function onStepIn(cid, item, position, fromPosition)

    if not isPlayer(cid) then
        return true
    end

    local pos = getCreaturePosition(cid)
    pos.z = pos.z + 1

    doTeleportThing(cid, pos)

    return true
end