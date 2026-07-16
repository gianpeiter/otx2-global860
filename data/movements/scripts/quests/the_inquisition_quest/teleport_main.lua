local teleports = {

    -- Boss Teleports
    [1001] = {
        progress = 1,
        newPos = {x = 33069, y = 31783, z = 13},
        text = "Entering The Crystal Caves",
        questLog = {100079, 4}
    },

    [1002] = {
        progress = 2,
        newPos = {x = 33371, y = 31613, z = 14},
        text = "Entering The Blood Halls",
        questLog = {100078, 23}
    },

    [1003] = {
        progress = 3,
        newPos = {x = 33153, y = 31781, z = 12},
        text = "Entering The Vats",
        questLog = {100078, 26}
    },

    [1004] = {
        progress = 4,
        newPos = {x = 33038, y = 31753, z = 15},
        text = "Entering The Arcanum",
        questLog = {100078, 29}
    },

    [1005] = {
        progress = 5,
        newPos = {x = 33199, y = 31686, z = 12},
        text = "Entering The Hive",
        questLog = {100078, 33}
    },

    [1006] = {
        progress = 6,
        newPos = {x = 33111, y = 31682, z = 12},
        text = "Entering The Shadow Nexus",
        questLog = {100080, 2}
    },

    -- Main Room
    [2001] = {
        progress = 1,
        checkProgress = true,
        newPos = {x = 33069, y = 31783, z = 13},
        text = "Entering The Crystal Caves"
    },

    [2002] = {
        progress = 2,
        checkProgress = true,
        newPos = {x = 33371, y = 31613, z = 14},
        text = "Entering The Blood Halls"
    },

    [2003] = {
        progress = 3,
        checkProgress = true,
        newPos = {x = 33153, y = 31781, z = 12},
        text = "Entering The Vats"
    },

    [2004] = {
        progress = 4,
        checkProgress = true,
        newPos = {x = 33038, y = 31753, z = 15},
        text = "Entering The Arcanum"
    },

    [2005] = {
        progress = 5,
        checkProgress = true,
        newPos = {x = 33199, y = 31686, z = 12},
        text = "Entering The Hive"
    },

    -- Retreat
    [3000] = {
        newPos = {x = 33163, y = 31708, z = 14},
        text = "Escaping back to the Retreat!"
    },

    -- Common Portals
    [3001] = {
        newPos = {x = 33158, y = 31728, z = 11},
        text = "Entering The Ward of Ushuriel",
        questLog = {100079, 2}
    },

    [3002] = {
        newPos = {x = 33169, y = 31755, z = 13},
        text = "Entering The Undersea Kingdom"
    },

    [3003] = {
        newPos = {x = 33124, y = 31692, z = 11},
        text = "Entering The Ward of Zugurosh",
        questLog = {100079, 5}
    },

    [3004] = {
        newPos = {x = 33356, y = 31590, z = 11},
        text = "Entering The Foundry"
    },

    [3005] = {
        newPos = {x = 33197, y = 31767, z = 11},
        text = "Entering The Ward of Madareth",
        questLog = {100078, 24}
    },

    [3006] = {
        newPos = {x = 33250, y = 31632, z = 13},
        text = "Entering The Battlefield"
    },

    [3007] = {
        newPos = {x = 33232, y = 31733, z = 11},
        text = "Entering The Ward of The Demon Twins",
        questLog = {100078, 27}
    },

    [3008] = {
        newPos = {x = 33094, y = 31575, z = 11},
        text = "Entering The Soul Wells",
        questLog = {100078, 30}
    },

    [3009] = {
        newPos = {x = 33197, y = 31703, z = 11},
        text = "Entering The Ward of Annihilon",
        questLog = {100078, 31}
    },

    [3010] = {
        newPos = {x = 33105, y = 31734, z = 11},
        text = "Entering The Ward of Hellgorak",
        questLog = {100078, 34}
    }
}

local function updateQuestLog(cid, teleport)
	if not teleport.questLog then
		return
	end

	local storage = teleport.questLog[1]
	local value = teleport.questLog[2]

	if getPlayerStorageValue(cid, storage) < value then
		setPlayerStorageValue(cid, storage, value)
	end
end

local function teleportPlayer(cid, teleport)
	doTeleportThing(cid, teleport.newPos)
	doSendMagicEffect(teleport.newPos, CONST_ME_TELEPORT)
	doCreatureSay(cid, teleport.text, TALKTYPE_MONSTER, false, cid)
end

local function sendBack(cid, fromPosition, message)
	doTeleportThing(cid, fromPosition)
	doSendMagicEffect(fromPosition, CONST_ME_TELEPORT)
	doCreatureSay(cid, message, TALKTYPE_MONSTER, false, cid)
end

local function sendRetreat(cid)
	local retreat = {x = 33163, y = 31708, z = 14}

	doTeleportThing(cid, retreat)
	doSendMagicEffect(retreat, CONST_ME_TELEPORT)
	doCreatureSay(cid, "Escaping back to the Retreat!", TALKTYPE_MONSTER, false, cid)
end

function onStepIn(cid, item, position, fromPosition)

    if not isPlayer(cid) then
        return true
    end

    local teleport = teleports[item.actionid]
    if not teleport then
        return true
    end

    updateQuestLog(cid, teleport)

    if teleport.progress then
        if teleport.checkProgress then
            if getPlayerStorageValue(cid, 100081) < teleport.progress then
                sendBack(cid, fromPosition, "You don't have enough energy to enter this portal.")
                return true
            end
        else

            if getPlayerStorageValue(cid, 100081) < teleport.progress then
                setPlayerStorageValue(cid, 100081, teleport.progress)
            end
        end
    end

    teleportPlayer(cid, teleport)

    return true
end