local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)

local area = createCombatArea(AREA_CROSS1X1)
setCombatArea(combat, area)

function onGetFormulaValues(cid, level, maglevel)

	local formula = (3 * maglevel) + (2 * level)

	local min = ((60 - 40) * formula) / 100
	local max = ((60 + 40) * formula) / 100

	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end