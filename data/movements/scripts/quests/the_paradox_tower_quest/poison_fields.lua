local positions = {
	{x = 32497, y = 31889, z = 7},
	{x = 32497, y = 31890, z = 7},
	{x = 32498, y = 31890, z = 7},
	{x = 32499, y = 31890, z = 7},
	{x = 32502, y = 31890, z = 7},
	{x = 32494, y = 31888, z = 7}
}

function onStepIn(cid, item, position, fromPosition)
	if item.actionid ~= 13002 then
		return true
	end

	local checkPos = {x = 32502, y = 31890, z = 7}

	if getTileItemByType(checkPos, ITEM_TYPE_MAGICFIELD).uid == 0 then
		doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -200, -200, CONST_ME_HITBYPOISON)

		for _, pos in ipairs(positions) do
			doCreateItem(1490, 1, pos)
		end
	end

	return true
end