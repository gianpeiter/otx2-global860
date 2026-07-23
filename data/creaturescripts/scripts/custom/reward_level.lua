local rewards = {

    sorcerer = {
        [20] = {items = {{itemid = 2188, count = 1}}},
        [30] = {items = {{itemid = 2160, count = 1}}},
        [35] = {items = {{itemid = 2189, count = 1}}},
        [40] = {items = {{itemid = 2160, count = 2}}},
        [50] = {items = {{itemid = 2160, count = 3}}},
        [75] = {items = {{itemid = 2160, count = 5}}},
        [100] = {items = {{itemid = 2160, count = 10}}}
    },

    druid = {
        [20] = {items = {{itemid = 2185, count = 1}}},
        [30] = {items = {{itemid = 2160, count = 1}}},
        [35] = {items = {{itemid = 2181, count = 1}}},
        [40] = {items = {{itemid = 2160, count = 2}}},
        [50] = {items = {{itemid = 2160, count = 3}}},
        [75] = {items = {{itemid = 2160, count = 5}}},
        [100] = {items = {{itemid = 2160, count = 10}}}
    },

    paladin = {
        [15] = {
            items = {
                {itemid = 2456, count = 1},
                {itemid = 2544, count = 100}
            }
        },
        [25] = {
            items = {
                {itemid = 7364, count = 100}
            }
        },
        [30] = {
            items = {
                {itemid = 2160, count = 1},
                {itemid = 7364, count = 100}
            }
        },
        [35] = {
            items = {
                {itemid = 7378, count = 10}
            }
        },
        [40] = {items = {{itemid = 2160, count = 2}}},
        [50] = {items = {{itemid = 2160, count = 3}}},
        [75] = {items = {{itemid = 2160, count = 5}}},
        [100] = {items = {{itemid = 2160, count = 10}}}
    },

    knight = {
        [30] = {
            items = {
                {itemid = 2160, count = 1}
            },

            weapon = {
                [SKILL_AXE] = {itemid = 2430, count = 1},
                [SKILL_SWORD] = {itemid = 7408, count = 1},
                [SKILL_CLUB] = {itemid = 2434, count = 1}
            }
        },

        [40] = {items = {{itemid = 2160, count = 2}}},
        [50] = {items = {{itemid = 2160, count = 3}}},
        [75] = {items = {{itemid = 2160, count = 5}}},
        [100] = {items = {{itemid = 2160, count = 10}}}
    }
}

local rewardLevels = {15, 20, 25, 30, 35, 40, 50, 75, 100}

local function getRewardTable(cid)

    if isSorcerer(cid) then
        return rewards.sorcerer

    elseif isDruid(cid) then
        return rewards.druid

    elseif isPaladin(cid) then
        return rewards.paladin

    elseif isKnight(cid) then
        return rewards.knight
    end

    return nil
end

local function getBestKnightSkill(cid)

    local axe = getPlayerSkillLevel(cid, SKILL_AXE)
    local sword = getPlayerSkillLevel(cid, SKILL_SWORD)
    local club = getPlayerSkillLevel(cid, SKILL_CLUB)

    if axe >= sword and axe >= club then
        return SKILL_AXE
    elseif sword >= axe and sword >= club then
        return SKILL_SWORD
    end

    return SKILL_CLUB
end

function onAdvance(cid, skill, oldLevel, newLevel)

    if skill ~= SKILL__LEVEL then
        return true
    end

    local vocationRewards = getRewardTable(cid)

    if not vocationRewards then
        return true
    end

    local lastReward = getPlayerStorageValue(cid, 23457)

    if lastReward < 0 then
        lastReward = 0
    end

    local rewardText = {}

    for _, level in ipairs(rewardLevels) do

        if newLevel >= level and lastReward < level then

            local reward = vocationRewards[level]

            if reward then

                if reward.items then
                    for _, item in ipairs(reward.items) do
                        doPlayerAddItem(cid, item.itemid, item.count)
                        table.insert(rewardText, item.count .. " " .. getItemNameById(item.itemid))
                    end
                end

                if reward.weapon then

                    local skillType = getBestKnightSkill(cid)
                    local weapon = reward.weapon[skillType]

                    if weapon then
                        doPlayerAddItem(cid, weapon.itemid, weapon.count)
                        table.insert(rewardText, weapon.count .. " " .. getItemNameById(weapon.itemid))
                    end
                end

                lastReward = level
                setPlayerStorageValue(cid, 23457, level)

            end
        end
    end

    if #rewardText > 0 then

        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Congratulations! You have reached level " .. newLevel .. " and received: " .. table.concat(rewardText, ", ") .. ".")
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
    end

    return true
end