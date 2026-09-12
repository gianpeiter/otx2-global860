function onSay(cid, words, param)
    if exhaustion.check(cid, 666) then
        doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
        return true
    end

    local level = getPlayerStorageValue(cid, 48900)
    if level < 0 then
        level = 0
    end

    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Dodge System] Current dodge level: " .. level .. "/100.")
	exhaustion.set(cid, 666, 10)

    return true
end