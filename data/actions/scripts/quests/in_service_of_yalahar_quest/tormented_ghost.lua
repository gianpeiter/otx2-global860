local config = {
    [9738] = 9739,
    [9739] = 9740,
    [9740] = 9773,
    [9773] = 9742
}

local charmPos = {x = 32776, y = 31062, z = 7}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local transformId = config[itemEx.itemid]
    if not transformId then
        return true
    end

    for i = 1, 2 do
        local ghost = doCreateMonster("Tormented Ghost", getThingPos(cid), true)
        if ghost then
            doSendMagicEffect(getThingPos(ghost), CONST_ME_TELEPORT)
        end
    end

    doSendMagicEffect(toPosition, CONST_ME_ENERGYHIT)
    doRemoveItem(item.uid, 1)

    local charm = getTileItemById(charmPos, itemEx.itemid)
    if charm.uid > 0 then
        doTransformItem(charm.uid, transformId)
    end

    doCreatureSay(cid, "The ghost charm is charging.", TALKTYPE_MONSTER)

    return true
end