local config = {
    [14320] = {storage = 10001, value = 1}, -- Infernatil
    [14321] = {storage = 10002, value = 1}, -- Tafariel
    [14322] = {storage = 10003, value = 1}, -- Verminor
    [14323] = {storage = 10004, value = 1}, -- Apocalypse
    [14324] = {storage = 10005, value = 1}, -- Bazir
    [14325] = {storage = 10006, value = 1}, -- Ashfalor
    [14326] = {storage = 10007, value = 1}  -- Pumin
}

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local throne = config[item.actionid]
    if not throne then
        return true
    end

    if getPlayerStorageValue(cid, throne.storage) ~= throne.value then
        doTeleportThing(cid, fromPosition, true)
        doCreatureSay(cid, "You've not absorbed energy from this throne.", TALKTYPE_MONSTER)
    end

    return true
end