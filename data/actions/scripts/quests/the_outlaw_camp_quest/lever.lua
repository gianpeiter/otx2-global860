local config = {
    [1945] = {
        fromPos = {x = 32623, y = 32188, z = 9},
        toPos = {x = 32623, y = 32189, z = 9}
    },
    [1946] = {
        fromPos = {x = 32623, y = 32189, z = 9},
        toPos = {x = 32623, y = 32188, z = 9}
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

    local useItem = config[item.itemid]
    if not useItem then
        return true
    end

    local oven = nil

    for _, ovenId in ipairs({1786, 1787}) do
        local tmp = getTileItemById(useItem.fromPos, ovenId)
        if tmp.uid > 0 then
            oven = tmp
            break
        end
    end

    if oven then
        local ovenId = oven.itemid

        doRemoveItem(oven.uid)
        doCreateItem(ovenId, 1, useItem.toPos)
    end

    if item.itemid == 1945 then
        doTransformItem(item.uid, 1946)
    else
        doTransformItem(item.uid, 1945)
    end

    return true
end