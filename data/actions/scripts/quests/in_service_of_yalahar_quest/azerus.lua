local config = {

    room = {
        from = {x = 32776, y = 31158, z = 10},
        to   = {x = 32790, y = 31175, z = 10}
    },

    center = {x = 32783, y = 31166, z = 10},

    exit = {x = 32782, y = 31179, z = 9},

    teleport = {
        entry = {x = 32784, y = 31177, z = 9},
        room  = {x = 32783, y = 31175, z = 10}
    },

    globe = {
        pos = {x = 32783, y = 31166, z = 10},
        freeAid = 58261,
        busyAid = 58263
    },

    playersRequired = 1
}

local BOSS_SPAWN_DELAY = 18 * 1000
local BOSS_CHANGE_DELAY = 3 * 60 * 1000
local ROOM_RESET_DELAY = 5 * 60 * 1000

local summonPositions = {
    {x = 32779, y = 31166, z = 10},
    {x = 32787, y = 31166, z = 10},
    {x = 32782, y = 31162, z = 10},
    {x = 32784, y = 31162, z = 10},
    {x = 32782, y = 31170, z = 10},
    {x = 32784, y = 31170, z = 10}
}

local function summonMonster(name, pos)
    doCreateMonster(name, pos, true)
    doSendMagicEffect(pos, CONST_ME_TELEPORT)
end

local function summonWave(monsterName)

    for i = 1, #summonPositions do
        summonMonster(monsterName, summonPositions[i])
    end

end

local function getBoss(name)

    local spectators = getSpectators(config.center, 10, 10)
    if not spectators then
        return nil
    end

    for i = 1, #spectators do

        local uid = spectators[i]

        if isMonster(uid) and getCreatureName(uid):lower() == name:lower() then
            return uid
        end

    end

    return nil
end

local function transformBoss(oldName, newName)

    local uid = getBoss(oldName)
    if not uid then
        return false
    end

    local pos = getCreaturePosition(uid)

    doCreatureSay(
        uid,
        "No! I am losing my energy!",
        TALKTYPE_MONSTER
    )

    doRemoveCreature(uid)

    summonMonster(newName, pos)

    return true
end

local waves = {
    {delay =  60, monster = "Rift Scythe"},
    {delay = 120, monster = "Rift Brood"},
    {delay = 180, monster = "War Golem"}
}

local function startFight()

    -- Wave inicial
    summonWave("Rift Worm")

    -- Spawn do Azerus2 após 18 segundos
    addEvent(function()

        summonMonster(
            "Azerus2",
            {
                x = config.center.x,
                y = config.center.y + 1,
                z = config.center.z
            }
        )

    end, BOSS_SPAWN_DELAY)

    -- Demais waves
    for i = 1, #waves do

        local wave = waves[i]

        addEvent(function()
            summonWave(wave.monster)
        end, wave.delay * 1000)

    end

    -- Transformação do boss aos 3 minutos
    addEvent(function()
        transformBoss("Azerus2", "Azerus")
    end, BOSS_CHANGE_DELAY)

end

local function getRoomSpectators()
    return getSpectators(
        config.center,
        config.room.to.x - config.center.x,
        config.center.x - config.room.from.x
    ) or {}
end

local function removeAllMonsters()

    local spectators = getRoomSpectators()

    for i = 1, #spectators do

        local uid = spectators[i]

        if isMonster(uid) then
            doSendMagicEffect(getCreaturePosition(uid), CONST_ME_POFF)
            doRemoveCreature(uid)
        end

    end

end

local function kickPlayers()

    local spectators = getRoomSpectators()

    for i = 1, #spectators do

        local uid = spectators[i]

        if isPlayer(uid) then
            doTeleportThing(uid, config.exit)
            doSendMagicEffect(config.exit, CONST_ME_TELEPORT)
        end

    end

end

local function setTeleportState(itemId)

    local teleport = getTileItemById(config.teleport.room, itemId == 1387 and 9772 or 1387)
    if teleport.uid > 0 then
        doTransformItem(teleport.uid, itemId)
    end

    teleport = getTileItemById(config.teleport.entry, itemId == 1387 and 9772 or 1387)
    if teleport.uid > 0 then
        doTransformItem(teleport.uid, itemId)
    end

end

local function unlockRoom()

    setTeleportState(1387)

    local globe = getTileItemById(config.globe.pos, 9767)
    if globe.uid > 0 then
        doItemSetAttribute(globe.uid, "aid", config.globe.freeAid)
    end

end

local function lockRoom()

    setTeleportState(9772)

    local globe = getTileItemById(config.globe.pos, 9767)
    if globe.uid > 0 then
        doItemSetAttribute(globe.uid, "aid", config.globe.busyAid)
    end

end

local function resetRoom()
    removeAllMonsters()
    kickPlayers()
    unlockRoom()
end

local startEffects = {
    {x=32779,y=31161,z=10},
    {x=32779,y=31171,z=10},
    {x=32787,y=31161,z=10},
    {x=32787,y=31171,z=10}
}

local function sendStartEffects()

    for i = 1, #startEffects do
        doSendMagicEffect(startEffects[i], CONST_ME_HOLYAREA)
    end

end

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.actionid == config.globe.busyAid then
        doCreatureSay(
            cid,
            "You have to wait some time before this globe charges.",
            TALKTYPE_ORANGE_1
        )
        return true
    end

    if item.actionid ~= config.globe.freeAid then
        return true
    end

    local spectators = getRoomSpectators()
    local players = 0

    for i = 1, #spectators do
        if isPlayer(spectators[i]) then
            players = players + 1
        end
    end

    if players < config.playersRequired then
        if isPlayer(cid) then
            doPlayerSendTextMessage(
                cid,
                MESSAGE_INFO_DESCR,
                "You need at least "..config.playersRequired.." players inside the quest room."
            )
        end

        return true
    end

    lockRoom()
    sendStartEffects()
    startFight()
    addEvent(resetRoom, ROOM_RESET_DELAY)

    return true
end