local config = {
    [10058] = {position = {x = 32796, y = 31594, z = 5}, itemId = 1025},
    [10059] = {position = {x = 32796, y = 31576, z = 5}, itemId = 1025}
}

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local wall = config[item.actionid]
    if not wall then
        return true
    end

    local wallItem = getTileItemById(wall.position, wall.itemId)
    if wallItem.uid > 0 then
        doRemoveItem(wallItem.uid)
    end

    doTransformItem(item.uid, item.itemid - 1)
    return true
end

function onStepOut(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local wall = config[item.actionid]
    if not wall then
        return true
    end

    if getTileItemById(wall.position, wall.itemId).uid == 0 then
        doCreateItem(wall.itemId, 1, wall.position)
    end

    doTransformItem(item.uid, item.itemid + 1)
    return true
end