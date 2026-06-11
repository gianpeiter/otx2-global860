local config = {
    requireVocations = false,

    players = {
        {
            playerPos = {x = 32677, y = 32089, z = 8},
            destPos = {x = 32672, y = 32070, z = 8},
            sacrificePos = {x = 32679, y = 32089, z = 8}, -- (East)
            sacrificeId = 2175, -- Spellbook
            vocation = 1
        },
        {
            playerPos = {x = 32669, y = 32089, z = 8},
            destPos = {x = 32672, y = 32069, z = 8},
            sacrificePos = {x = 32667, y = 32089, z = 8}, -- (West)
            sacrificeId = 2674, -- Red Apple
            vocation = 2
        },
        {
            playerPos = {x = 32673, y = 32085, z = 8},
            destPos = {x = 32671, y = 32070, z = 8},
            sacrificePos = {x = 32673, y = 32083, z = 8}, -- (North)
            sacrificeId = 2455, -- Crossbow
            vocation = 3
        },
        {
            playerPos = {x = 32673, y = 32093, z = 8},
            destPos = {x = 32671, y = 32069, z = 8},
            sacrificePos = {x = 32673, y = 32094, z = 8}, -- (South)
            sacrificeId = 2376, -- Sword
            vocation = 4
        }
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.itemid == 1946 then
        doTransformItem(item.uid, 1945)
        return true
    end

    for _, v in ipairs(config.players) do
        local player = getTopCreature(v.playerPos)

        if not player.uid or not isPlayer(player.uid) then
            doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
            return true
        end

        if config.requireVocations and getPlayerVocation(player.uid) ~= v.vocation then
            doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
            return true
        end

        if getTileItemById(v.sacrificePos, v.sacrificeId).uid == 0 then
            doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
            return true
        end
    end

    doTransformItem(item.uid, 1946)

    for _, v in ipairs(config.players) do
        local sacrifice = getTileItemById(v.sacrificePos, v.sacrificeId)

        if sacrifice.uid > 0 then
            doRemoveItem(sacrifice.uid, 1)
        end

        doSendMagicEffect(v.sacrificePos, CONST_ME_MAGIC_RED)
        doRelocate(v.playerPos, v.destPos)
        doSendMagicEffect(v.destPos, CONST_ME_TELEPORT)
    end

    return true
end