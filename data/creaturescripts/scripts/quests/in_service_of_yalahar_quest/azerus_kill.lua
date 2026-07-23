local config = {
    teleport = {
        itemid = 1387,
        destination = {x = 32780, y = 31168, z = 14},
        removeTime = 180
    },

    bosses = {
        ["Azerus"] = true
    }
}

local function removeTeleport(position)

    local teleport = getTileItemById(position, config.teleport.itemid)

    if teleport.uid > 0 then
        doSendMagicEffect(position, CONST_ME_POFF)
        doRemoveItem(teleport.uid)
    end

end

function onKill(cid, target, damage, flags)

    if not isMonster(target) then
        return true
    end

    if not isPlayer(cid) then
        return true
    end

    if not config.bosses[getCreatureName(target)] then
        return true
    end

    local pos = getCreaturePosition(target)

    if getTileItemById(pos, config.teleport.itemid).uid == 0 then

        doCreateTeleport(
            config.teleport.itemid,
            config.teleport.destination,
            pos
        )

        doSendMagicEffect(pos, CONST_ME_TELEPORT)

        addEvent(
            removeTeleport,
            config.teleport.removeTime * 1000,
            pos
        )
    end

    return true
end