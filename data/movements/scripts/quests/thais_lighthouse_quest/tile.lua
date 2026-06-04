function onStepIn(cid, item, position, fromPosition)

    if isPlayer(cid) and item.actionid == 10055 then

        local ground = getThingfromPos({x = 32225, y = 32282, z = 9})

        if ground.uid > 0 then
            doTransformItem(ground.uid, 4836)
        end

        if item.itemid == 426 then
            doTransformItem(item.uid, 425)
        end
    end

    return true
end

function onStepOut(cid, item, position, fromPosition)

    if isPlayer(cid) and item.actionid == 10055 then

        local ground = getThingfromPos({x = 32225, y = 32282, z = 9})

        if ground.uid > 0 then
            doTransformItem(ground.uid, 424)
        end

        if item.itemid == 425 then
            doTransformItem(item.uid, 426)
        end
    end

    return true
end