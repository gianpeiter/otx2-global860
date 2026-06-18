function onUse(cid, item, fromPosition, itemEx, toPosition)
    if exhaustion.check(cid, 667) then
        doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
        return true
    end

    exhaustion.set(cid, 667, 1)

    doPlayerAddPremiumPoints(cid, 1)
    doRemoveItem(item.uid, 1)
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "1 premium point has been added to your account.")

    return true
end