local config = {
    [5511] = {position = {x = 33171, y = 31897, z = 8}, itemId = 1285}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local stone = config[item.actionid]
    if not stone then
        return true
    end

    local stoneItem = getTileItemById(stone.position, stone.itemId)

    if stoneItem.uid > 0 then
        doRemoveItem(stoneItem.uid)
        doTransformItem(item.uid, item.itemid + 1)
    else
        doCreateItem(stone.itemId, 1, stone.position)
        doTransformItem(item.uid, item.itemid - 1)
    end

    return true
end