function onUse(cid, item, fromPosition, itemEx, toPosition)
    local hasAllBless = true

    for i = 1, 5 do
        if(not getPlayerBlessing(cid, i)) then
            hasAllBless = false
            break
        end
    end

    if(hasAllBless) then
        doPlayerSendCancel(cid, "You already have all blessings.")
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
        return true
    end

    for i = 1, 5 do
        if(not getPlayerBlessing(cid, i)) then
            doPlayerAddBlessing(cid, i)
        end
    end

    doRemoveItem(item.uid, 1)
    doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received all blessings.")
    return true
end