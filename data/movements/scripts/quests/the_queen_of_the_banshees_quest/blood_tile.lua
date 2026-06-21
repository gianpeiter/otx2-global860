local bloodPos = {x = 32243, y = 31892, z = 14}
local relocatePos = {x = 32244, y = 31892, z = 14}

local function doBloodEffect()
	doSendMagicEffect({x = 32242, y = 31891, z = 14}, CONST_ME_DRAWBLOOD)
	doSendMagicEffect({x = 32243, y = 31891, z = 14}, CONST_ME_DRAWBLOOD)
	doSendMagicEffect({x = 32242, y = 31892, z = 14}, CONST_ME_DRAWBLOOD)
	doSendMagicEffect({x = 32242, y = 31893, z = 14}, CONST_ME_DRAWBLOOD)
	doSendMagicEffect({x = 32243, y = 31893, z = 14}, CONST_ME_DRAWBLOOD)
end

local function checkBlood()
	local blood = getTileItemById(bloodPos, 2016)

	if blood.uid > 0 and blood.type == 2 then
		doBloodEffect()
	else
		doRelocate(bloodPos, relocatePos)
		doSendMagicEffect(bloodPos, CONST_ME_TELEPORT)
	end
end

function onStepIn(cid, item, position, fromPosition)
	checkBlood()
	return true
end

function onAddItem(moveitem, tileitem, position)
	checkBlood()
	return true
end