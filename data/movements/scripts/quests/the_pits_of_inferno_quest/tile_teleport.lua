local destinations = {
    [28810] = {x = 32838, y = 32304, z = 9},
    [28811] = {x = 32839, y = 32320, z = 9},
    [28812] = {x = 32844, y = 32310, z = 9},
    [28813] = {x = 32847, y = 32307, z = 9},
    [28814] = {x = 32856, y = 32306, z = 9},
    [28815] = {x = 32827, y = 32308, z = 9},
    [28816] = {x = 32840, y = 32317, z = 9},
    [28817] = {x = 32855, y = 32296, z = 9},
    [28818] = {x = 32857, y = 32307, z = 9},
    [28819] = {x = 32856, y = 32289, z = 9},
    [28820] = {x = 32843, y = 32313, z = 9},
    [28821] = {x = 32861, y = 32320, z = 9},
    [28822] = {x = 32841, y = 32323, z = 9},
    [28823] = {x = 32847, y = 32287, z = 9},
    [28824] = {x = 32854, y = 32323, z = 9},
    [28825] = {x = 32855, y = 32304, z = 9},
    [28826] = {x = 32841, y = 32323, z = 9},
    [28827] = {x = 32861, y = 32317, z = 9},
    [28828] = {x = 32827, y = 32314, z = 9},
    [28829] = {x = 32858, y = 32296, z = 9},
    [28830] = {x = 32861, y = 32301, z = 9},
    [28831] = {x = 32855, y = 32321, z = 9},
    [28832] = {x = 32855, y = 32320, z = 9},
    [28833] = {x = 32855, y = 32318, z = 9},
    [28834] = {x = 32855, y = 32319, z = 9}
}

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local destination = destinations[item.actionid]
    if not destination then
        return true
    end

    doTeleportThing(cid, destination)
    doSendMagicEffect(destination, CONST_ME_TELEPORT)

    return true
end