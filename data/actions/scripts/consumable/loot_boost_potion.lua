local config = {
    [15260] = {
        boost = 130, -- 130 (+30%)
        duration = 7 * 24 * 60 * 60 -- 7 days
    },
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local potion = config[item.itemid]
    if not potion then
        return true
    end

    local now = os.time()
    local expires = getPlayerStorageValue(cid, Storage.LootBoost.Time)

	if expires < now then
		setPlayerStorageValue(cid, Storage.LootBoost.Boost, potion.boost)
		setPlayerStorageValue(cid, Storage.LootBoost.Time, now + potion.duration)

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Loot Boost] Your loot boost has been activated.")
	else
		local newExpire = expires + potion.duration
		setPlayerStorageValue(cid, Storage.LootBoost.Time, newExpire)

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Loot Boost] Your loot boost has been extended.")
	end

    doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
    doRemoveItem(item.uid, 1)
    return true
end