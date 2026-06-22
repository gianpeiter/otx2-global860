-- Online Stamina Regeneration System
-- onlineStaminaStart = Minutes required online in a protection zone before regeneration starts
-- onlineStaminaGain = Minutes required to regenerate 1 stamina below staminaRatingLimitTop
-- onlineStaminaThresholdGain = Minutes required to regenerate 1 stamina from staminaRatingLimitTop to full stamina

local onlineStaminaStart = 5
local onlineStaminaGain = 2
local onlineStaminaThresholdGain = 4
local staminaRatingLimitTop = 40 * 60
local maxStamina = 42 * 60

function onThink(interval)
	for _, cid in ipairs(getPlayersOnline()) do
		local stamina = getPlayerStamina(cid)
		if stamina < maxStamina and getTilePzInfo(getThingPos(cid)) then
			local time = getPlayerStorageValue(cid, 57940)
			if time < 0 then
				time = 0
			end
			time = time + 1
			if time > onlineStaminaStart then
				local regenTime
				if stamina < staminaRatingLimitTop then
					regenTime = onlineStaminaGain
				else
					regenTime = onlineStaminaThresholdGain
				end
				if (time - onlineStaminaStart) >= regenTime then
					doPlayerAddStamina(cid, 1)
					time = onlineStaminaStart
				end
			end
			setPlayerStorageValue(cid, 57940, time)
		else
			setPlayerStorageValue(cid, 57940, 0)
		end
	end

	return true
end