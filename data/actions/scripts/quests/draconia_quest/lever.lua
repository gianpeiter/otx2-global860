local config = {
    [20502] = {position = {x = 32792, y = 31581, z = 7}, itemId = 1037},
    [20503] = {position = {x = 32790, y = 31594, z = 7}, itemId = 1285}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local wall = config[item.actionid]
    if not wall then
        return true
    end

    local wallItem = getTileItemById(wall.position, wall.itemId)

    if wallItem.uid > 0 then
        doRemoveItem(wallItem.uid)
        doTransformItem(item.uid, item.itemid + 1)
    else
        doCreateItem(wall.itemId, 1, wall.position)
        doTransformItem(item.uid, item.itemid - 1)
    end

    return true
end