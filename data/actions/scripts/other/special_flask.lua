function onUse(cid, item, fromPosition, itemEx, toPosition)

	-- The Inquisition Quest - Mission 07: The Shadow Nexus
	if getPlayerStorageValue(cid, 100080) == 2 then
		if isInArray({8753, 8755, 8757}, itemEx.itemid) then

			doTransformItem(itemEx.uid, itemEx.itemid + 1)
			doDecayItem(itemEx.uid)

			doCreatureSay(
				cid,
				getCreatureName(cid) .. " damaged the shadow nexus! You can't damage it while it's burning.",
				TALKTYPE_MONSTER_YELL,
				false,
				cid,
				getThingPos(itemEx.uid)
			)

			doSendMagicEffect(toPosition, CONST_ME_ENERGYHIT)
			return true

		elseif itemEx.itemid == 8759 then
			doPlayerRemoveItem(cid, 7494, 1)

			setPlayerStorageValue(cid, 100080, 3)

			doDecayItem(itemEx.uid)

			doCreatureSay(
				cid,
				getCreatureName(cid) .. " destroyed the shadow nexus! In 20 seconds it will return to its original state.",
				TALKTYPE_MONSTER_YELL,
				false,
				cid,
				getThingPos(itemEx.uid)
			)

			doSendMagicEffect(toPosition, CONST_ME_HOLYAREA)
			return true
		end
	end

	-- The Inquisition Quest - Mission 02: The Eclipse
	if itemEx.actionid == 18898 then
		if getPlayerStorageValue(cid, 90000) == 4 then
			doSendMagicEffect(toPosition, CONST_ME_FIREAREA)
			doPlayerRemoveItem(cid, 7494, 1)

			setPlayerStorageValue(cid, 99220, 1)
			setPlayerStorageValue(cid, 100078, 6)
		end

	-- The Inquisition Quest - Mission 04: The Haunted Ruin
	elseif itemEx.actionid == 18899 then
		if getPlayerStorageValue(cid, 49312) == 1 then
			doSendMagicEffect(toPosition, CONST_ME_HOLYAREA)
			doSummonCreature("Pirate Ghost", {x = 32257, y = 32791, z = 7})

			setPlayerStorageValue(cid, 49312, 2)
			setPlayerStorageValue(cid, 100078, 15)

			doPlayerRemoveItem(cid, 7494, 1)

			local tile = getTileItemById({x = 32260, y = 32791, z = 7}, 8697)
			if tile.uid > 0 then
				doTransformItem(tile.uid, 8696)
			end

			addEvent(function()
				local tile = getTileItemById({x = 32260, y = 32791, z = 7}, 8696)
				if tile.uid > 0 then
					doTransformItem(tile.uid, 8697)
				end
			end, 10 * 1000)
		end
	end

	return true
end