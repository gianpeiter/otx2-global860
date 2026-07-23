local helmets = {
    [5461] = true,   -- Helmet of the Deep
}

local destination = {x = 32950, y = 31181, z = 9}

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local head = getPlayerSlotItem(cid, CONST_SLOT_HEAD)

    if head.uid > 0 and helmets[head.itemid] then
        doTeleportThing(cid, destination)
        doSendMagicEffect(destination, CONST_ME_WATERSPLASH)
        doCreatureSay(cid, "The vortex throws you out in this vicious place.", TALKTYPE_ORANGE_1)
    else
        doTeleportThing(cid, fromPosition)
        doSendMagicEffect(fromPosition, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You must wear an underwater exploration helmet in order to dive.")
    end

    return true
end