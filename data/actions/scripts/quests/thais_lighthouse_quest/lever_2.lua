function onUse(cid, item, fromPosition, itemEx, toPosition)

    if item.itemid == 1945 then
        doCreateTeleport(1387, {x = 32225, y = 32275, z = 10}, {x = 32233, y = 32276, z = 9})
        doTransformItem(item.uid, 1946)

    elseif item.itemid == 1946 then
        local tp = getThingfromPos({x = 32233, y = 32276, z = 9})

        if tp.uid > 0 and tp.itemid == 1387 then
            doRemoveItem(tp.uid)
        end

        doTransformItem(item.uid, 1945)
    end

    return true
end