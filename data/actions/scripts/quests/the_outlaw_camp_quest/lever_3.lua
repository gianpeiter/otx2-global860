function onUse(cid, item, fromPosition, itemEx, toPosition)

    if item.itemid ~= 1945 then
        return true
    end

    local power1Pos = {x = 32613, y = 32220, z = 10}
    local barrelPos = {x = 32614, y = 32209, z = 10}
    local wallPos = {x = 32614, y = 32205, z = 10}
    local stonePos = {x = 32614, y = 32206, z = 10}
    local burnPos = {x = 32615, y = 32221, z = 10}

    local power1Item = getTileItemById(power1Pos, 2166)
    local barrelItem = getTileItemById(barrelPos, 1774)
    local wallItem = getTileItemById(wallPos, 1025)
    local stoneItem = getTileItemById(stonePos, 1304)

    if power1Item.uid > 0
    and wallItem.uid > 0
    and stoneItem.uid > 0
    and barrelItem.uid > 0 then

        doRemoveItem(power1Item.uid)
        doCreateItem(1487, 1, power1Pos)

        doSendMagicEffect(power1Pos, CONST_ME_POISONAREA)

        doRemoveItem(wallItem.uid)
        doTransformItem(stoneItem.uid, 1025)

        doCreateItem(1487, 1, burnPos)

        doTransformItem(item.uid, 1946)
    end

    return true
end