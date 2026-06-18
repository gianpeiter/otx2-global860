local config = {
    [3991] = {position = {x = 32780, y = 32231, z = 8}, itemId = 387}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local stalagmites = config[item.actionid]
    if not stalagmites then
        return true
    end

    local stalagmitesItem = getTileItemById(stalagmites.position, stalagmites.itemId)

    if stalagmitesItem.uid > 0 then
        doRemoveItem(stalagmitesItem.uid)
        doTransformItem(item.uid, item.itemid + 1)
    else
        doCreateItem(stalagmites.itemId, 1, stalagmites.position)
        doTransformItem(item.uid, item.itemid - 1)
    end

    return true
end