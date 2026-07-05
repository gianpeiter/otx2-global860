local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local talkState = {}
local storage = 100168

function greetCallback(cid)
	talkState[cid] = 0
	return true
end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, "no") and talkState[cid] > 0 then
		npcHandler:say("That just makes me sad.", cid)
		talkState[cid] = 0
		return true
	end

	-- The Postman Missions Quest
	if msgcontains(msg, "present") and getPlayerStorageValue(cid, storage) == 11 then
		npcHandler:say("Uh? What do you want?!", cid)
		talkState[cid] = 1

	-- Deeper Fibula Quest
	elseif msgcontains(msg, "key") then
		npcHandler:say("Do you want to buy the dungeon key for 2000 gold?", cid)
		talkState[cid] = 2

	elseif msgcontains(msg, "yes") then

		if talkState[cid] == 1 then
			if doPlayerRemoveItem(cid, 2331, 1) then
				npcHandler:say("You have a present for me?? Realy?", cid)
				setPlayerStorageValue(cid, storage, 12)
				setPlayerStorageValue(cid, 100171, 17)
			else
				npcHandler:say("I dont see any {present} with you!", cid)
			end

		elseif talkState[cid] == 2 then
			if doPlayerRemoveMoney(cid, 2000) then
				npcHandler:say("Here it is.", cid)

				local key = doPlayerAddItem(cid, 2087, 1)
				if key > 0 then
					doSetItemActionId(key, 3940)
				end
			else
				npcHandler:say("You don't have enough money.", cid)
			end
		end

		talkState[cid] = 0
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hello, traveller player. How can I help you?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Take care, |PLAYERNAME|.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())