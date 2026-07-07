local staminaItems = {
    [15261] = {
        maxStamina = 42 * 60,
        message = "Your stamina has been fully restored.",
        cancelMessage = "Your stamina is already full."
    },

    [15262] = {
        maxStamina = 40 * 60,
        message = "Your stamina has been restored to 40 hours.",
        cancelMessage = "Your stamina is already at 40 hours."
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local cfg = staminaItems[item.itemid]
    if not cfg then
        return false
    end

    local currentStamina = getPlayerStamina(cid)

    if currentStamina >= cfg.maxStamina then
        doPlayerSendCancel(cid, cfg.cancelMessage)
        return true
    end

    doPlayerSetStamina(cid, cfg.maxStamina)
    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, cfg.message)

	doRemoveItem(item.uid, 1)

    doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
    return true
end