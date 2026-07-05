local doors = {
    [26100] = 51721,
    [27100] = 51722,
    [28100] = 51723
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.itemid ~= 5132 then
        return false
    end

    local storage = doors[item.actionid]
    if not storage then
        return false
    end

    if getPlayerStorageValue(cid, storage) == 1 then
        doTeleportThing(cid, toPosition, true)
        doTransformItem(item.uid, item.itemid + 1)
    else
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
    end

    return true
end