LOYALTY_RANKS = {
	{title = "Legend of Realmia", 	   points = 12, skill = 5},
	{title = "Enlightened of Realmia", points = 8, skill = 4},
	{title = "Guardian of Realmia",    points = 6,  skill = 3},
	{title = "Warden of Realmia",      points = 3,  skill = 2},
	{title = "Sentinel of Realmia",    points = 1,  skill = 1},
	{title = "Scout of Realmia",       points = 0,  skill = 0}
}

function getPlayerLoyaltyPoints(cid)
	local result = db.getResult("SELECT loyalty_points FROM accounts WHERE id = " .. getPlayerAccountId(cid))

	if result:getID() == -1 then
		return 0
	end

	local loyaltyPoints = result:getDataInt("loyalty_points")
	result:free()

	return loyaltyPoints
end

function getPlayerLoyaltySkill(cid)
	local loyaltyPoints = getPlayerLoyaltyPoints(cid)

	for _, rank in ipairs(LOYALTY_RANKS) do
		if loyaltyPoints >= rank.points then
			return rank.skill
		end
	end

	return 0
end

function getPlayerLoyaltyTitle(cid)
	local loyaltyPoints = getPlayerLoyaltyPoints(cid)

	for _, rank in ipairs(LOYALTY_RANKS) do
		if loyaltyPoints >= rank.points then
			return rank.title
		end
	end

	return "Scout of Realmia"
end

function addAccountLoyaltyPoints(accountId, amount)
	return db.executeQuery(
		"UPDATE accounts SET loyalty_points = loyalty_points + " .. amount ..
		" WHERE id = " .. accountId
	)
end

function getAccountLoyaltyPoints(accountId)
	local result = db.getResult("SELECT loyalty_points FROM accounts WHERE id = " .. accountId)

	if result:getID() == -1 then
		return 0
	end

	local loyaltyPoints = result:getDataInt("loyalty_points")
	result:free()

	return loyaltyPoints
end