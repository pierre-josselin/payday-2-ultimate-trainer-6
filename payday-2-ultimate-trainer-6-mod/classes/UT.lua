UT = {}

UT.lastCallClock = 0
UT.environment = nil
UT.initialEnvironment = nil

function UT:requestCalls()
    local url = UT_SERVER_URL .. "/calls"
    local callback = function(data)
        if not data then
            return
        end
        local calls = UT.Utils:jsonDecode(data)
        if not calls or UT.Utils:isEmptyTable(calls) then
            return
        end
        for index, call in pairs(calls) do
            UT.Utils:callFunction(unpack(call))
        end
    end
    UT.Utils:httpRequest(url, callback)
    UT.lastCallClock = UT.Utils:getClock()
end

function UT:update()
    if UT.Utils:getClock() - UT.lastCallClock >= 1 / UT_CALLS_REQUESTS_PER_SECOND then
        UT:requestCalls()
    end

    if UT:isInGame() then
        if UT:isInHeist() then
            if UT.environment then
                if UT:getEnvironment() ~= UT.environment then
                    UT:setEnvironment(UT.environment)
                end
            end

            if not UT.initialEnvironment then
                UT.initialEnvironment = UT:getEnvironment()
            end
        end
    end
end

function UT:isInGame()
    return Utils:IsInGameState()
end

function UT:isInHeist()
    return Utils:IsInHeist()
end

function UT:refreshPlayerProfileGUI()
    if managers.menu_component then
        managers.menu_component:refresh_player_profile_gui()
    end
end

function UT:saveProgress()
    if managers.savefile then
        managers.savefile:save_progress()
    end
end

function UT:setLevel(level)
    local rank = managers.experience:current_rank()
    managers.experience:reset()
    managers.experience:_set_current_level(level)
    managers.experience:set_current_rank(rank)
end

function UT:setInfamyRank(infamyRank)
    managers.experience:set_current_rank(infamyRank)
end

function UT:addSpendingMoney(amount)
    managers.money:add_to_spending(amount)
end

function UT:addOffshoreMoney(amount)
    managers.money:add_to_offshore(amount)
end

function UT:resetMoney()
    managers.money:reset()
end

function UT:addContinentalCoins(amount)
    managers.custom_safehouse:add_coins(amount)
end

function UT:resetContinentalCoins()
    Global.custom_safehouse_manager.total = 0
    Global.custom_safehouse_manager.total_collected = 0
end

function UT:addPerkPoints(amount)
    managers.skilltree:give_specialization_points(amount * 1000)
end

function UT:resetPerkPoints()
    Global.skilltree_manager.specializations.total_points = 0
    managers.skilltree:reset_specializations()
end

function UT:getBlackMarketItem(blackMarketCategory, itemId)
    if not tweak_data.blackmarket[blackMarketCategory] then
        return
    end
    return tweak_data.blackmarket[blackMarketCategory][itemId]
end

function UT:getBlackMarketItemGlobalValue(item)
    local globalValue = "normal"
    if item.global_value then
        globalValue = item.global_value
    elseif item.infamous then
        globalValue = "infamous"
    elseif item.dlc then
        globalValue = item.dlc
    end
    return globalValue
end

function UT:addItemToBlackMarket(blackMarketCategory, itemId)
    local item = UT:getBlackMarketItem(blackMarketCategory, itemId)
    if not item then
        return
    end
    local globalValue = UT:getBlackMarketItemGlobalValue(item)
    managers.blackmarket:add_to_inventory(globalValue, blackMarketCategory, itemId, false)
end

function UT:removeItemFromBlackMarket(blackMarketCategory, itemId)
    local item = UT:getBlackMarketItem(blackMarketCategory, itemId)
    if not item then
        return
    end
    local globalValue = UT:getBlackMarketItemGlobalValue(item)
    if not Global.blackmarket_manager.inventory[globalValue]
        or not Global.blackmarket_manager.inventory[globalValue][blackMarketCategory] then
        return
    end
    Global.blackmarket_manager.inventory[globalValue][blackMarketCategory][itemId] = nil
end

function UT:setBlackMarketSlotsLock(value)
    for i = 1, 160 do
        Global.blackmarket_manager.unlocked_weapon_slots.primaries[i] = value
        Global.blackmarket_manager.unlocked_weapon_slots.secondaries[i] = value
        Global.blackmarket_manager.unlocked_mask_slots[i] = value
    end
end

function UT:removeBlackMarketExclamationMarks()
    Global.blackmarket_manager.new_drops = {}
end

function UT:getTrophy(trophyId)
    local trophies = Global.custom_safehouse_manager.trophies
    for index, trophy in pairs(trophies) do
        if trophy.id == trophyId then
            return trophy
        end
    end
end

function UT:unlockTrophy(trophyId)
    local trophy = UT:getTrophy(trophyId)
    if not trophy then
        return
    end
    trophy.completed = true
end

function UT:lockTrophy(trophyId)
    local trophy = UT:getTrophy(trophyId)
    if not trophy then
        return
    end
    trophy.completed = false
end

function UT:unlockSteamAchievement(achievementId)
    managers.achievment:award(achievementId)
end

function UT:lockSteamAchievement(achievementId)
    managers.achievment:clear_steam(achievementId)
end

function UT:getEnvironment()
    return managers.viewport:first_active_viewport():get_environment_path()
end

function UT:setEnvironment(environment)
    managers.viewport:first_active_viewport():set_environment(environment)
    UT.environment = environment
end

function UT:setInitialEnvironment()
    UT:setEnvironment(UT.initialEnvironment)
end
