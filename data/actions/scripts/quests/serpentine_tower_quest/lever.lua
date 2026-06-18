local config = {
    [20508] = {
        itemId = 1498,
        positions = {
            {x = 33148, y = 32867, z = 9},
            {x = 33149, y = 32867, z = 9},
            {x = 33148, y = 32868, z = 9},
            {x = 33149, y = 32868, z = 9}
        }
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local wall = config[item.actionid]
    if not wall then
        return true
    end

    local firstItem = getTileItemById(wall.positions[1], wall.itemId)

    if firstItem.uid > 0 then
        for i = 1, #wall.positions do
            local tileItem = getTileItemById(wall.positions[i], wall.itemId)
            if tileItem.uid > 0 then
                doRemoveItem(tileItem.uid)
            end
        end

        doTransformItem(item.uid, item.itemid + 1)
    else
        for i = 1, #wall.positions do
            doCreateItem(wall.itemId, 1, wall.positions[i])
        end

        doTransformItem(item.uid, item.itemid - 1)
    end

    return true
end