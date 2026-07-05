local bridgePosition = {x = 32851, y = 32309, z = 11}
local relocatePosition = {x = 32852, y = 32310, z = 11}

local dirtIds = {4808, 4810}

function onStepIn(cid, item, position, fromPosition)
    local lava = getTileItemById(bridgePosition, 598)
    if lava.uid > 0 then
        doRemoveItem(lava.uid)
        doCreateItem(1284, 1, bridgePosition)
    end

    for _, id in ipairs(dirtIds) do
        local dirt = getTileItemById(bridgePosition, id)
        if dirt.uid > 0 then
            doRemoveItem(dirt.uid)
        end
    end

    return true
end

function onStepOut(cid, item, position, fromPosition)
    doRelocate(bridgePosition, relocatePosition)

    local bridge = getTileItemById(bridgePosition, 1284)
    if bridge.uid > 0 then
        doRemoveItem(bridge.uid)
    end

    doCreateItem(598, 1, bridgePosition)

    for _, id in ipairs(dirtIds) do
        doCreateItem(id, 1, bridgePosition)
    end

    return true
end