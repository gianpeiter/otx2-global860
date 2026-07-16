local config = {
    teleportId = 1387,
    removeTime = 180, -- seconds
    message = "You now have 3 minutes to exit this room through the teleporter. It will bring you to the next room only during this time or the teleporter will disappear.",

    bosses = {
        ["Ushuriel"] = {
            newPos = {x = 33157, y = 31725, z = 11},
            actionid = 1001,
            quest = {100079, 3}
        },

        ["Zugurosh"] = {
            newPos = {x = 33123, y = 31689, z = 11},
            actionid = 1002,
            quest = {100079, 6}
        },

        ["Madareth"] = {
            newPos = {x = 33194, y = 31768, z = 11},
            actionid = 1003,
            quest = {100078, 25}
        },

        ["Golgordan"] = {
            newPos = {x = 33235, y = 31734, z = 11},
            actionid = 1004,
            quest = {100078, 28},
            brother = "Latrivan"
        },

        ["Latrivan"] = {
            newPos = {x = 33235, y = 31734, z = 11},
            actionid = 1004,
            quest = {100078, 28},
            brother = "Golgordan"
        },

        ["Annihilon"] = {
            newPos = {x = 33200, y = 31704, z = 11},
            actionid = 1005,
            quest = {100078, 32}
        },

        ["Hellgorak"] = {
            newPos = {x = 33107, y = 31735, z = 11},
            actionid = 1006,
            quest = {100078, 35}
        }
    }
}

local function updateQuest(cid, boss)
    if not boss.quest then
        return
    end

    local storage = boss.quest[1]
    local value = boss.quest[2]

    if getPlayerStorageValue(cid, storage) < value then
        setPlayerStorageValue(cid, storage, value)
    end
end

local function removeTeleport(position)
    local pos = {
        x = position.x,
        y = position.y,
        z = position.z,
        stackpos = 1
    }

    local teleport = getThingfromPos(pos)

    if teleport.itemid == config.teleportId then
        doRemoveItem(teleport.uid)
    end
end

local function createTeleport(boss)

    local pos = {
        x = boss.newPos.x,
        y = boss.newPos.y,
        z = boss.newPos.z,
        stackpos = 1
    }

    local tile = getThingfromPos(pos)

    if tile.itemid == config.teleportId then
        return
    end

    local uid = doCreateItem(config.teleportId, 1, boss.newPos)

    if uid > 0 then
        doItemSetAttribute(uid, "aid", boss.actionid)
    end

    addEvent(removeTeleport, config.removeTime * 1000, boss.newPos)
end

function onKill(cid, target, damage, flags)

    if not isMonster(target) then
        return true
    end

    local boss = config.bosses[getCreatureName(target)]

    if not boss then
        return true
    end

    updateQuest(cid, boss)

    -- Demon Twins
    if boss.brother then
        for x = 33224, 33240 do
            for y = 31722, 31734 do
                local creature = getTopCreature({x = x, y = y, z = 11})

                if creature.uid > 0 and creature.type == 2 and getCreatureName(creature.uid) == boss.brother then
                    return true
                end
            end
        end

        createTeleport(boss)
        doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
        return true
    end

    createTeleport(boss)

    doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)

    return true
end