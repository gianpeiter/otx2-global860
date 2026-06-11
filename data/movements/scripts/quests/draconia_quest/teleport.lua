local config = {
    {position = {x = 32802, y = 31584, z = 1}, itemId = 1945},
    {position = {x = 32803, y = 31584, z = 1}, itemId = 1946},
    {position = {x = 32804, y = 31584, z = 1}, itemId = 1945},
    {position = {x = 32805, y = 31584, z = 1}, itemId = 1946}
}

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local correct = true
    local destination = {x = 32701, y = 31639, z = 6}

    for _, v in ipairs(config) do
        if getTileItemById(v.position, v.itemId).uid == 0 then
            correct = false
            break
        end
    end

    doSendMagicEffect(position, CONST_ME_TELEPORT)

    if not correct then
        destination = {x = 32803, y = 31587, z = 1}
    end

    doTeleportThing(cid, destination)
    doSendMagicEffect(destination, CONST_ME_TELEPORT)

    return true
end