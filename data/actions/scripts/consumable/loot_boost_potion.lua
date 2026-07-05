local config = {
	[2661] = {
		name = "Loot Boost Potion",
		boost = 130, -- 130 (+30%)
		duration = 7 * 24 * 60 * 60 -- 7 days
	},
}

local lootBoost = 30000
local lootTime = 30001

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local potion = config[item.itemid]
	if not potion then
		return true
	end
	local now = os.time()
	local expires = getPlayerStorageValue(cid, lootTime)

	setPlayerStorageValue(cid, lootBoost, potion.boost)

	if expires < now then
		setPlayerStorageValue(cid, lootTime, now + potion.duration)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Loot Boost] " .. potion.name .. " activated. +" .. (potion.boost - 100) .. "% loot for " .. timeString(potion.duration) .. ".")
	else
		local newExpire = expires + potion.duration
		setPlayerStorageValue(cid, lootTime, newExpire)
		local totalTimeLeft = newExpire - now
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Loot Boost] " .. potion.name .. " extended. Total time left: " .. timeString(totalTimeLeft) .. ".")
	end

	doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
	doRemoveItem(item.uid, 1)
	return true
end