local staminaItems = {
    [12667] = {
        maxStamina = 42 * 60,
        infinite = false,
        message = "You used a stamina refill and your stamina has been restored.",
        cancelMessage = "Your stamina is already at the maximum allowed by this item."
    },

    [12668] = {
        maxStamina = 40 * 60,
        infinite = false,
        message = "You used a small stamina refill and your stamina has been restored.",
        cancelMessage = "Your stamina is already at the maximum allowed by this item."
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

    if not cfg.infinite then
        doRemoveItem(item.uid, 1)
    end

    doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
    return true
end