local config = {
    [13228] = {
        pos = {x = 32861, y = 32305, z = 11},
    },
    [13229] = {
        pos = {x = 32860, y = 32313, z = 11},
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.actionid == 13228 then
        if item.itemid == 1945 then
            doTransformItem(item.uid, 1946)

            local lava = getTileItemById(config[13228].pos, 598)
            if lava.uid > 0 then
                doRemoveItem(lava.uid)
                doCreateItem(1284, 1, config[13228].pos)
            end

            local dirtIds = {4808, 4810}
            for _, id in ipairs(dirtIds) do
                local dirt = getTileItemById(config[13228].pos, id)
                if dirt.uid > 0 then
                    doRemoveItem(dirt.uid)
                end
            end

        elseif item.itemid == 1946 then
            doTransformItem(item.uid, 1945)

            local ground = getTileItemById(config[13228].pos, 1284)
            if ground.uid > 0 then
                doRemoveItem(ground.uid)
            end

            local lava = getTileItemById(config[13228].pos, 598)
            if lava.uid > 0 then
                doRemoveItem(lava.uid)
            end

            doCreateItem(598, 1, config[13228].pos)
            doCreateItem(4808, 1, config[13228].pos)
            doCreateItem(4810, 1, config[13228].pos)
        end

    elseif item.actionid == 13229 then
        if item.itemid == 1945 then
            doTransformItem(item.uid, 1946)

            local stone = getTileItemById(config[13229].pos, 386)
            if stone.uid > 0 then
                doRemoveItem(stone.uid)
            end

        elseif item.itemid == 1946 then
            doTransformItem(item.uid, 1945)

            local stone = getTileItemById(config[13229].pos, 386)
            if stone.uid == 0 then
                doCreateItem(386, 1, config[13229].pos)
            end
        end
    end

    return true
end