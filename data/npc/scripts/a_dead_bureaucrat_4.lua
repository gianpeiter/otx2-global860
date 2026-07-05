local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	local sex = getPlayerSex(cid)

	npcHandler:setMessage(MESSAGE_GREET,
		"Hello " ..
		(sex == PLAYERSEX_FEMALE and "beautiful lady" or "handsome gentleman") ..
		", welcome to the atrium of Pumin's Domain. We require some information from you before we can let you pass. Where do you want to go?"
	)

	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local vocationName
	local vocationText

	if isSorcerer(cid) then
		vocationName = "Sorcerer"
		vocationText = "S O R C E R E R"
	elseif isDruid(cid) then
		vocationName = "Druid"
		vocationText = "D R U I D"
	elseif isPaladin(cid) then
		vocationName = "Paladin"
		vocationText = "P A L A D I N"
	elseif isKnight(cid) then
		vocationName = "Knight"
		vocationText = "K N I G H T"
	end

	if msgcontains(msg, "pumin") then
		if getPlayerStorageValue(cid, 10007) < 1 then
			npcHandler:say("I'm not sure if you know what you are doing but anyway. Your name is?", cid)
			npcHandler.topic[cid] = 1
		end

	elseif msgcontains(msg, getPlayerName(cid)) then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Alright |PLAYERNAME|. Vocation?", cid)
			npcHandler.topic[cid] = 2
		end

	elseif vocationName and msgcontains(msg, vocationName) then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say(vocationText .. ", is that right?! What do you want from me?", cid)
			npcHandler.topic[cid] = 3
		end

	elseif msgcontains(msg, "356") then
		if npcHandler.topic[cid] == 3 then
			setPlayerStorageValue(cid, 10007, 2)
			npcHandler:say("Sorry, you need Form 145 to get Form 356. Come back when you have it.", cid)
			npcHandler.topic[cid] = 0

		elseif getPlayerStorageValue(cid, 10007) == 7 then
			setPlayerStorageValue(cid, 10007, 8)
			npcHandler:say("You are better than I thought! Congratulations, here you are: Form 356!", cid)
		end
	end

	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and don't forget me!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and don't forget me!")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())