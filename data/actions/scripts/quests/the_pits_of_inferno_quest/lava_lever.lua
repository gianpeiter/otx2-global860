local config = {
    lava = {
        {x = 32911, y = 32209, z = 15},
        {x = 32912, y = 32209, z = 15},
        {x = 32911, y = 32210, z = 15},
        {x = 32912, y = 32210, z = 15}
    },

    levers = {
        [56330] = {x = 32915, y = 32215, z = 15},
        [56331] = {x = 32908, y = 32207, z = 15}
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    -- Alterna os pisos
    for i = 1, #config.lava do
        local pos = {
            x = config.lava[i].x,
            y = config.lava[i].y,
            z = config.lava[i].z,
            stackpos = 0
        }

        local ground = getThingfromPos(pos)

        if ground.uid > 0 then
            if ground.itemid == 598 then
                doRemoveItem(ground.uid, 1)
                doCreateItem(407, 1, pos)
                doSendMagicEffect(pos, CONST_ME_SMOKE)
            elseif ground.itemid == 407 then
                doRemoveItem(ground.uid, 1)
                doCreateItem(598, 1, pos)
                doSendMagicEffect(pos, CONST_ME_SMOKE)
            end
        end
    end

    -- Descobre o novo estado das levers
    local newId = (item.itemid == 1945) and 1946 or 1945

    -- Atualiza TODAS as levers
    for _, pos in pairs(config.levers) do
        local lever = getThingfromPos({
            x = pos.x,
            y = pos.y,
            z = pos.z,
            stackpos = 1
        })

        if lever.uid > 0 then
            doTransformItem(lever.uid, newId)
        end
    end

    return true
end