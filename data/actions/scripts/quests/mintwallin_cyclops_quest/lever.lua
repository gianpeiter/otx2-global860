local removePositions = {
    fromPos = 32593,
    toPos = 32601
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

    if item.itemid == 1945 then
        doPlayerSendCancel(cid, "You cannot use this object.")
        return true
    end

    doCreateItem(1025, 1, {x = 32592, y = 32104, z = 14})
    doCreateItem(1025, 1, {x = 32592, y = 32105, z = 14})
    doCreateItem(1025, 1, {x = 32592, y = 32106, z = 14})

    for i = removePositions.fromPos, removePositions.toPos do
        local pos = {x = i, y = 32103, z = 14}
        local itemToRemove = getTileItemById(pos, 1026)

        if itemToRemove.uid > 0 then
            doRemoveItem(itemToRemove.uid)
        end
    end

    doTransformItem(item.uid, 1945)

    return true
end