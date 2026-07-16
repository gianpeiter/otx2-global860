local throneStorages = {
    10001, -- Infernatil
    10002, -- Tafariel
    10003, -- Verminor
    10004, -- Apocalypse
    10005, -- Bazir
    10006, -- Ashfalor
    10007  -- Pumin
}

local function hasTouchedOneThrone(cid)
    for i = 1, #throneStorages do
        if getPlayerStorageValue(cid, throneStorages[i]) == 1 then
            return true
        end
    end
    return false
end

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    if hasTouchedOneThrone(cid) and getPlayerLevel(cid) >= 100 and getPlayerStorageValue(cid, 90000) >= 16 then

        local destination = {x = 33168, y = 31683, z = 15}

        doTeleportThing(cid, destination)
        doSendMagicEffect(position, CONST_ME_TELEPORT)
        doSendMagicEffect(destination, CONST_ME_TELEPORT)
        return true
    end

    doTeleportThing(cid, fromPosition)
    doSendMagicEffect(position, CONST_ME_TELEPORT)
    doSendMagicEffect(fromPosition, CONST_ME_TELEPORT)
    return true
end