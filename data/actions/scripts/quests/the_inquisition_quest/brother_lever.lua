local config = {
    [12965] = {
        wallPositions = {
            {x = 33226, y = 31721, z = 11, stackpos = 1},
            {x = 33227, y = 31721, z = 11, stackpos = 1},
            {x = 33228, y = 31721, z = 11, stackpos = 1},
            {x = 33229, y = 31721, z = 11, stackpos = 1},
            {x = 33230, y = 31721, z = 11, stackpos = 1},
            {x = 33231, y = 31721, z = 11, stackpos = 1},
            {x = 33232, y = 31721, z = 11, stackpos = 1},
            {x = 33233, y = 31721, z = 11, stackpos = 1},
            {x = 33234, y = 31721, z = 11, stackpos = 1},
            {x = 33235, y = 31721, z = 11, stackpos = 1},
            {x = 33236, y = 31721, z = 11, stackpos = 1},
            {x = 33237, y = 31721, z = 11, stackpos = 1},
            {x = 33238, y = 31721, z = 11, stackpos = 1}
        },
        wallDown = 1524,
        wallUp = 1050
    },

    [12966] = {
        wallPositions = {
            {x = 33223, y = 31724, z = 11, stackpos = 1},
            {x = 33223, y = 31725, z = 11, stackpos = 1},
            {x = 33223, y = 31726, z = 11, stackpos = 1},
            {x = 33223, y = 31727, z = 11, stackpos = 1},
            {x = 33223, y = 31728, z = 11, stackpos = 1},
            {x = 33223, y = 31729, z = 11, stackpos = 1},
            {x = 33223, y = 31730, z = 11, stackpos = 1},
            {x = 33223, y = 31731, z = 11, stackpos = 1},
            {x = 33223, y = 31732, z = 11, stackpos = 1}
        },
        wallDown = 1526,
        wallUp = 1049
    },

    [12967] = {
        wallPositions = {
            {x = 33226, y = 31735, z = 11, stackpos = 1},
            {x = 33227, y = 31735, z = 11, stackpos = 1},
            {x = 33228, y = 31735, z = 11, stackpos = 1},
            {x = 33229, y = 31735, z = 11, stackpos = 1},
            {x = 33230, y = 31735, z = 11, stackpos = 1},
            {x = 33231, y = 31735, z = 11, stackpos = 1},
            {x = 33232, y = 31735, z = 11, stackpos = 1},
            {x = 33233, y = 31735, z = 11, stackpos = 1},
            {x = 33234, y = 31735, z = 11, stackpos = 1},
            {x = 33235, y = 31735, z = 11, stackpos = 1},
            {x = 33236, y = 31735, z = 11, stackpos = 1},
            {x = 33237, y = 31735, z = 11, stackpos = 1},
            {x = 33238, y = 31735, z = 11, stackpos = 1}
        },
        wallDown = 1524,
        wallUp = 1050
    },

    [12968] = {
        wallPositions = {
            {x = 33241, y = 31724, z = 11, stackpos = 1},
            {x = 33241, y = 31725, z = 11, stackpos = 1},
            {x = 33241, y = 31726, z = 11, stackpos = 1},
            {x = 33241, y = 31727, z = 11, stackpos = 1},
            {x = 33241, y = 31728, z = 11, stackpos = 1},
            {x = 33241, y = 31729, z = 11, stackpos = 1},
            {x = 33241, y = 31730, z = 11, stackpos = 1},
            {x = 33241, y = 31731, z = 11, stackpos = 1},
            {x = 33241, y = 31732, z = 11, stackpos = 1}
        },
        wallDown = 1526,
        wallUp = 1049
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

    local t = config[item.actionid]
    if not t then
        return false
    end

    local fromId, toId

    if item.itemid == 1945 then
        fromId = t.wallDown
        toId = t.wallUp
    else
        fromId = t.wallUp
        toId = t.wallDown
    end

    for i = 1, #t.wallPositions do
        local wall = getThingfromPos(t.wallPositions[i])

        if wall.uid > 0 and wall.itemid == fromId then
            doTransformItem(wall.uid, toId)
        end
    end

    doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
    return true
end