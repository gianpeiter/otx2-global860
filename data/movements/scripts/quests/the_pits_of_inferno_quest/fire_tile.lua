local fires = {
    [9859] = {check = isSorcerer, damage = 300},
    [9860] = {check = isSorcerer, damage = 600},
    [9861] = {check = isSorcerer, damage = 1200},
    [9862] = {check = isSorcerer, damage = 2400},
    [9863] = {check = isSorcerer, damage = 3600},
    [9864] = {check = isSorcerer, damage = 7200},

    [9865] = {check = isDruid, damage = 300},
    [9866] = {check = isDruid, damage = 600},
    [9867] = {check = isDruid, damage = 1200},
    [9868] = {check = isDruid, damage = 2400},
    [9869] = {check = isDruid, damage = 3600},
    [9870] = {check = isDruid, damage = 7200},

    [9871] = {check = isPaladin, damage = 300},
    [9872] = {check = isPaladin, damage = 600},
    [9873] = {check = isPaladin, damage = 1200},
    [9874] = {check = isPaladin, damage = 2400},
    [9875] = {check = isPaladin, damage = 3600},
    [9876] = {check = isPaladin, damage = 7200},

    [9877] = {check = isKnight, damage = 300},
    [9878] = {check = isKnight, damage = 600},
    [9879] = {check = isKnight, damage = 1200},
    [9880] = {check = isKnight, damage = 2400},
    [9881] = {check = isKnight, damage = 3600},
    [9882] = {check = isKnight, damage = 7200}
}

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local fire = fires[item.actionid]
    if not fire then
        return true
    end

    if fire.check(cid) then
        doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -300, -300, CONST_ME_HITBYFIRE)
    else
        local combat = COMBAT_FIREDAMAGE
        if fire.damage > 300 then
            combat = COMBAT_PHYSICALDAMAGE
        end

        doTargetCombatHealth(0, cid, combat, -fire.damage, -fire.damage, CONST_ME_FIREATTACK)
    end

    return true
end