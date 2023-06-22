UT = {}

UT.lastCallClock = 0
UT.environment = nil
UT.initialEnvironment = nil
UT.previousGameState = nil
UT.inHeistEventTriggered = false

UT.settings = {}
UT.tweakData = {}

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

function UT:requestSettings()
    local url = UT_SERVER_URL .. "/settings"
    local callback = function(data)
        if not data then
            return
        end
        local settings = UT.Utils:jsonDecode(data)
        if not settings then
            return
        end
        UT.settings = settings
    end
    UT.Utils:httpRequest(url, callback)
end

function UT:sendMessage(message)
    local queryString = UT.Utils:buildQueryString(message)
    local url = UT_SERVER_URL .. "/send-message?" .. queryString
    UT.Utils:httpRequest(url)
end

function UT:sendGameState()
    local gameState = UT:getGameState()
    if not gameState then
        return
    end
    local message = {
        type = "game-state",
        data = gameState
    }
    UT:sendMessage(message)
end

function UT:triggerInHeistEvent()
    UT.initialEnvironment = UT:getEnvironment()

    if UT.settings["enable-god-mode"] then
        UT:setGodMode(true)
    end
    if UT.settings["enable-infinite-stamina"] then
        UT:setInfiniteStamina(true)
    end
    if UT.settings["enable-can-run-directional"] then
        UT:setCanRunDirectional(true)
    end
    if UT.settings["enable-can-run-with-any-bag"] then
        UT:setCanRunDirectional(true)
    end
    if UT.settings["enable-instant-mask-on"] then
        UT:setInstantMaskOn(true)
    end
    if UT.settings["enable-no-carry-cooldown"] then
        UT:setNoCarryCooldown(true)
    end
    if UT.settings["enable-no-flashbangs"] then
        UT:setNoFlashbangs(true)
    end
    if UT.settings["enable-instant-interaction"] then
        UT:setInstantInteraction(true)
    end
    if UT.settings["enable-instant-deployment"] then
        UT:setInstantDeployment(true)
    end
    if UT.settings["enable-unlimited-equipment"] then
        UT:setUnlimitedEquipment(true)
    end
    if UT.settings["enable-instant-weapon-swap"] then
        UT:setInstantWeaponSwap(true)
    end
    if UT.settings["enable-instant-weapon-reload"] then
        UT:setInstantWeaponReload(true)
    end
    if UT.settings["enable-no-weapon-recoil"] then
        UT:setNoWeaponRecoil(true)
    end
    if UT.settings["enable-no-weapon-spread"] then
        UT:setNoWeaponSpread(true)
    end
    if UT.settings["enable-shoot-through-walls"] then
        UT:setShootThroughWalls(true)
    end
    if UT.settings["enable-unlimited-ammo"] then
        UT:setUnlimitedAmmo(true)
    end
    if UT.settings["enable-move-speed-multiplier"] and UT.settings["move-speed-multiplier"] then
        UT:setMoveSpeedMultiplier(true, UT.settings["move-speed-multiplier"])
    end
    if UT.settings["enable-throw-distance-multiplier"] and UT.settings["throw-distance-multiplier"] then
        UT:setThrowDistanceMultiplier(true, UT.settings["throw-distance-multiplier"])
    end
    if UT.settings["enable-fire-rate-multiplier"] and UT.settings["fire-rate-multiplier"] then
        UT:setFireRateMultiplier(true, UT.settings["fire-rate-multiplier"])
    end
    if UT.settings["enable-damage-multiplier"] and UT.settings["damage-multiplier"] then
        UT:setDamageMultiplier(true, UT.settings["damage-multiplier"])
    end

    UT.inHeistEventTriggered = true
end

function UT:update()
    local gameState = UT:getGameState()
    if gameState and gameState ~= UT.previousGameState then
        UT:sendGameState()
    end
    UT.previousGameState = gameState

    if UT.Utils:getClock() - UT.lastCallClock >= 1 / UT_CALLS_REQUESTS_PER_SECOND then
        UT:requestCalls()
    end

    if UT:isInGame() then
        if UT:isInHeist() then
            if not UT.inHeistEventTriggered then
                UT:triggerInHeistEvent()
            end

            if UT.environment then
                if UT:getEnvironment() ~= UT.environment then
                    UT:setEnvironment(UT.environment)
                end
            end
        end
    end
end

function UT:getGameState()
    if not game_state_machine then
        return
    end
    return game_state_machine:current_state_name()
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

function UT:setGodMode(enabled)
    managers.player:player_unit():character_damage():set_god_mode(enabled)
end

function UT:setInfiniteStamina(enabled)
    UT.Utils:cloneClass(PlayerMovement)
    if enabled then
        function PlayerMovement:_change_stamina() end

        function PlayerMovement:is_stamina_drained() return false end
    else
        PlayerMovement._change_stamina = PlayerMovement.orig._change_stamina
        PlayerMovement.is_stamina_drained = PlayerMovement.orig.is_stamina_drained
    end
