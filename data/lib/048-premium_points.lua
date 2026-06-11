function getPlayerPremiumPoints(cid)
	local result = db.getResult("SELECT `premium_points` FROM `accounts` WHERE `id` = " .. getPlayerAccountId(cid))

	if result:getID() == -1 then
		return 0
	end

	local points = result:getDataInt("premium_points")
	result:free()

	return points
end

function doPlayerAddPremiumPoints(cid, points)
	return db.query("UPDATE `accounts` SET `premium_points` = `premium_points` + " .. points .. " WHERE `id` = " .. getPlayerAccountId(cid))
end

function doPlayerRemovePremiumPoints(cid, points)
	return db.query("UPDATE `accounts` SET `premium_points` = `premium_points` - " .. points .. " WHERE `id` = " .. getPlayerAccountId(cid))
end