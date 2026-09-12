local positions = {
	[1] = { x = 32328, y = 31782, z = 6 }, -- Sunday - Carlin
	[2] = { x = 32207, y = 31155, z = 7 }, -- Monday - Svargrond
	[3] = { x = 32300, y = 32837, z = 7 }, -- Tuesday - Liberty Bay
	[4] = { x = 32577, y = 32753, z = 7 }, -- Wednesday - Port Hope
	[5] = { x = 33066, y = 32879, z = 6 }, -- Thursday - Ankrahmun
	[6] = { x = 33235, y = 32483, z = 7 }, -- Friday - Darashia
	[7] = { x = 33166, y = 31810, z = 6 }, -- Saturday - Edron
}

local function moveRashid(pos)
	local rashid = getCreatureByName("Rashid")

	if isNpc(rashid) then
		doRemoveCreature(rashid)
	end

	if doCreateNpc("Rashid", pos) then
		doSendMagicEffect(pos, CONST_ME_MAGIC_RED)
	else
		doSendMagicEffect(pos, CONST_ME_POFF)
	end
end

function onTime()
	local pos = positions[os.date("*t").wday]
	local rashid = getCreatureByName("Rashid")

	if isNpc(rashid) then
		doCreatureSay(rashid, "See you, now I'm going to the next city!", TALKTYPE_SAY)
		addEvent(moveRashid, 3000, pos)
	else
		moveRashid(pos)
	end

	return true
end