end

function UT:setCanRunDirectional(enabled)
    UT.Utils:cloneClass(PlayerStandard)
    if enabled then
        function PlayerStandard:_can_run_directional() return true end
    else
        PlayerStandard._can_run_directional = PlayerStandard.orig._can_run_directional
    end
end

function UT:setCanRunWithAnyBag(enabled)
    UT.tweakData.carryTypes = UT.tweakData.carryTypes or UT.Utils:deepClone(tweak_data.carry.types)
    if enabled then
        for type, data in pairs(tweak_data.carry.types) do
            tweak_data.carry.types[type].can_run = true
        end
    else
        for type, data in pairs(UT.tweakData.carryTypes) do
            tweak_data.carry.types[type].can_run = data.can_run
        end
    end
end

function UT:setInstantMaskOn(enabled)
    UT.tweakData.playerPutOnMaskTime = UT.tweakData.playerPutOnMaskTime or tweak_data.player.put_on_mask_time
    if enabled then
        tweak_data.player.put_on_mask_time = 0.01
    else
        tweak_data.player.put_on_mask_time = UT.tweakData.playerPutOnMaskTime
    end
end

function UT:setNoCarryCooldown(enabled)
    UT.Utils:cloneClass(PlayerManager)
    if enabled then
        function PlayerManager:carry_blocked_by_cooldown() return false end
    else
        PlayerManager.carry_blocked_by_cooldown = PlayerManager.orig.carry_blocked_by_cooldown
    end
end

function UT:setNoFlashbangs(enabled)
    UT.Utils:cloneClass(CoreEnvironmentControllerManager)
    if enabled then
        function CoreEnvironmentControllerManager:set_flashbang() end
    else
        CoreEnvironmentControllerManager.set_flashbang = CoreEnvironmentControllerManager.orig.set_flashbang
    end
end

function UT:setInstantWeaponSwap(enabled)
    UT.Utils:cloneClass(PlayerStandard)
    if enabled then
        function PlayerStandard:_get_swap_speed_multiplier() return 1000 end
    else
        PlayerStandard._get_swap_speed_multiplier = PlayerStandard.orig._get_swap_speed_multiplier
    end
end

function UT:setInstantWeaponReload(enabled)
    UT.Utils:cloneClass(RaycastWeaponBase)
    if enabled then
        function RaycastWeaponBase:can_reload()
            self:on_reload()
            managers.hud:set_ammo_amount(self:selection_index(), self:ammo_info())
            return false
        end
    else
        RaycastWeaponBase.can_reload = RaycastWeaponBase.orig.can_reload
    end
end

function UT:setNoWeaponRecoil(enabled)
    UT.Utils:cloneClass(NewRaycastWeaponBase)
    if enabled then
        function NewRaycastWeaponBase:recoil_multiplier() return 0 end
    else
        NewRaycastWeaponBase.recoil_multiplier = NewRaycastWeaponBase.orig.recoil_multiplier
    end
end

function UT:setNoWeaponSpread(enabled)
    UT.Utils:cloneClass(NewRaycastWeaponBase)
    if enabled then
        function NewRaycastWeaponBase:spread_multiplier() return 0 end
    else
        NewRaycastWeaponBase.spread_multiplier = NewRaycastWeaponBase.orig.spread_multiplier
    end
end

function UT:setShootThroughWalls(enabled)
    UT.Utils:cloneClass(RaycastWeaponBase)
    UT.Utils:cloneClass(NewRaycastWeaponBase)

    local player = managers.player:player_unit()

    if enabled then
        if not player or not alive(player) then
            return
        end

        RaycastWeaponBase._can_shoot_through_shield = true
        RaycastWeaponBase._can_shoot_through_wall = true
        NewRaycastWeaponBase._can_shoot_through_shield = true
        NewRaycastWeaponBase._can_shoot_through_wall = true
    else
        RaycastWeaponBase._can_shoot_through_shield = RaycastWeaponBase.orig._can_shoot_through_shield
        RaycastWeaponBase._can_shoot_through_wall = RaycastWeaponBase.orig._can_shoot_through_wall
        NewRaycastWeaponBase._can_shoot_through_shield = NewRaycastWeaponBase.orig._can_shoot_through_shield
        NewRaycastWeaponBase._can_shoot_through_wall = NewRaycastWeaponBase.orig._can_shoot_through_wall
    end

    for _, selection in pairs(player:inventory()._available_selections) do
        local unitBase = selection.unit:base()
        if enabled then
            unitBase._bullet_slotmask_old = unitBase._bullet_slotmask
            unitBase._bullet_slotmask = World:make_slot_mask(7, 11, 12, 14, 16, 17, 18, 21, 22, 25, 26, 33, 34, 35)
        else
            if unitBase._bullet_slotmask_old then
                unitBase._bullet_slotmask = unitBase._bullet_slotmask_old
                unitBase._bullet_slotmask_old = nil
            end
        end
    end
