local elementTeleports = {
    [15111] = { -- ice
        destinations = {
            [15111] = {x=32360, y=32242, z=6},
            [15112] = {x=32956, y=32076, z=5},
            [15113] = {x=32643, y=31927, z=11},
            [15114] = {x=32358, y=31780, z=9},
            [15115] = {x=32680, y=31688, z=2},
            [15116] = {x=32335, y=32838, z=8},
            [15117] = {x=32626, y=32744, z=4},
            [15118] = {x=33128, y=32812, z=4},
            [15119] = {x=33229, y=32391, z=5},
            [15120] = {x=33266, y=31837, z=9},
            [15121] = {x=32212, y=31131, z=8},
            [15122] = {x=32784, y=31245, z=5}
        }
    },

    [15112] = { -- earth
        destinations = {
            [15123] = {x=32360, y=32241, z=6},
            [15124] = {x=32958, y=32078, z=5},
            [15125] = {x=32649, y=31927, z=11},
            [15126] = {x=32363, y=31780, z=9},
            [15127] = {x=32679, y=31686, z=2},
            [15128] = {x=32339, y=32841, z=8},
            [15129] = {x=32625, y=32741, z=4},
            [15130] = {x=33131, y=32808, z=4},
            [15131] = {x=33232, y=32391, z=5},
            [15132] = {x=33266, y=31833, z=9},
            [15133] = {x=32215, y=31132, z=8},
            [15134] = {x=32787, y=31245, z=5}
        }
    },

    [15113] = { -- energy
        destinations = {
            [15135] = {x=32377, y=32241, z=6},
            [15136] = {x=32958, y=32074, z=5},
            [15137] = {x=32643, y=31923, z=11},
            [15138] = {x=32363, y=31783, z=9},
            [15139] = {x=32681, y=31684, z=2},
            [15140] = {x=32339, y=32834, z=8},
            [15141] = {x=32631, y=32744, z=4},
            [15142] = {x=33131, y=32822, z=4},
            [15143] = {x=33226, y=32391, z=5},
            [15144] = {x=33270, y=31837, z=9},
            [15145] = {x=32209, y=31131, z=8},
            [15146] = {x=32781, y=31245, z=5}
        }
    },

    [15114] = { -- fire
        destinations = {
            [15147] = {x=32378, y=32242, z=6},
            [15148] = {x=32960, y=32076, z=5},
            [15149] = {x=32649, y=31923, z=11},
            [15150] = {x=32358, y=31783, z=9},
            [15151] = {x=32680, y=31684, z=2},
            [15152] = {x=32342, y=32838, z=8},
            [15153] = {x=32632, y=32742, z=4},
            [15154] = {x=33128, y=32820, z=4},
            [15155] = {x=33235, y=32391, z=5},
            [15156] = {x=33271, y=31833, z=9},
            [15157] = {x=32210, y=31133, z=8},
            [15158] = {x=32790, y=31245, z=5}
        }
    }
}

