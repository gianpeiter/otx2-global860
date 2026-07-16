local config = {
    drawsPerDay = 5,

    -- Tempo mínimo após o Global Save para o primeiro sorteio
    firstDrawDelay = 60 * 60,

    -- Tempo mínimo antes do próximo Global Save para o último sorteio
    lastDrawBeforeSave = 30 * 60,

    rewards = {
        {id = 7499, amount = 1},
        {id = 10522, amount = 1},
        {id = 11243, amount = 1},
        {id = 11241, amount = 1}
    },

    website = true,

    winnerStorage = 281821,
    winnerCooldown = 24 * 60 * 60
}

local lotterySchedule = {}
local lotteryInitialized = false
local lotteryFinished = false

local function getOnlineParticipants()
    local players = {}

    for _, cid in ipairs(getPlayersOnline()) do
        if getPlayerAccess(cid) <= 2 and getPlayerStorageValue(cid, config.winnerStorage) <= os.time() then
            table.insert(players, cid)
        end
    end

    return players
end

local function generateSchedule()
    lotterySchedule = {}

    local now = os.time()
    local date = os.date("*t", now)

    date.hour = getConfigValue("globalSaveHour")
    date.min = getConfigValue("globalSaveMinute")
    date.sec = 0

    local cycleStart = os.time(date)

    if now < cycleStart then
        cycleStart = cycleStart - 86400
    end

    local beginTime = cycleStart + config.firstDrawDelay
    local endTime = cycleStart + 86400 - config.lastDrawBeforeSave

    local block = math.floor((endTime - beginTime) / config.drawsPerDay)

    for i = 0, config.drawsPerDay - 1 do
        local blockStart = beginTime + (block * i)
        local blockEnd = blockStart + block

        table.insert(lotterySchedule, math.random(blockStart, blockEnd))
    end

    table.sort(lotterySchedule)

    print("[Lottery System] Today's draws:")

    for _, ts in ipairs(lotterySchedule) do
        print(" - " .. os.date("%d/%m/%Y %H:%M:%S", ts))
    end
end

local function doLottery()
    local players = getOnlineParticipants()

    if #players == 0 then
        print("[Lottery System] No online players.")
        return
    end

    local winner = players[math.random(#players)]
    local reward = config.rewards[math.random(#config.rewards)]

    doPlayerSetStorageValue(
        winner,
        config.winnerStorage,
        os.time() + config.winnerCooldown
    )

    local rewardMessage = string.format(
        "[Lottery System] Winner: %s | Reward: %dx %s! Congratulations!",
        getCreatureName(winner),
        reward.amount,
        getItemNameById(reward.id)
    )

    local rewards = {
        {
            id = reward.id,
            count = reward.amount
        }
    }

    doPlayerReceiveParcel(
        getCreatureName(winner),
        getPlayerTown(winner),
        rewards,
        rewardMessage,
        2597
    )

    doBroadcastMessage(rewardMessage)

    if config.website then
		db.executeQuery(string.format(
			"INSERT INTO lottery_system (name, item, item_name, created_at) VALUES ('%s', %d, '%s', NOW())",
			getCreatureName(winner),
			reward.id,
			getItemNameById(reward.id)
		))
    end
end

function onThink(interval)
    if not lotteryInitialized then
        generateSchedule()
        lotteryInitialized = true
    end

	if #lotterySchedule == 0 then
		if not lotteryFinished then
			print("[Lottery System] Today's lottery schedule has ended. Waiting for the next server restart.")
			lotteryFinished = true
		end

		return true
	end

    if os.time() >= lotterySchedule[1] then
        doLottery()
        table.remove(lotterySchedule, 1)
    end

    return true
end