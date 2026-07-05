local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local talkState = {}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local state = talkState[cid] or 0

	-- Skjaar Key
	if msgcontains(msg, 'key') then
		npcHandler:say('I will give the key to the crypt only to the closest followers of my master. Would you like me to test you?', cid)
		talkState[cid] = 1

	elseif msgcontains(msg, 'yes') and state == 1 then
		npcHandler:say('Before we start I must ask you for a small donation of 1000 gold coins. Are you willing to pay 1000 gold coins for the test?', cid)
		talkState[cid] = 2

	elseif msgcontains(msg, 'yes') and state == 2 then
		if doPlayerRemoveMoney(cid, 1000) then
			npcHandler:say('All right then. Here comes the first question. What was the name of Dago\'s favourite pet?', cid)
			talkState[cid] = 3
		else
			npcHandler:say('You don\'t have enough money.', cid)
			talkState[cid] = 0
		end

	elseif msgcontains(msg, 'redips') and state == 3 then
		npcHandler:say('Perhaps you knew him after all. Tell me - how many fingers did he have when he died?', cid)
		talkState[cid] = 4

	elseif msgcontains(msg, '7') and state == 4 then
		npcHandler:say('Also true. But can you also tell me the colour of the deamons in which master specialized?', cid)
		talkState[cid] = 5

	elseif msgcontains(msg, 'black') and state == 5 then
		npcHandler:say('It seems you are worthy after all. Do you want the key to the crypt?', cid)
		talkState[cid] = 6

	elseif msgcontains(msg, 'yes') and state == 6 then
		local item = doPlayerAddItem(cid, 2089, 1)

		if item > 0 then
			doSetItemActionId(item, 3142)
			npcHandler:say('Here you are.', cid)
		else
			npcHandler:say('You do not have enough capacity.', cid)
		end

		talkState[cid] = 0
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Another creature who believes thinks physical strength is more important than wisdom! Why are you disturbing me?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Run away, unworthy |PLAYERNAME|!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())