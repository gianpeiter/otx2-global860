local doors = {
    [20509] = 32998,
    [20510] = 32997,
    [20511] = 32996,
    [20512] = 32995,
    [20513] = 32994,
    [20514] = 32993,
    [20515] = 32992,
    [20516] = 32991
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.itemid ~= 5105 and item.itemid ~= 5114 then
        return false
    end

    if item.actionid == 20516 then
        if getPlayerStorageValue(cid, 32991) < 1 then
            doTeleportThing(cid, toPosition, true)
            doTransformItem(item.uid, item.itemid + 1)
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
        end
        return true
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