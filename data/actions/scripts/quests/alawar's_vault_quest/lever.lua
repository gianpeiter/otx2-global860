local config = {
    itemId = 1498,
    positions = {
        {x = 32186, y = 31626, z = 8},
        {x = 32187, y = 31626, z = 8},
        {x = 32188, y = 31626, z = 8},
        {x = 32189, y = 31626, z = 8}
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.itemid == 1945 then
        for _, pos in ipairs(config.positions) do
            local wall = getTileItemById(pos, config.itemId)

            if wall.uid > 0 then
                doRemoveItem(wall.uid)
            end
        end

        doSendMagicEffect({x = 32180, y = 31633, z = 8}, CONST_ME_POFF)
        doRemoveItem(item.uid)
    end

    return true
end