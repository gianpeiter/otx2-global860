local LOYALTY_SUBID = 100

local sorcererConditions = {}
local druidConditions = {}
local paladinConditions = {}
local knightConditions = {}

for skill = 1, 5 do

	local sorcerer = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(sorcerer, CONDITION_PARAM_TICKS, -1)
	setConditionParam(sorcerer, CONDITION_PARAM_SUBID, LOYALTY_SUBID)
	setConditionParam(sorcerer, CONDITION_PARAM_STAT_MAGICLEVEL, skill)
	sorcererConditions[skill] = sorcerer

	local druid = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(druid, CONDITION_PARAM_TICKS, -1)
	setConditionParam(druid, CONDITION_PARAM_SUBID, LOYALTY_SUBID)
	setConditionParam(druid, CONDITION_PARAM_STAT_MAGICLEVEL, skill)
	druidConditions[skill] = druid

	local paladin = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(paladin, CONDITION_PARAM_TICKS, -1)
	setConditionParam(paladin, CONDITION_PARAM_SUBID, LOYALTY_SUBID)
	setConditionParam(paladin, CONDITION_PARAM_SKILL_DISTANCE, skill)
	setConditionParam(paladin, CONDITION_PARAM_SKILL_SHIELD, skill)
	paladinConditions[skill] = paladin

	local knight = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(knight, CONDITION_PARAM_TICKS, -1)
	setConditionParam(knight, CONDITION_PARAM_SUBID, LOYALTY_SUBID)
	setConditionParam(knight, CONDITION_PARAM_SKILL_SWORD, skill)
	setConditionParam(knight, CONDITION_PARAM_SKILL_AXE, skill)
	setConditionParam(knight, CONDITION_PARAM_SKILL_CLUB, skill)
	setConditionParam(knight, CONDITION_PARAM_SKILL_SHIELD, skill)
	knightConditions[skill] = knight
end

function applyLoyaltyCondition(cid)

	local loyaltyskill = getPlayerLoyaltySkill(cid)

	if loyaltyskill <= 0 then
		return true
	end

	if isSorcerer(cid) then

		doAddCondition(cid, sorcererConditions[loyaltyskill])

	elseif isDruid(cid) then

		doAddCondition(cid, druidConditions[loyaltyskill])

	elseif isPaladin(cid) then

		doAddCondition(cid, paladinConditions[loyaltyskill])

	elseif isKnight(cid) then

		doAddCondition(cid, knightConditions[loyaltyskill])

	end

	return true
end

function onLogin(cid)
	applyLoyaltyCondition(cid)
	return true
end