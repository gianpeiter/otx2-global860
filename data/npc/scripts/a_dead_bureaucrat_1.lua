local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)
end

function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)
end

function onThink()
	npcHandler:onThink()
end

npcHandler.topic = {}

local STORAGE = 10007 -- Storage.PitsOfInferno.ThronePumin

local config = {
	[1] = "wand",   -- Sorcerer
	[2] = "rod",    -- Druid
	[3] = "bow",    -- Paladin
	[4] = "sword",  -- Knight
	[5] = "wand",   -- Master Sorcerer
	[6] = "rod",    -- Elder Druid
	[7] = "bow",    -- Royal Paladin
	[8] = "sword"   -- Elite Knight
}

local vocationNames = {
	[1] = "sorcerer",
	[2] = "druid",
	[3] = "paladin",
	[4] = "knight",
	[5] = "master sorcerer",
	[6] = "elder druid",
	[7] = "royal paladin",
	[8] = "elite knight"
}

local function greetCallback(cid)
	if getPlayerSex(cid) == PLAYERSEX_FEMALE then
		npcHandler:setMessage(MESSAGE_GREET, "Hello beautiful lady, welcome to the atrium of Pumin's Domain. We require some information from you before we can let you pass. Where do you want to go?")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Hello handsome gentleman, welcome to the atrium of Pumin's Domain. We require some information from you before we can let you pass. Where do you want to go?")
	end

	npcHandler.topic[cid] = 0
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local vocation = getPlayerVocation(cid)

	if msgcontains(msg, "pumin") then
		if npcHandler.topic[cid] == 0 and getPlayerStorageValue(cid, STORAGE) < 1 then
			npcHandler:say("Sure, where else. Everyone likes to meet my master, he is a great demon, isn't he? Your name is ...?", cid)
			npcHandler.topic[cid] = 1

		elseif npcHandler.topic[cid] == 3 then
			setPlayerStorageValue(cid, STORAGE, 1)
			npcHandler:say("How very interesting. I need to tell that to my master immediately. Please go to my colleagues and ask for Form 356. You will need it in order to proceed.", cid)
			npcHandler.topic[cid] = 0
		end

	elseif npcHandler.topic[cid] == 1 and msgcontains(msg, getPlayerName(cid)) then
		npcHandler:say("Alright |PLAYERNAME|. Vocation?", cid)
		npcHandler.topic[cid] = 2

	elseif npcHandler.topic[cid] == 2 and vocationNames[vocation] and msgcontains(msg:lower(), vocationNames[vocation]) then
		npcHandler:say("Huhu, please don't hurt me with your " .. config[vocation] .. "! Reason of your visit?", cid)
		npcHandler.topic[cid] = 3

	elseif msgcontains(msg, "411") then
		if getPlayerStorageValue(cid, STORAGE) == 3 then
			npcHandler:say("Form 411? You need Form 287 to get that! Do you have it?", cid)
			npcHandler.topic[cid] = 4

		elseif getPlayerStorageValue(cid, STORAGE) == 5 then
			npcHandler:say("Form 411? You need Form 287 to get that! Do you have it?", cid)
			npcHandler.topic[cid] = 5
		end

	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] == 4 then
			setPlayerStorageValue(cid, STORAGE, 4)
			npcHandler:say("Oh, what a pity. Go see one of my colleagues. I give you the permission to get Form 287. Bye!", cid)
			npcHandler.topic[cid] = 0
		end

	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 5 then
			setPlayerStorageValue(cid, STORAGE, 6)
			npcHandler:say("Great. Here you are. Form 411. Come back anytime you want to talk. Bye.", cid)
			npcHandler.topic[cid] = 0
		end

	elseif msgcontains(msg, "356") then
		if getPlayerStorageValue(cid, STORAGE) == 8 then
			setPlayerStorageValue(cid, STORAGE, 9)
			npcHandler:say("INCREDIBLE, you did it!! Have fun at Pumin's Domain!", cid)
		end
	end

	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and don't forget me!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and don't forget me!")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())