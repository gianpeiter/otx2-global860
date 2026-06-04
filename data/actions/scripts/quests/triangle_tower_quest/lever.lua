function onUse(cid, item, fromPosition, itemEx, toPosition)

    local pos1 = {x = 32566, y = 32119, z = 7}
    local pos2 = {x = 32566, y = 32118, z = 7}

    if item.itemid == 1945 then

        doTransformItem(item.uid, 1946)

        local item1 = getTileItemById(pos1, 1025)
        if item1.uid > 0 then
            doRemoveItem(item1.uid)
        end

        local item2 = getTileItemById(pos2, 1025)
        if item2.uid > 0 then
            doTransformItem(item2.uid, 1029)
        end

    elseif item.itemid == 1946 then

        doTransformItem(item.uid, 1945)

        local item2 = getTileItemById(pos2, 1029)
        if item2.uid > 0 then
            doTransformItem(item2.uid, 1025)
        end

        if getTileItemById(pos1, 1025).uid <= 0 then
            doCreateItem(1025, 1, pos1)
        end

    end

    return true
end