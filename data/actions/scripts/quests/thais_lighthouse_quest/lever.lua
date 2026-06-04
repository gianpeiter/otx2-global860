function onUse(cid, item, fromPosition, itemEx, toPosition)

    local pos = {x = 32225, y = 32276, z = 8}

    if item.itemid == 1945 then

        local tileItem = getTileItemById(pos, 9021)
        if tileItem.uid > 0 then
            doTransformItem(tileItem.uid, 8279)
        end

        doTransformItem(item.uid, 1946)

    elseif item.itemid == 1946 then

        local tileItem = getTileItemById(pos, 8279)
        if tileItem.uid > 0 then
            doTransformItem(tileItem.uid, 9021)
        end

        doTransformItem(item.uid, 1945)

    end

    return true
end