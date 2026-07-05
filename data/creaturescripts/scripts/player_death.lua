function onDeath(cid, corpse, deathList)
	if isPlayer(cid) then
		if getPlayerStorageValue(cid, 51711) > 0 then
			setPlayerStorageValue(cid, 51711, 0)
		end
	end

	return true
end