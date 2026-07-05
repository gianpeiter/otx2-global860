local text = {
    [1] = "first", [2] = "second", [3] = "third", [4] = "fourth", [5] = "fifth",
    [6] = "sixth", [7] = "seventh", [8] = "eighth", [9] = "ninth", [10] = "tenth",
    [11] = "eleventh", [12] = "twelfth", [13] = "thirteenth", [14] = "fourteenth", [15] = "fifteenth"
}

local stonePositions = {
    {x = 32851, y = 32333, z = 12},
    {x = 32852, y = 32333, z = 12}
}

local function createStones()
    for i = 1, #stonePositions do
        local pos = stonePositions[i]
        local stone = getTileItemById(pos, 1304)
        if stone.uid == 0 then
            doCreateItem(1304, 1, pos)
        end
    end

    setGlobalStorageValue(30100, 0)
end

local function revertLever(pos)
    local lever = getTileItemById(pos, 1946)
    if lever.uid > 0 then
        doTransformItem(lever.uid, 1945)
    end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.itemid ~= 1945 then
        return false
    end

    local leverCount = getGlobalStorageValue(30100)
    if leverCount < 0 then
        leverCount = 0
    end

    if item.actionid >= 30101 and item.actionid <= 30115 then
        local number = item.actionid - 30100

        if leverCount + 1 ~= number then
            return false
        end

        setGlobalStorageValue(30100, number)

        doCreatureSay(cid,
            "You flipped the " .. text[number] .. " lever. Hurry up and find the next one!",
            TALKTYPE_MONSTER
        )

    elseif item.actionid == 30116 then
        if leverCount ~= 15 then
            doCreatureSay(cid, "The final lever won't budge... yet.", TALKTYPE_MONSTER)
            return true
        end

        for i = 1, #stonePositions do
            local pos = stonePositions[i]
            local stone = getTileItemById(pos, 1304)

            if stone.uid > 0 then
                doRemoveItem(stone.uid)
                doSendMagicEffect(pos, CONST_ME_EXPLOSIONAREA)
            end
        end

        addEvent(createStones, 15 * 60 * 1000)
    end

    doTransformItem(item.uid, 1946)
    addEvent(revertLever, 15 * 60 * 1000, toPosition)

    return true
end