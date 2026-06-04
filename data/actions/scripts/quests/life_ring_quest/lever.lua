function onUse(cid, item, fromPosition, itemEx, toPosition)

    local leverPositions = {
        {x = 32414, y = 32252, z = 10},
        {x = 32413, y = 32230, z = 10}
    }

    local removeItems = {
        {x = 32410, y = 32231, z = 10},
        {x = 32410, y = 32232, z = 10}
    }

    local restoreItems = {
        {pos = {x = 32410, y = 32231, z = 10}, itemid = 4615},
        {pos = {x = 32411, y = 32231, z = 10}, itemid = 4615},
        {pos = {x = 32410, y = 32232, z = 10}, itemid = 4615},
        {pos = {x = 32411, y = 32232, z = 10}, itemid = 4615}
    }

    local bridgePositions = {
        {x = 32410, y = 32231, z = 10},
        {x = 32411, y = 32231, z = 10},
        {x = 32410, y = 32232, z = 10},
        {x = 32411, y = 32232, z = 10},
    }

    local function transformLevers(oldId, newId)
        for _, pos in ipairs(leverPositions) do
            local lever = getTileItemById(pos, oldId)

            if lever.uid > 0 then
                doTransformItem(lever.uid, newId)
            end
        end
    end

    if item.itemid == 1946 then

        transformLevers(1946, 1945)

        for _, pos in ipairs(removeItems) do
            local tileItem = getTileItemById(pos, 4799)

            if tileItem.uid > 0 then
                doRemoveItem(tileItem.uid)
            end
        end

        for _, pos in ipairs(bridgePositions) do
            local bridge = getTileItemById(pos, 1284)

            if bridge.uid <= 0 then
                doCreateItem(1284, 1, pos)
            end
        end

    elseif item.itemid == 1945 then

        transformLevers(1945, 1946)

        for _, pos in ipairs(bridgePositions) do
            local bridge = getTileItemById(pos, 1284)

            if bridge.uid > 0 then
                doRemoveItem(bridge.uid)
            end
        end

        for _, pos in ipairs(removeItems) do
            if getTileItemById(pos, 4799).uid <= 0 then
                doCreateItem(4799, 1, pos)
            end
        end

        for _, v in ipairs(restoreItems) do
            if getTileItemById(v.pos, v.itemid).uid <= 0 then
                doCreateItem(v.itemid, 1, v.pos)
            end
        end
    end

    return true
end