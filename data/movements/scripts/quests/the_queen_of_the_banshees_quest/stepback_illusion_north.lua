function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) then
		doRelocate(position, {x = position.x, y = 31886, z = 12})
	end
	return true
end