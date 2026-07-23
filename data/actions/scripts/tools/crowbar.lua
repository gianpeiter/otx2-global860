function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.itemid ~= 2416 then
        return false
    end

    -- In Service of Yalahar Quest

    local pos = getPlayerPosition(cid)

    local effectpos = {
        {x = pos.x + 1, y = pos.y - 1, z = pos.z},
        {x = pos.x - 1, y = pos.y - 1, z = pos.z},
        {x = pos.x + 1, y = pos.y, z = pos.z},
        {x = pos.x - 1, y = pos.y, z = pos.z},
        {x = pos.x, y = pos.y - 1, z = pos.z}
    }

    local effectpos2 = {
        {x = pos.x, y = pos.y - 1, z = pos.z},
        {x = pos.x, y = pos.y - 2, z = pos.z},
        {x = pos.x, y = pos.y - 3, z = pos.z},
        {x = pos.x, y = pos.y + 1, z = pos.z}
    }

    local quest  = 100011
    local quest1 = 100033
    local quest2 = 100034
    local quest3 = 100035
    local quest4 = 100036

    local function checkMission()
        if getPlayerStorageValue(cid, quest1) == 1 and
           getPlayerStorageValue(cid, quest2) == 1 and
           getPlayerStorageValue(cid, quest3) == 1 and
           getPlayerStorageValue(cid, quest4) == 1 then
            setPlayerStorageValue(cid, 100086, 2)
        end
    end

    if itemEx.actionid == 1701 then
        if getPlayerStorageValue(cid, quest) == 2 and getPlayerStorageValue(cid, quest1) < 1 then
            doSetMonsterOutfit(cid, "skeleton", 3000)
            doSendMagicEffect(pos, CONST_ME_ENERGYHIT)

            setPlayerStorageValue(cid, quest1, 1)

            for i = 1, #effectpos do
                doSendMagicEffect(effectpos[i], CONST_ME_YELLOWENERGY)
            end

            checkMission()
        end

        return true
    end

    if itemEx.actionid == 1702 then
        if getPlayerStorageValue(cid, quest) == 2 and getPlayerStorageValue(cid, quest2) < 1 then
            doCreateMonster("Cave Rat", pos, true)
            doCreateMonster("Rat", pos, true)
            doCreateMonster("Rat", pos, true)

            setPlayerStorageValue(cid, quest2, 1)

            for i = 1, #effectpos2 do
                doSendMagicEffect(effectpos2[i], CONST_ME_TELEPORT)
            end

            checkMission()
        end

        return true
    end

    if itemEx.actionid == 1703 then
        if getPlayerStorageValue(cid, quest) == 2 and getPlayerStorageValue(cid, quest3) < 1 then
            doPlayerSay(cid, "You have used the crowbar on a grate.", TALKTYPE_MONSTER)
            doSendMagicEffect(toPosition, CONST_ME_EXPLOSIONAREA)

            setPlayerStorageValue(cid, quest3, 1)

            checkMission()
        end

        return true
    end

    if itemEx.actionid == 1704 then
        if getPlayerStorageValue(cid, quest) == 2 and getPlayerStorageValue(cid, quest4) < 1 then
            doSetMonsterOutfit(cid, "bog raider", 5000)
            doPlayerSay(cid, "You have used the crowbar on a knot.", TALKTYPE_MONSTER)
            doSendMagicEffect(toPosition, CONST_ME_HITAREA)

            setPlayerStorageValue(cid, quest4, 1)

            checkMission()
        end

        return true
    end

    return false
end