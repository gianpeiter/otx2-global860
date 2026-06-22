local criticalLimit = 100
local criticalStorage = 48901

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local criticalLevel = getPlayerStorageValue(cid, criticalStorage)
    if criticalLevel < 0 then
        criticalLevel = 0
    end

    local criticalCost = (criticalLevel + 1) * 50000
    local playerPos = getCreaturePosition(cid)

    if criticalLevel >= criticalLimit then
        doPlayerSendCancel(cid, "You have already reached the maximum critical level.")
        return true
    end

    if getPlayerMoney(cid) < criticalCost then
        doPlayerSendCancel(cid, "You need " .. doNumberFormat(criticalCost) .. " gold coins to advance your critical level.")
        return true
    end

    if not doRemoveItem(item.uid, 1) then
        doPlayerSendCancel(cid, "Sorry, not possible.")
        return true
    end

    doPlayerRemoveMoney(cid, criticalCost)
    doPlayerSetStorageValue(cid, criticalStorage, criticalLevel + 1)

    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You advanced from critical level " .. criticalLevel .. " to " .. (criticalLevel + 1) .. ".")

    doSendAnimatedText(playerPos, "+Critical", COLOR_WHITE)
    doSendMagicEffect(playerPos, CONST_ME_MAGIC_GREEN)

    return true
end