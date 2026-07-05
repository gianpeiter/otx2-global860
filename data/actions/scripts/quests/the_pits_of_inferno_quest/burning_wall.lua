local config = {
    [30001] = {pos = {x = 32831, y = 32333, z = 11}},
    [30004] = {pos = {x = 32833, y = 32333, z = 11}},
    [30003] = {pos = {x = 32835, y = 32333, z = 11}},
    [30002] = {pos = {x = 32837, y = 32333, z = 11}}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local cfg = config[item.actionid]
    if not cfg then
        return false
    end

    if item.itemid == 1945 then
        local wall = getTileItemById(cfg.pos, 6289)
        if wall.uid > 0 then
            doRemoveItem(wall.uid)
        end
    else
        doCreateItem(6289, 1, cfg.pos)
    end

    doSendMagicEffect(cfg.pos, CONST_ME_FIREAREA)
    doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)

    return true
end