local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function greetCallback(cid)
	if getPlayerStorageValue(cid, 100500) == 1 then
		npcHandler:say("LEAVE THE DRAGONS' CEMETERY AT ONCE!", cid)
		return false
	end

	if not doPlayerRemoveItem(cid, 2787, 1) then
		npcHandler:say("AHHHH THE PAIN OF AGESSS! I NEED MUSSSSHRROOOMSSS TO EASSSE MY PAIN! BRRRING ME MUSHRRROOOMSSS!", cid)
		return false
	end

	setPlayerStorageValue(cid, 100500, 1)
	doPlayerAddItem(cid, 2319, 1)

	npcHandler:say("AHHH MUSHRRROOOMSSS! NOW MY PAIN WILL BE EASSSED FOR A WHILE! TAKE THISS AND LEAVE THE DRAGONSSS' CEMETERY AT ONCE!", cid)
	return false
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())