local cityPortals = {
    -- Thais
    [7801] = {storage = 15111, vocations = {2, 6}, element = "ice"},
    [7802] = {storage = 15123, vocations = {2, 6}, element = "earth"},
    [7803] = {storage = 15147, vocations = {1, 5}, element = "fire"},
    [7804] = {storage = 15135, vocations = {1, 5}, element = "energy"},

    -- Venore
    [7805] = {storage = 15112, vocations = {2, 6}, element = "ice"},
    [7806] = {storage = 15124, vocations = {2, 6}, element = "earth"},
    [7807] = {storage = 15148, vocations = {1, 5}, element = "fire"},
    [7808] = {storage = 15136, vocations = {1, 5}, element = "energy"},

    -- Kazordoon
    [7809] = {storage = 15113, vocations = {2, 6}, element = "ice"},
    [7810] = {storage = 15125, vocations = {2, 6}, element = "earth"},
    [7811] = {storage = 15149, vocations = {1, 5}, element = "fire"},
    [7812] = {storage = 15137, vocations = {1, 5}, element = "energy"},

    -- Carlin
    [7813] = {storage = 15114, vocations = {2, 6}, element = "ice"},
    [7814] = {storage = 15126, vocations = {2, 6}, element = "earth"},
    [7815] = {storage = 15150, vocations = {1, 5}, element = "fire"},
    [7816] = {storage = 15138, vocations = {1, 5}, element = "energy"},

    -- Ab'dendriel
    [7817] = {storage = 15115, vocations = {2, 6}, element = "ice"},
    [7818] = {storage = 15127, vocations = {2, 6}, element = "earth"},
    [7819] = {storage = 15151, vocations = {1, 5}, element = "fire"},
    [7820] = {storage = 15139, vocations = {1, 5}, element = "energy"},

    -- Liberty Bay
    [7821] = {storage = 15116, vocations = {2, 6}, element = "ice"},
    [7822] = {storage = 15128, vocations = {2, 6}, element = "earth"},
    [7823] = {storage = 15152, vocations = {1, 5}, element = "fire"},
    [7824] = {storage = 15140, vocations = {1, 5}, element = "energy"},

    -- Port Hope
    [7825] = {storage = 15117, vocations = {2, 6}, element = "ice"},
    [7826] = {storage = 15129, vocations = {2, 6}, element = "earth"},
    [7827] = {storage = 15153, vocations = {1, 5}, element = "fire"},
    [7828] = {storage = 15141, vocations = {1, 5}, element = "energy"},

    -- Ankrahmun
    [7829] = {storage = 15118, vocations = {2, 6}, element = "ice"},
    [7830] = {storage = 15130, vocations = {2, 6}, element = "earth"},
    [7831] = {storage = 15154, vocations = {1, 5}, element = "fire"},
    [7832] = {storage = 15142, vocations = {1, 5}, element = "energy"},

    -- Darashia
    [7833] = {storage = 15119, vocations = {2, 6}, element = "ice"},
    [7834] = {storage = 15131, vocations = {2, 6}, element = "earth"},
    [7835] = {storage = 15155, vocations = {1, 5}, element = "fire"},
    [7836] = {storage = 15143, vocations = {1, 5}, element = "energy"},

    -- Edron
    [7837] = {storage = 15120, vocations = {2, 6}, element = "ice"},
    [7838] = {storage = 15132, vocations = {2, 6}, element = "earth"},
    [7839] = {storage = 15156, vocations = {1, 5}, element = "fire"},
    [7840] = {storage = 15144, vocations = {1, 5}, element = "energy"},

    -- Svargrond
    [7841] = {storage = 15121, vocations = {2, 6}, element = "ice"},
    [7842] = {storage = 15133, vocations = {2, 6}, element = "earth"},
    [7843] = {storage = 15157, vocations = {1, 5}, element = "fire"},
    [7844] = {storage = 15145, vocations = {1, 5}, element = "energy"},

    -- Yalahar
    [7845] = {storage = 15122, vocations = {2, 6}, element = "ice"},
    [7846] = {storage = 15134, vocations = {2, 6}, element = "earth"},
    [7847] = {storage = 15158, vocations = {1, 5}, element = "fire"},
    [7848] = {storage = 15146, vocations = {1, 5}, element = "energy"}
}

local elementalDestinations = {
    ice = {x=32193, y=31419, z=2},
    earth = {x=32974, y=32224, z=7},
    fire = {x=32909, y=32338, z=15},
    energy = {x=33060, y=32711, z=5}
}

function onStepIn(cid, item, position, fromPosition)

    if not isPlayer(cid) then
        return true
    end

    local aid = item.actionid

    local info = cityPortals[aid]

    if info then

        local allowed = isInArray(info.vocations, getPlayerVocation(cid)) and getPlayerLevel(cid) >= 30 and isPremium(cid)

        if not allowed then

            local vocationName = info.vocations[1] == 1 and "Sorcerers" or "Druids"

            doCreatureSay(cid, "Only Premium " .. vocationName .. " of level 30 or higher are able to enter this portal.", TALKTYPE_ORANGE_1)

            return true
        end

        local destination = elementalDestinations[info.element]

        if destination then
            doTeleportThing(cid, destination)
            doSendMagicEffect(destination, CONST_ME_TELEPORT)
            setPlayerStorageValue(cid, info.storage, 1)
        end

        return true
    end

    local element = elementTeleports[aid]

    if element then

        for storage, destination in pairs(element.destinations) do

            if getPlayerStorageValue(cid, storage) == 1 then

                doTeleportThing(cid, destination)
                doSendMagicEffect(destination, CONST_ME_TELEPORT)

                setPlayerStorageValue(cid, storage, -1)

                return true
            end
        end
    end

    return true
end