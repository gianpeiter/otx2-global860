local config = {
    [20507] = {position = {x = 33151, y = 32866, z = 8}, itemId = 1100}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local wall = config[item.actionid]
    if not wall then
        return true
    end

    local wallItem = getTileItemById(wall.position, wall.itemId)

    if wallItem.uid > 0 then
        doRemoveItem(wallItem.uid)
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
    else
        doCreateItem(wall.itemId, 1, wall.position)
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
    end

    return true
end