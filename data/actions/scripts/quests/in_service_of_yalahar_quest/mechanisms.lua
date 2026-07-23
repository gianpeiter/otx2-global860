local storage = 100013

local mechanisms = {
	-- Arena
	[51151] = {pos = {x = 32729, y = 31201, z = 5}, value = 6},
	[51152] = {pos = {x = 32734, y = 31201, z = 5}, value = 6},

	-- Alchemist
	[51153] = {pos = {x = 32745, y = 31161, z = 5}, value = 3},
	[51154] = {pos = {x = 32745, y = 31164, z = 5}, value = 3},

	-- Cemetery
	[51155] = {pos = {x = 32777, y = 31141, z = 5}, value = 8},
	[51156] = {pos = {x = 32777, y = 31145, z = 5}, value = 8},

	-- Sunken
	[51159] = {pos = {x = 32874, y = 31201, z = 5}, value = 10},
	[51160] = {pos = {x = 32869, y = 31201, z = 5}, value = 10},

	-- Factory
	[51161] = {pos = {x = 32855, y = 31251, z = 5}, value = 11},
	[51162] = {pos = {x = 32855, y = 31248, z = 5}, value = 11},

	-- Trade
	[51163] = {pos = {x = 32834, y = 31269, z = 5}, value = 4},
	[51164] = {pos = {x = 32834, y = 31266, z = 5}, value = 4}
}

local freeMechanisms = {
	[51157] = {pos = {x = 32773, y = 31116, z = 7}},
	[51158] = {pos = {x = 32780, y = 31116, z = 7}}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	local gate = mechanisms[item.actionid]

	if gate then
		if getPlayerStorageValue(cid, storage) >= gate.value then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, gate.pos)
			doSendMagicEffect(gate.pos, CONST_ME_TELEPORT)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
				"The gate mechanism won't move. You probably have to find a way around until you figure out how to operate the gate.")
		end
		return true
	end

	gate = freeMechanisms[item.actionid]

	if gate then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		doTeleportThing(cid, gate.pos)
		doSendMagicEffect(gate.pos, CONST_ME_TELEPORT)
		return true
	end

	return true
end