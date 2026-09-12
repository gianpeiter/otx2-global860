function onSay(cid, words, param)
    if exhaustion.check(cid, 666) then
        doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
        return true
    end
	
    local info = getCreatureConditionInfo(cid, CONDITION_INFIGHT, 0, CONDITIONID_DEFAULT)

    if info and info.ticks > 0 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, string.format("You are protection zone locked for %s.", timeString(math.ceil(info.ticks / 1000))))
		exhaustion.set(cid, 666, 10)
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You are not protection zone locked.")
		exhaustion.set(cid, 666, 10)
    end

    return true
end