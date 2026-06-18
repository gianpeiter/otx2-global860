function onUse(cid, item, fromPosition, itemEx, toPosition)

    if item.itemid == 1945 then
        return true
    end

    local wallPos = {x = 32604, y = 32216, z = 9}
    local power2pos = {x = 32613, y = 32220, z = 10}
    local power1pos = {x = 32594, y = 32214, z = 9}

    local wallItem = getTileItemById(wallPos, 1026)
    local power1Item = getTileItemById(power1pos, 2166)

    if power1Item.uid > 0 and wallItem.uid > 0 then
        doTeleportThing(power1Item.uid, power2pos)
        doRemoveItem(wallItem.uid)
        doSendMagicEffect(power1pos, CONST_ME_POISONAREA)
        doTransformItem(item.uid, 1945)
    end

    return true
end