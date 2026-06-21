local walls = {
    {x = 33210, y = 31630, z = 13},
    {x = 33211, y = 31630, z = 13},
    {x = 33212, y = 31630, z = 13}
}

local switches = {
    [10065] = {x = 33190, y = 31629, z = 13},  -- verifica o switch da esquerda
    [10066] = {x = 33191, y = 31629, z = 13} -- verifica o switch da direita
}

local function removeWalls()
    for _, pos in ipairs(walls) do
        local wall = getTileItemById(pos, 1050)
        if wall.uid > 0 then
            doRemoveItem(wall.uid)
        end
    end
end

local function createWalls()
    for _, pos in ipairs(walls) do
        local wall = getTileItemById(pos, 1050)

        if wall.uid > 0 then
            doRemoveItem(wall.uid)
        end

        doCreateItem(1050, 1, pos)
    end
end

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local otherPos = switches[item.actionid]

    if otherPos then
        local otherPlayer = getTopCreature(otherPos).uid

        if otherPlayer > 0 and isPlayer(otherPlayer) then
            removeWalls()
        end
    end

    doTransformItem(item.uid, item.itemid - 1)

    return true
end

function onStepOut(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local firstWall = getTileItemById(walls[1], 1050)

    if firstWall.uid <= 0 then
        doRelocate(walls[1], {x = 33210, y = 31631, z = 13})
        doRelocate(walls[2], {x = 33211, y = 31631, z = 13})
        doRelocate(walls[3], {x = 33212, y = 31631, z = 13})

        createWalls()
    end

    doTransformItem(item.uid, item.itemid + 1)

    return true
end