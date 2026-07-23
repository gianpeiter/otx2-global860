function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    if item.actionid == 58262 then
        if getPlayerStorageValue(cid, 100051) == -1 then
            doCreatureSay(cid, "It seems by defeating Azerus you have stopped this army from entering your world! Better leave this ghastly place forever.", TALKTYPE_ORANGE_1)
            setPlayerStorageValue(cid, 100051, 1)
            setPlayerStorageValue(cid, 100086, 30)
        end
    end

    return true
end