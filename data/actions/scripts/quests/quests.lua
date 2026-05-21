local config = {
    -- Battle Axe Quest
    [7777] = {
        items = {
            {itemId = 2378, count = 1} -- Battle Axe
        },
        storage = 5673
    },

    -- Crusader Helmet Quest
    [54116] = {
        items = {
            {itemId = 2497, count = 1} -- Crusader Helmet
        },
        storage = 5316
    },

	-- Circle Room Quest
    [14914] = {
        items = {
            {itemId = 2391, count = 1} -- War Hammer
        },
        storage = 14914
    },
    [14915] = {
        items = {
            {itemId = 2435, count = 1} -- Dwarven Axe
        },
        storage = 14915
    },

	-- Demona Quest
    [13903] = {
        items = {
            {itemId = 2435, count = 1} -- Dwarven Axe
        },
        storage = 13903
    },
    [13902] = {
        items = {
            {itemId = 2425, count = 1} -- Obsidian Lance
        },
        storage = 13902
    },
    [13901] = {
        items = {
            {itemId = 2533, count = 1} -- Griffin Shield
        },
        storage = 13901
    },
    [14361] = {
        items = {
            {itemId = 2184, count = 1} -- Crystal Wand
        },
        storage = 14361
    },
    [14362] = {
        items = {
            {itemId = 1953, count = 1, text = "Dear Gelunidas,\nI request that you send me the twinkiller-rune I ordered some months ago immediately. If I am convinced that they work as promised I will order them in greater numbers. They might be handy in my next schemes. As this letter should show you, the tales of my death are wildly exagerated. I hope you and your warlock brethren did not think you get off the hook that easy? If you don't work on the stuff I ordered and I do not receive the stuff I ordered in time, be prepared for a visit. You won't like my new friends that I would introduce to you.\n\nFerumbras"}, -- Twinkiller Rune
            {itemId = 12565, count = 1} -- Silver Rune Emblem
        },
        storage = 14362
    },
    [14363] = {
        items = {
            {itemId = 2165, count = 1} -- Stealth Ring
        },
        storage = 14363
    },
    [14364] = {
        items = {
            {itemId = 2167, count = 1} -- Energy Ring
        },
        storage = 14364
    },
    [61235] = {
        items = {
            {itemId = 1956, count = 1} -- Map (Brown)
        },
        storage = 61235
    },
    [61233] = {
        items = {
            {itemId = 1982, count = 1} -- Purple Tome
        },
        storage = 61233
    },
    [52372] = {
        items = {
            {itemId = 1957, count = 1} -- Map (Colour)
        },
        storage = 52372
    },

    -- Fanfare Quest
    [52373] = {
        items = {
            {itemId = 2092, count = 1, actionId = 3520} -- Bone Key 3520
        },
        storage = 52373
    },
    [8441] = {
        items = {
            {itemId = 2076, count = 1} -- Fanfare
        },
        storage = 8441
    },

    -- Heaven Blossom Quest
    [8442] = {
        items = {
            {itemId = 5921, count = 1} -- Heaven Blossom
        },
        storage = 8442
    },

    -- Iron Helmet Quest
    [45123] = {
        containerId = 1988,
        items = {
            {itemId = 2598, count = 1}, -- Stamped Letter
            {itemId = 2397, count = 1}, -- Longsword
            {itemId = 2459, count = 1}, -- Iron Helmet
            {itemId = 2467, count = 1}, -- Leather Armor
            {itemId = 2268, count = 3}, -- Sudden Death Rune
            {itemId = 2238, count = 1} -- Worn Leather Boots
        },
        storage = 45123
    },

    -- Iron Ore Quest
    [45124] = {
        items = {
            {itemId = 5880, count = 1} -- Iron Ore
        },
        storage = 45124
    },

    -- Longsword Quest
    [21996] = {
        items = {
            {itemId = 2397, count = 1} -- Longsword
        },
        storage = 21996
    },
    [21997] = {
        items = {
            {itemId = 2121, count = 1} -- Wedding ring
        },
        storage = 21997
    },
    [21998] = {
        items = {
            {itemId = 2148, count = 76}, -- Gold Coin
            {itemId = 2108, count = 1}, -- Wooden Doll
            {itemId = 2260, count = 1}, -- Blank Rune
            {itemId = 2260, count = 1}, -- Blank Rune
            {itemId = 2260, count = 1} -- Blank Rune
        },
        storage = 21998
    },
}

local function getRewardText(itemId, count)
    local item = getItemInfo(itemId)

    count = count or 1

    if count > 1 then
        return count .. " " .. item.plural
    end

    if item.article ~= "" then
        return item.article .. " " .. item.name
    end

    return item.name
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local useItem = config[item.uid]

    if not useItem then
        return true
    end

    local storage = getPlayerStorageValue(cid, useItem.storage)

	if useItem.time then
		if storage > os.time() then
			doPlayerSendCancel(cid, "The " .. getItemNameById(item.itemid) .. " is empty.")
			return true
		end
	else
		if storage ~= (useItem.formerValue or -1) then
			doPlayerSendCancel(cid, "The " .. getItemNameById(item.itemid) .. " is empty.")
			return true
		end
	end

    if useItem.needItem then
        if getPlayerItemCount(cid, useItem.needItem.itemId) < (useItem.needItem.count or 1) then
            doPlayerSendCancel(cid, "You do not have the required item.")
            return true
        end
    end

    local items = useItem.items
    local result = ""

    if #items == 1 then
        local reward = doCreateItemEx(items[1].itemId, items[1].count or 1)

        if items[1].actionId then
            doItemSetAttribute(reward, "aid", items[1].actionId)
        end

        if items[1].text then
            doItemSetAttribute(reward, "text", items[1].text)
        end

        if doPlayerAddItemEx(cid, reward, true) ~= RETURNVALUE_NOERROR then
            doPlayerSendCancel(cid, "You do not have enough capacity or space.")
            return true
        end

        if items[1].decay then
            doDecayItem(reward)
        end

        result = getRewardText(items[1].itemId, items[1].count)
    else
        local size = #items
        local containerId = useItem.containerId or ((size > 8) and 1988 or 1987)

        local reward = doCreateItemEx(containerId, 1)

        for i = 1, size do
            local tmp = doCreateItemEx(items[i].itemId, items[i].count or 1)

            if items[i].actionId then
                doItemSetAttribute(tmp, "aid", items[i].actionId)
            end

            if items[i].text then
                doItemSetAttribute(tmp, "text", items[i].text)
            end

            doAddContainerItemEx(reward, tmp)

            if items[i].decay then
                doDecayItem(tmp)
            end
        end

        if doPlayerAddItemEx(cid, reward, true) ~= RETURNVALUE_NOERROR then
            doPlayerSendCancel(cid, "You do not have enough capacity or space.")
            return true
        end

        result = getItemNameById(containerId)
    end

    if useItem.say then
        doCreatureSay(cid, useItem.say, TALKTYPE_ORANGE_1)
    end

    if useItem.needItem then
        doPlayerRemoveItem(cid, useItem.needItem.itemId, useItem.needItem.count or 1)
    end

    if useItem.effect then
        doSendMagicEffect(toPosition, useItem.effect)
    end

    if useItem.missionStorage then
        setPlayerStorageValue(cid, useItem.missionStorage.key, useItem.missionStorage.value)
    end

    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found " .. result .. ".")

    if useItem.time then
        setPlayerStorageValue(cid, useItem.storage, os.time() + 86400)
    else
        setPlayerStorageValue(cid, useItem.storage, useItem.newValue or 1)
    end

    return true
end