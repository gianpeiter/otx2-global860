local setting = {
    [10001] = {
        storage = 10001,
        text = "You have touched Infernatil's throne and absorbed some of his spirit.",
        effect = CONST_ME_FIREAREA,
        toPosition = {x = 32909, y = 32211, z = 15}
    },
    [10002] = {
        storage = 10002,
        text = "You have touched Tafariel's throne and absorbed some of his spirit.",
        effect = CONST_ME_MORTAREA,
        toPosition = {x = 32761, y = 32243, z = 15}
    },
    [10003] = {
        storage = 10003,
        text = "You have touched Verminor's throne and absorbed some of his spirit.",
        effect = CONST_ME_POISONAREA,
        toPosition = {x = 32840, y = 32327, z = 15}
    },
    [10004] = {
        storage = 10004,
        text = "You have touched Apocalypse's throne and absorbed some of his spirit.",
        effect = CONST_ME_EXPLOSIONAREA,
        toPosition = {x = 32875, y = 32267, z = 15}
    },
    [10005] = {
        storage = 10005,
        text = "You have touched Bazir's throne and absorbed some of his spirit.",
        effect = CONST_ME_MAGIC_GREEN,
        toPosition = {x = 32745, y = 32385, z = 15}
    },
    [10006] = {
        storage = 10006,
        text = "You have touched Ashfalor's throne and absorbed some of his spirit.",
        effect = CONST_ME_FIREAREA,
        toPosition = {x = 32839, y = 32310, z = 15}
    },
    [10007] = {
        storage = 10007,
        text = "You have touched Pumin's throne and absorbed some of his spirit.",
        effect = CONST_ME_MORTAREA,
        toPosition = {x = 32785, y = 32279, z = 15}
    }
}

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local throne = setting[item.actionid]
    if not throne then
        return true
    end

    if getPlayerStorageValue(cid, throne.storage) ~= 1 then
        setPlayerStorageValue(cid, throne.storage, 1)
        doSendMagicEffect(position, throne.effect)
        doCreatureSay(cid, throne.text, TALKTYPE_MONSTER, false, cid, position)
    else
        doTeleportThing(cid, throne.toPosition)
        doSendMagicEffect(throne.toPosition, CONST_ME_MORTAREA)
        doCreatureSay(cid, "Begone!", TALKTYPE_MONSTER, false, cid, throne.toPosition)
    end

    return true
end