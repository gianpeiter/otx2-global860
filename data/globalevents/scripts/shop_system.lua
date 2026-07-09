local femaleOutfits = {
    ["citizen"] = {136},
    ["hunter"] = {137},
    ["mage"] = {138},
    ["knight"] = {139},
    ["noblewoman"] = {140},
    ["summoner"] = {141},
    ["warrior"] = {142},
    ["barbarian"] = {147},
    ["druid"] = {148},
    ["wizard"] = {149},
    ["oriental"] = {150},
    ["pirate"] = {155},
    ["assassin"] = {156},
    ["beggar"] = {157},
    ["shaman"] = {158},
    ["norsewoman"] = {252},
    ["nightmare"] = {269},
    ["jester"] = {270},
    ["brotherhood"] = {279},
    ["demonhunter"] = {288},
    ["yalaharian"] = {324},
    ["warmaster"] = {336},
    ["wayfarer"] = {366}
}

local maleOutfits = {
    ["citizen"] = {128},
    ["hunter"] = {129},
    ["mage"] = {130},
    ["knight"] = {131},
    ["nobleman"] = {132},
    ["summoner"] = {133},
    ["warrior"] = {134},
    ["barbarian"] = {143},
    ["druid"] = {144},
    ["wizard"] = {145},
    ["oriental"] = {146},
    ["pirate"] = {151},
    ["assassin"] = {152},
    ["beggar"] = {153},
    ["shaman"] = {154},
    ["norseman"] = {251},
    ["nightmare"] = {268},
    ["jester"] = {273},
    ["brotherhood"] = {278},
    ["demonhunter"] = {289},
    ["yalaharian"] = {325},
    ["warmaster"] = {335},
    ["wayfarer"] = {367}
}

function onThink(interval, lastExecution)

    local players = getPlayersOnline()

    if #players == 0 then
        return true
    end

    local names = {}

    for _, cid in ipairs(players) do
        table.insert(names, db.escapeString(getCreatureName(cid)))
    end

	local result = db.getResult(
		"SELECT * FROM `z_ots_comunication` WHERE `name` IN (" ..
		table.concat(names, ",") ..
		") LIMIT 100;"
	)

	if result:getID() == -1 then
		return true
	end

    while true do

		local communicationId = result:getDataInt("id")
		local historyId = result:getDataInt("history_id")
        local action = result:getDataString("action")
        local playerName = result:getDataString("name")

        local cid = getPlayerByName(playerName)

        if isPlayer(cid) then

            local addItemName = result:getDataString("param6")
            local points = result:getDataInt("param7")

            if action == "give_item" then

                local itemId = result:getDataInt("param1")
                local itemCount = result:getDataInt("param2")

                if canPlayerReceiveItem(cid, itemId, itemCount) then

                    if doPlayerGiveItem(cid, itemId, itemCount) then
					
						doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)

                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You received { ".. addItemName .." } from WebShop.")

						db.query("DELETE FROM `z_ots_comunication` WHERE `id` = " .. communicationId .. ";")
						db.query("UPDATE `z_shop_history_item` SET `trans_state` = 'realized', `trans_real` = " .. os.time() .. " WHERE `id` = " .. historyId .. ";")

                    end

                else

                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "{ ".. addItemName .." } from WebShop is waiting for you.")

                end
            end

			if action == "give_container" then

				local containerId = result:getDataInt("param1")
				local itemId = result:getDataInt("param2")
				local itemCount = result:getDataInt("param3")
				local containerCount = result:getDataInt("param4")

				if canPlayerReceiveContainer(cid, containerCount) and doPlayerGiveShopContainer(cid, containerId, itemId, itemCount, containerCount) then

					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)

					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You received { ".. addItemName .." } container from WebShop.")

					db.query("DELETE FROM `z_ots_comunication` WHERE `id` = " .. communicationId .. ";")
					db.query("UPDATE `z_shop_history_item` SET `trans_state` = 'realized', `trans_real` = " .. os.time() .. " WHERE `id` = " .. historyId .. ";")

				else

					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "{ ".. addItemName .." } container from WebShop is waiting for you.")

				end
			end

            if action == "give_outfit" then

                local outfitName =
                    string.lower(result:getDataString("param3"))

                if outfitName ~= ""
                and maleOutfits[outfitName]
                and femaleOutfits[outfitName] then

                    local outfit =
                        getPlayerSex(cid) == 0
                        and femaleOutfits[outfitName][1]
                        or maleOutfits[outfitName][1]

                    if not canPlayerWearOutfit(cid, outfit, 3) then

                        doPlayerAddOutfit(cid, outfit, 3)

                        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)

                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You received the outfit { ".. addItemName .." } from WebShop.")

						db.query("DELETE FROM `z_ots_comunication` WHERE `id` = " .. communicationId .. ";")
						db.query("UPDATE `z_shop_history_item` SET `trans_state` = 'realized', `trans_real` = " .. os.time() .. " WHERE `id` = " .. historyId .. ";")

                    else

                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You already have this outfit. Your points were returned.")

                        doPlayerAddPremiumPoints(cid, points)

						db.query("DELETE FROM `z_ots_comunication` WHERE `id` = " .. communicationId .. ";")
						db.query("UPDATE `z_shop_history_item` SET `trans_state` = 'returned', `trans_real` = " .. os.time() .. " WHERE `id` = " .. historyId .. ";")

                    end
                end
            end
        end

        if not result:next() then
            break
        end
    end

    result:free()

    return true
end