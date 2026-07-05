local config = {
    [8933] = {
        teleportPos = {x = 32800, y = 32336, z = 11}, -- Para onde os players serão teleportados
        bridgePos = {x = 32801, y = 32336, z = 11, stackpos = 0}, -- Posição da ponte
        leverPos = {x = 32800, y = 32339, z = 11, stackpos = 1} -- Posição do óleo
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local t = config[item.actionid]
    if not t then
        return false
    end

    local water = getTileItemById(t.bridgePos, 493).uid
    local bridge = getTileItemById(t.bridgePos, 5770).uid

    if water > 0 then
        local oil = getThingFromPos(t.leverPos)

        if oil.uid > 0 and oil.itemid == 2016 and oil.type == 11 then
            doRemoveItem(water)
            doCreateItem(5770, 1, t.bridgePos)

            doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
        else
            doCreatureSay(cid, "The lever is creeking and rusty.", TALKTYPE_MONSTER)
        end

    elseif bridge > 0 then
        doCreateItem(493, 1, t.bridgePos)

        local thing = getThingFromPos(t.bridgePos)
        if thing.uid > 0 then
            doRelocate(t.bridgePos, t.teleportPos)
        end

        doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
    end

    return true
end