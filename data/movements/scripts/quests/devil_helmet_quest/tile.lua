local sewerPosition = {x = 32482, y = 32170, z = 14}

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    if item.itemid == 426 then
        doTransformItem(item.uid, 425)
        doSendMagicEffect(position, CONST_ME_MAGIC_GREEN)

        local sewerItem = getTileItemById(sewerPosition, 430)

        if sewerItem.uid == 0 then
            doCreateItem(430, 1, sewerPosition)
            doSendMagicEffect(sewerPosition, CONST_ME_MAGIC_GREEN)
        end
    end

    return true
end

function onStepOut(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    if item.itemid == 425 then
        doTransformItem(item.uid, 426)
        doSendMagicEffect(fromPosition, CONST_ME_MAGIC_RED)

        local sewerItem = getTileItemById(sewerPosition, 430)

        if sewerItem.uid > 0 then
            doRemoveItem(sewerItem.uid, 1)
            doSendMagicEffect(sewerPosition, CONST_ME_MAGIC_RED)
        end
    end

    return true
end