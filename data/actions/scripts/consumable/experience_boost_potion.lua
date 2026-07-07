local config = {
    [15259] = {
        boost = 120, -- 120 (+20%)
        duration = 7 * 24 * 60 * 60 -- 7 days
    },
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local potion = config[item.itemid]
    if not potion then
        return true
    end

    local now = os.time()
    local expires = getPlayerStorageValue(cid, Storage.ExperienceBoost.Time)

    if expires > now then
        doPlayerSendCancel(cid, "You already have an active experience boost.")
        return true
    end

    setPlayerStorageValue(cid, Storage.ExperienceBoost.Boost, potion.boost)
    setPlayerStorageValue(cid, Storage.ExperienceBoost.Time, now + potion.duration)

    local rate = getPlayerRates(cid)[8]
    doPlayerSetExperienceRate(cid, rate + ((potion.boost - 100) / 100))

    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Experience Boost] Your experience boost has been activated.")

    doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
    doRemoveItem(item.uid, 1)

    addEvent(function(playerId, boost)
        if not isPlayer(playerId) then
            return
        end

        local expires = getPlayerStorageValue(playerId, Storage.ExperienceBoost.Time)

        if expires > os.time() then
            return
        end

        local rate = getPlayerRates(playerId)[8]
        doPlayerSetExperienceRate(playerId, rate - ((boost - 100) / 100))

        setPlayerStorageValue(playerId, Storage.ExperienceBoost.Boost, -1)
        setPlayerStorageValue(playerId, Storage.ExperienceBoost.Time, -1)

        doPlayerSendTextMessage(playerId, MESSAGE_STATUS_CONSOLE_RED, "[Experience Boost] Your experience boost has expired.")
    end, potion.duration * 1000, cid, potion.boost)

    return true
end