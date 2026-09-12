local config = {
	{ position = { x = 33281, y = 32442, z = 8 }, itemId = 3698 },
	{ position = { x = 33286, y = 32444, z = 8 }, itemId = 3698 },
	{ position = { x = 33276, y = 32444, z = 8 }, itemId = 3697 },
	{ position = { x = 33278, y = 32450, z = 8 }, itemId = 3697 },
	{ position = { x = 33284, y = 32450, z = 8 }, itemId = 3697 },
}

local coffinPosition = { x = 33273, y = 32458, z = 8 }
local statueCheckDelay = 2 * 60 * 1000 -- 2 minutos

local function revertCoffin()
	local coffinItem = getTileItemById(coffinPosition, 7525)
	if coffinItem.uid > 0 then
		doTransformItem(coffinItem.uid, 7520)
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local statuesInOrder = true

	for _, statue in ipairs(config) do
		local statueItem = getTileItemById(statue.position, statue.itemId)
		if statueItem.uid == 0 then
			statuesInOrder = false
			break
		end
	end

	local openedCoffin = getTileItemById(coffinPosition, 7525)
	if not statuesInOrder or openedCoffin.uid > 0 then
		doCreatureSay(cid, "Nothing happens.", TALKTYPE_MONSTER_SAY)
		return true
	end

	local closedCoffin = getTileItemById(coffinPosition, 7520)
	if closedCoffin.uid > 0 then
		doTransformItem(closedCoffin.uid, 7525)
		addEvent(revertCoffin, statueCheckDelay)
		doCreatureSay(cid, "CLICK", TALKTYPE_MONSTER_SAY, false, cid, coffinPosition)
	end

	return true
end