end

function UT:setUnlimitedAmmo(enabled)
    UT.Utils:cloneClass(RaycastWeaponBase)
    UT.Utils:cloneClass(SawWeaponBase)
    if enabled then
        function RaycastWeaponBase:clip_empty()
            self:set_ammo_total(self:get_ammo_max())
            return self:get_ammo_remaining_in_clip() == 0
        end

        function SawWeaponBase:clip_empty()
            self:set_ammo_total(self:get_ammo_max())
            return self:get_ammo_remaining_in_clip() == 0
        end
    else
        RaycastWeaponBase.clip_empty = RaycastWeaponBase.orig.clip_empty
        SawWeaponBase.clip_empty = SawWeaponBase.orig.clip_empty
    end
end

function UT:setInstantInteraction(enabled)
    UT.Utils:cloneClass(BaseInteractionExt)
    if enabled then
        function BaseInteractionExt:_get_timer() return 0.001 end
    else
        BaseInteractionExt._get_timer = BaseInteractionExt.orig._get_timer
    end
end

function UT:setInstantDeployment(enabled)
    UT.Utils:cloneClass(PlayerManager)
    if enabled then
        function PlayerManager:selected_equipment_deploy_timer() return 0.001 end
    else
        PlayerManager.selected_equipment_deploy_timer = PlayerManager.orig.selected_equipment_deploy_timer
    end
end

function UT:setUnlimitedEquipment(enabled)
    UT.Utils:cloneClass(BaseInteractionExt)
    UT.Utils:cloneClass(PlayerManager)
    if enabled then
        function BaseInteractionExt:_has_required_upgrade() return true end

        function BaseInteractionExt:_has_required_deployable() return true end

        function BaseInteractionExt:can_interact() return true end

        function PlayerManager:on_used_body_bag() end

        function PlayerManager:remove_equipment() end

        function PlayerManager:remove_special() end
    else
        BaseInteractionExt._has_required_upgrade = BaseInteractionExt.orig._has_required_upgrade
        BaseInteractionExt._has_required_deployable = BaseInteractionExt.orig._has_required_deployable
        BaseInteractionExt.can_interact = BaseInteractionExt.orig.can_interact
        PlayerManager.on_used_body_bag = PlayerManager.orig.on_used_body_bag
        PlayerManager.remove_equipment = PlayerManager.orig.remove_equipment
        PlayerManager.remove_special = PlayerManager.orig.remove_special
    end
end

function UT:setMoveSpeedMultiplier(enabled, multiplier)
    UT.Utils:cloneClass(PlayerManager)
    if enabled then
        function PlayerManager:movement_speed_multiplier() return multiplier end
    else
        PlayerManager.movement_speed_multiplier = PlayerManager.orig.movement_speed_multiplier
    end
end

function UT:setThrowDistanceMultiplier(enabled, multiplier)
    UT.tweakData.carryTypes = UT.tweakData.carryTypes or UT.Utils:deepClone(tweak_data.carry.types)
    if enabled then
        for type, data in pairs(tweak_data.carry.types) do
            tweak_data.carry.types[type].throw_distance_multiplier = multiplier
        end
    else
        for type, data in pairs(UT.tweakData.carryTypes) do
            tweak_data.carry.types[type].throw_distance_multiplier = data.throw_distance_multiplier
        end
    end
end

function UT:setFireRateMultiplier(enabled, multiplier)
    UT.Utils:cloneClass(NewRaycastWeaponBase)
    if enabled then
        function NewRaycastWeaponBase:fire_rate_multiplier() return multiplier end
    else
        NewRaycastWeaponBase.fire_rate_multiplier = NewRaycastWeaponBase.orig.fire_rate_multiplier
    end
end

function UT:setDamageMultiplier(enabled, multiplier)
    UT.Utils:cloneClass(CopDamage)
    if enabled then
        function CopDamage:damage_bullet(attack_data)
            if attack_data.attacker_unit == managers.player:player_unit() then
                attack_data.damage = multiplier * 10
            end
            return self.orig.damage_bullet(self, attack_data)
        end

        function CopDamage:damage_melee(attack_data)
            if attack_data.attacker_unit == managers.player:player_unit() then
                attack_data.damage = multiplier * 10
            end
            return self.orig.damage_melee(self, attack_data)
        end
    else
        CopDamage.damage_bullet = CopDamage.orig.damage_bullet
        CopDamage.damage_melee = CopDamage.orig.damage_melee
    end
end
