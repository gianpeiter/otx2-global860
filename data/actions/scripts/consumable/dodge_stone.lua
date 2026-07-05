local dodgeLimit = 100
local dodgeStorage = 48900

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local dodgeLevel = getPlayerStorageValue(cid, dodgeStorage)
    if dodgeLevel < 0 then
        dodgeLevel = 0
    end

    local dodgeCost = (dodgeLevel + 1) * 50000

    if dodgeLevel >= dodgeLimit then
        doPlayerSendCancel(cid, "You have already reached the maximum Dodge level.")
        return true
    end

    if getPlayerMoney(cid) < dodgeCost then
        doPlayerSendCancel(cid, "You need " .. doNumberFormat(dodgeCost) .. " gold coins to advance your Dodge level.")
        return true
    end

    if not doRemoveItem(item.uid, 1) then
        doPlayerSendCancel(cid, "Sorry, not possible.")
        return true
    end

    doPlayerRemoveMoney(cid, dodgeCost)
    doPlayerSetStorageValue(cid, dodgeStorage, dodgeLevel + 1)

    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You advanced from Dodge level " .. dodgeLevel .. " to " .. (dodgeLevel + 1) .. ".")

    doSendAnimatedText(getCreaturePosition(cid), "+Dodge", COLOR_WHITE)
    doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)

    return true
end