local config = {
	-- Battle Axe Quest
    [3000] = {
        items = {
            {itemId = 2378, count = 1}
        },
        storage = 5673
    },
	-- Crusader Helmet
    [3001] = {
        items = {
            {itemId = 2497, count = 1}
        },
        storage = 5316
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
        local backpackId = (#items > 8) and 1988 or 1987

        local container = doCreateItemEx(backpackId, 1)

        for _, rewardData in ipairs(items) do
            local tmp = doCreateItemEx(rewardData.itemId, rewardData.count or 1)

            if rewardData.actionId then
                doItemSetAttribute(tmp, "aid", rewardData.actionId)
            end

            if rewardData.text then
                doItemSetAttribute(tmp, "text", rewardData.text)
            end

            doAddContainerItemEx(container, tmp)

            if rewardData.decay then
                doDecayItem(tmp)
            end
        end

        if doPlayerAddItemEx(cid, container, true) ~= RETURNVALUE_NOERROR then
            doPlayerSendCancel(cid, "You do not have enough capacity or space.")
            return true
        end

        local bpInfo = getItemInfo(backpackId)

        result = bpInfo.article .. " " .. bpInfo.name
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