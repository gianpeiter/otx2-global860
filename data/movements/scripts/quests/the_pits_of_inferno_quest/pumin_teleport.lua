function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    if getPlayerStorageValue(cid, 10007) < 50 then
        doTeleportThing(cid, {x = 32786, y = 32308, z = 15})
        doSendMagicEffect({x = 32786, y = 32308, z = 15}, CONST_ME_TELEPORT)
    else
        doTeleportThing(cid, fromPosition)
        doSendMagicEffect(fromPosition, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "To enter Pumin's domain you must gain permission from the bureaucrats.")
    end

    return true
end