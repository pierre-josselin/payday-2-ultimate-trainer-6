UT = {}

function UT:requestCalls()
    local url = UT_SERVER_URL .. "/calls"
    local callback = function(data)
        if not data then
            return
        end
        calls = UT.Utils:jsonDecode(data)
        if not calls or UT.Utils:isEmptyTable(calls) then
            return
        end
        for key, call in pairs(calls) do
            UT.Utils:callFunction(unpack(call))
        end
    end
    UT.Utils:httpRequest(url, callback)
end

function UT.update()
    UT:requestCalls()
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
    UT:refreshPlayerProfileGUI()
    UT:saveProgress()
end

function UT:setInfamyRank(infamyRank)
    managers.experience:set_current_rank(infamyRank)
    UT:refreshPlayerProfileGUI()
    UT:saveProgress()
end

function UT:addSpendingMoney(amount)
    managers.money:add_to_spending(amount)
    UT:refreshPlayerProfileGUI()
    UT:saveProgress()
end

function UT:addOffshoreMoney(amount)
    managers.money:add_to_offshore(amount)
    UT:refreshPlayerProfileGUI()
    UT:saveProgress()
end

function UT:resetMoney()
    managers.money:reset()
    UT:refreshPlayerProfileGUI()
    UT:saveProgress()
end

function UT:addContinentalCoins(amount)
    managers.custom_safehouse:add_coins(amount)
    UT:refreshPlayerProfileGUI()
    UT:saveProgress()
end

function UT:resetContinentalCoins()
    Global.custom_safehouse_manager.total = 0
    Global.custom_safehouse_manager.total_collected = 0
    UT:refreshPlayerProfileGUI()
    UT:saveProgress()
end

function UT:addPerkPoints(amount)
    managers.skilltree:give_specialization_points(amount)
    UT:refreshPlayerProfileGUI()
    UT:saveProgress()
end

function UT:resetPerkPoints()
    Global.skilltree_manager.specializations.total_points = 0
    managers.skilltree:reset_specializations()
    UT:refreshPlayerProfileGUI()
    UT:saveProgress()
end
