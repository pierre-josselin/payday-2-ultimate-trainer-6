UT = {}

UT.maxInteger = math.huge

UT.modPath = nil
UT.lastCallClock = 0
UT.previousGameState = nil
UT.previousIsHost = nil
UT.vehiclesPackagesLoaded = false
UT.environment = nil
UT.initialEnvironment = nil
UT.enableNoClip = false
UT.noClipSpeed = nil

UT.settings = {}
UT.backup = {}
UT.spawnedVehicleUnits = {}

UT.invisibleWalls = {}
UT.interactions = {}

function UT:init()
    UT:requestSettings()

    local content = UT.Utility:readFile(UT.modPath .. "/payday-2-ultimate-trainer-6-mod/data/invisible-walls.json")
    if content then
        UT.invisibleWalls = UT.Utility:jsonDecode(content)
    end

    local content = UT.Utility:readFile(UT.modPath .. "/payday-2-ultimate-trainer-6-mod/data/interactions.json")
    if content then
        UT.interactions = UT.Utility:jsonDecode(content)
    end
end

function UT:update()
    local gameState = UT.GameUtility:getGameState()
    if gameState and gameState ~= UT.previousGameState and gameState ~= "empty" then
        UT:sendGameState()
    end
    UT.previousGameState = gameState

    local isHost = UT.GameUtility:isHost()
    if UT.previousIsHost == nil or isHost ~= UT.previousIsHost then
        UT:sendIsHost()
    end
    UT.previousIsHost = isHost

    if UT.Utility:getClock() - UT.lastCallClock >= 1 / UT_CALLS_REQUESTS_PER_SECOND then
        UT:requestCalls()
    end

    if UT.GameUtility:isInGame() then
        if UT.GameUtility:isInHeist() then
            if UT.GameUtility:isPlayerUnitAlive() then
                if UT.enableNoClip then
                    UT:updateNoClip(UT.noClipSpeed)
                end
            end

            if UT.environment then
                if UT:getEnvironment() ~= UT.environment then
                    UT:setEnvironment(UT.environment)
                end
            end

            if UT.enableDisableAi then
                UT:disableAI()
            end
        end
    end
end

function UT:loadPackages()
    local packages = {}

    table.insert(packages, "levels/instances/unique/hox_fbi_armory/world")
    table.insert(packages, "levels/instances/unique/hlm_reader/world")
    table.insert(packages, "levels/instances/unique/mus_security_barrier/world")
    table.insert(packages, "levels/instances/unique/hlm_box_contraband001/world")
    table.insert(packages, "levels/instances/unique/pbr/pbr_plane/world")
    table.insert(packages, "levels/instances/unique/hlm_random_right003/world")
    table.insert(packages, "levels/instances/unique/hlm_door_wooden_white_green/world")
    table.insert(packages, "levels/instances/unique/hlm_vault/world")
    table.insert(packages, "levels/instances/unique/san_box001/world")

    if UT:getSetting("enable-vehicles-packages-loading") then
        table.insert(packages, "levels/narratives/bain/cage/world/world")
        table.insert(packages, "levels/narratives/vlad/shout/world/world")
        table.insert(packages, "levels/narratives/vlad/jolly/world/world")
        table.insert(packages, "levels/narratives/pbr/jerry/world/world")
        table.insert(packages, "levels/narratives/elephant/born/world/world")
    end

    for index, value in pairs(packages) do
        if not PackageManager:package_exists(value) then
            goto continue
        end
        if PackageManager:loaded(value) then
            goto continue
        end
        PackageManager:load(value)
        ::continue::
    end

    if UT:getSetting("enable-vehicles-packages-loading") then
        UT.vehiclesPackagesLoaded = true
    end
end

function UT:runServer()
    os.execute("start /B node \"" .. UT.modPath:gsub("/", "\\") .. "\\index.js\" run")
end

function UT:requestCalls()
    local url = UT_SERVER_URL .. "/calls"
    local callback = function(data)
        if not data then
            return
        end
        local calls = UT.Utility:jsonDecode(data)
        if not calls or UT.Utility:isEmptyTable(calls) then
            return
        end
        for index, call in pairs(calls) do
            UT.Utility:callFunction(unpack(call))
        end
    end
    UT.Utility:httpRequest(url, callback)
    UT.lastCallClock = UT.Utility:getClock()
end

function UT:requestSettings()
    local url = UT_SERVER_URL .. "/settings"
    local callback = function(data)
        if not data then
            return
        end
        local settings = UT.Utility:jsonDecode(data)
        if not settings then
            return
        end
        UT.settings = settings
    end
    UT.Utility:httpRequest(url, callback)
end

function UT:getSetting(name)
    return UT.settings[name]
end

function UT:sendMessage(message)
    local queryString = UT.Utility:buildQueryString(message)
    local url = UT_SERVER_URL .. "/send-message?" .. queryString
    UT.Utility:httpRequest(url)
end

function UT:sendGameState()
    local message = {
        type = "game-state",
        data = UT.GameUtility:getGameState()
    }
    UT:sendMessage(message)
end

function UT:sendIsHost()
    local message = {
        type = "is-host",
        data = UT.GameUtility:isHost()
    }
    UT:sendMessage(message)
end

function UT:sendVehiclesPackagesLoaded()
    local message = {
        type = "vehicles-packages-loaded",
        data = UT.vehiclesPackagesLoaded
    }
    UT:sendMessage(message)
end

function UT:enterGame()
    UT:sendVehiclesPackagesLoaded()
end

function UT:enterHeist()
    UT.initialEnvironment = UT:getEnvironment()

    if UT:getSetting("enable-god-mode") then
        UT:setGodMode(true)
    else
        if UT.GameUtility:playerUnit():character_damage():god_mode() then
            UT:setGodMode(false)
        end
    end
    if UT:getSetting("enable-no-fall-damage") then
        UT:setNoFallDamage(true)
    end
    if UT:getSetting("enable-infinite-stamina") then
        UT:setInfiniteStamina(true)
    end
    if UT:getSetting("enable-can-run-directional") then
        UT:setCanRunDirectional(true)
    end
    if UT:getSetting("enable-can-run-with-any-bag") then
        UT:setCanRunDirectional(true)
    end
    if UT:getSetting("enable-instant-mask-on") then
        UT:setInstantMaskOn(true)
    end
    if UT:getSetting("enable-no-carry-cooldown") then
        UT:setNoCarryCooldown(true)
    end
    if UT:getSetting("enable-no-flashbangs") then
        UT:setNoFlashbangs(true)
    end
    if UT:getSetting("enable-instant-interaction") then
        UT:setInstantInteraction(true)
    end
    if UT:getSetting("enable-instant-deployment") then
        UT:setInstantDeployment(true)
    end
    if UT:getSetting("enable-unlimited-equipment") then
        UT:setUnlimitedEquipment(true)
    end
    if UT:getSetting("enable-instant-weapon-swap") then
        UT:setInstantWeaponSwap(true)
    end
    if UT:getSetting("enable-instant-weapon-reload") then
        UT:setInstantWeaponReload(true)
    end
    if UT:getSetting("enable-no-weapon-recoil") then
        UT:setNoWeaponRecoil(true)
    end
    if UT:getSetting("enable-no-weapon-spread") then
        UT:setNoWeaponSpread(true)
    end
    if UT:getSetting("enable-shoot-through-walls") then
        UT:setShootThroughWalls(true)
    end
    if UT:getSetting("enable-unlimited-ammo") then
        UT:setUnlimitedAmmo(true)
    end
    if UT:getSetting("enable-move-speed-multiplier") and UT:getSetting("move-speed-multiplier") then
        UT:setMoveSpeedMultiplier(true, UT:getSetting("move-speed-multiplier"))
    end
    if UT:getSetting("enable-throw-distance-multiplier") and UT:getSetting("throw-distance-multiplier") then
        UT:setThrowDistanceMultiplier(true, UT:getSetting("throw-distance-multiplier"))
    end
    if UT:getSetting("enable-fire-rate-multiplier") and UT:getSetting("fire-rate-multiplier") then
        UT:setFireRateMultiplier(true, UT:getSetting("fire-rate-multiplier"))
    end
    if UT:getSetting("enable-damage-multiplier") and UT:getSetting("damage-multiplier") then
        UT:setDamageMultiplier(true, UT:getSetting("damage-multiplier"))
    end
end

function UT:setUnlimitedConversion(enabled)
    UT.Utility:cloneClass(PlayerManager)
    if enabled then
        function PlayerManager:upgrade_value(category, upgrade, default)
            if category == "player" and upgrade == "convert_enemies" then
                return true
            elseif category == "player" and upgrade == "convert_enemies_max_minions" then
                return UT.maxInteger
            else
                return PlayerManager.orig.upgrade_value(self, category, upgrade, default)
            end
        end
    else
        PlayerManager.upgrade_value = PlayerManager.orig.upgrade_value
    end
end

function UT:setUnlimitedGagePackages(enabled)
    UT.Utility:cloneClass(GageAssignmentTweakData)
    if enabled then
        function GageAssignmentTweakData:get_num_assignment_units()
            return UT.maxInteger
        end
    else
        GageAssignmentTweakData.get_num_assignment_units = GageAssignmentTweakData.orig.get_num_assignment_units
    end
end

function UT:disableSentryGunPickup()
    UT.Utility:cloneClass(SentryGunBase)
    function SentryGunBase.on_picked_up() end
end

-- Career

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

-- Environment

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

-- Cheats

function UT:setGodMode(enabled)
    UT.GameUtility:playerUnit():character_damage():set_god_mode(enabled)
end

function UT:setNoFallDamage(enabled)
    UT.Utility:cloneClass(PlayerDamage)
    if enabled or UT.enableNoClip then
        function PlayerDamage:damage_fall() end
    else
        PlayerDamage.damage_fall = PlayerDamage.orig.damage_fall
    end
end

function UT:setInfiniteStamina(enabled)
    UT.Utility:cloneClass(PlayerMovement)
    if enabled then
        function PlayerMovement:_change_stamina() end

        function PlayerMovement:is_stamina_drained() return false end
    else
        PlayerMovement._change_stamina = PlayerMovement.orig._change_stamina
        PlayerMovement.is_stamina_drained = PlayerMovement.orig.is_stamina_drained
    end
end

function UT:setCanRunDirectional(enabled)
    UT.Utility:cloneClass(PlayerStandard)
    if enabled then
        function PlayerStandard:_can_run_directional() return true end
    else
        PlayerStandard._can_run_directional = PlayerStandard.orig._can_run_directional
    end
end

function UT:setCanRunWithAnyBag(enabled)
    UT.backup.tweakDataCarryTypes = UT.backup.tweakDataCarryTypes or UT.Utility:deepClone(tweak_data.carry.types)
    if enabled then
        for type, data in pairs(tweak_data.carry.types) do
            tweak_data.carry.types[type].can_run = true
        end
    else
        for type, data in pairs(UT.backup.tweakDataCarryTypes) do
            tweak_data.carry.types[type].can_run = data.can_run
        end
    end
end

function UT:setInstantMaskOn(enabled)
    UT.backup.tweakDataPlayerPutOnMaskTime = UT.backup.tweakDataPlayerPutOnMaskTime or tweak_data.player.put_on_mask_time
    if enabled then
        tweak_data.player.put_on_mask_time = 0.01
    else
        tweak_data.player.put_on_mask_time = UT.tweakData.playerPutOnMaskTime
    end
end

function UT:setNoCarryCooldown(enabled)
    UT.Utility:cloneClass(PlayerManager)
    if enabled then
        function PlayerManager:carry_blocked_by_cooldown() return false end
    else
        PlayerManager.carry_blocked_by_cooldown = PlayerManager.orig.carry_blocked_by_cooldown
    end
end

function UT:setNoFlashbangs(enabled)
    UT.Utility:cloneClass(CoreEnvironmentControllerManager)
    if enabled then
        function CoreEnvironmentControllerManager:set_flashbang() end
    else
        CoreEnvironmentControllerManager.set_flashbang = CoreEnvironmentControllerManager.orig.set_flashbang
    end
end

function UT:setInstantInteraction(enabled)
    UT.Utility:cloneClass(BaseInteractionExt)
    if enabled then
        function BaseInteractionExt:_get_timer() return 0.001 end
    else
        BaseInteractionExt._get_timer = BaseInteractionExt.orig._get_timer
    end
end

function UT:setInstantDeployment(enabled)
    UT.Utility:cloneClass(PlayerManager)
    if enabled then
        function PlayerManager:selected_equipment_deploy_timer() return 0.001 end
    else
        PlayerManager.selected_equipment_deploy_timer = PlayerManager.orig.selected_equipment_deploy_timer
    end
end

function UT:setUnlimitedEquipment(enabled)
    UT.Utility:cloneClass(BaseInteractionExt)
    UT.Utility:cloneClass(PlayerManager)
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

function UT:setInstantWeaponSwap(enabled)
    UT.Utility:cloneClass(PlayerStandard)
    if enabled then
        function PlayerStandard:_get_swap_speed_multiplier() return 1000 end
    else
        PlayerStandard._get_swap_speed_multiplier = PlayerStandard.orig._get_swap_speed_multiplier
    end
end

function UT:setInstantWeaponReload(enabled)
    UT.Utility:cloneClass(RaycastWeaponBase)
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
    UT.Utility:cloneClass(NewRaycastWeaponBase)
    if enabled then
        function NewRaycastWeaponBase:recoil_multiplier() return 0 end
    else
        NewRaycastWeaponBase.recoil_multiplier = NewRaycastWeaponBase.orig.recoil_multiplier
    end
end

function UT:setNoWeaponSpread(enabled)
    UT.Utility:cloneClass(NewRaycastWeaponBase)
    if enabled then
        function NewRaycastWeaponBase:spread_multiplier() return 0 end
    else
        NewRaycastWeaponBase.spread_multiplier = NewRaycastWeaponBase.orig.spread_multiplier
    end
end

function UT:setShootThroughWalls(enabled)
    UT.Utility:cloneClass(RaycastWeaponBase)
    UT.Utility:cloneClass(NewRaycastWeaponBase)

    if enabled then
        if not UT.GameUtility:playerUnit() or not UT.GameUtility:isPlayerUnitAlive() then
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

    for _, selection in pairs(UT.GameUtility:playerUnit():inventory()._available_selections) do
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
    UT.Utility:cloneClass(RaycastWeaponBase)
    UT.Utility:cloneClass(SawWeaponBase)
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

function UT:setMoveSpeedMultiplier(enabled, multiplier)
    UT.Utility:cloneClass(PlayerManager)
    if enabled then
        function PlayerManager:movement_speed_multiplier() return multiplier end
    else
        PlayerManager.movement_speed_multiplier = PlayerManager.orig.movement_speed_multiplier
    end
end

function UT:setThrowDistanceMultiplier(enabled, multiplier)
    UT.backup.tweakDataCarryTypes = UT.backup.tweakDataCarryTypes or UT.Utility:deepClone(tweak_data.carry.types)
    if enabled then
        for type, data in pairs(tweak_data.carry.types) do
            tweak_data.carry.types[type].throw_distance_multiplier = multiplier
        end
    else
        for type, data in pairs(UT.backup.tweakDataCarryTypes) do
            tweak_data.carry.types[type].throw_distance_multiplier = data.throw_distance_multiplier
        end
    end
end

function UT:setFireRateMultiplier(enabled, multiplier)
    UT.Utility:cloneClass(NewRaycastWeaponBase)
    if enabled then
        function NewRaycastWeaponBase:fire_rate_multiplier() return multiplier end
    else
        NewRaycastWeaponBase.fire_rate_multiplier = NewRaycastWeaponBase.orig.fire_rate_multiplier
    end
end

function UT:setDamageMultiplier(enabled, multiplier)
    UT.Utility:cloneClass(CopDamage)
    if enabled then
        function CopDamage:damage_bullet(attack_data)
            if attack_data.attacker_unit == UT.GameUtility:playerUnit() then
                attack_data.damage = multiplier * 10
            end
            return self.orig.damage_bullet(self, attack_data)
        end

        function CopDamage:damage_melee(attack_data)
            if attack_data.attacker_unit == UT.GameUtility:playerUnit() then
                attack_data.damage = multiplier * 10
            end
            return self.orig.damage_melee(self, attack_data)
        end
    else
        CopDamage.damage_bullet = CopDamage.orig.damage_bullet
        CopDamage.damage_melee = CopDamage.orig.damage_melee
    end
end

-- Mission

function UT:startTheHeist()
    managers.network:session():spawn_players()
end

function UT:restartTheHeist()
    managers.game_play_central:restart_the_game()
end

function UT:finishTheHeist()
    local amountOfAlivePlayers = managers.network:session():amount_of_alive_players()
    managers.network:session():send_to_peers("mission_ended", true, amountOfAlivePlayers)
    game_state_machine:change_state_by_name("victoryscreen", {
        num_winners = amountOfAlivePlayers,
        personal_win = UT.GameUtility:isPlayerUnitAlive()
    })
end

function UT:leaveTheHeist()
    MenuCallbackHandler:_dialog_end_game_yes()
end

function UT:accessCameras()
    game_state_machine:change_state_by_name("ingame_access_camera")
end

function UT:triggerTheAlarm()
    managers.groupai:state():on_police_called("empty")
end

function UT:removeInvisibleWalls()
    local units = World:find_units_quick("all", 1)
    for index, unit in pairs(units) do
        if UT.Utility:inTable(unit:name():key(), UT.invisibleWalls) then
            UT.GameUtility:deleteUnit(unit)
        end
    end
end

function UT:killAllEnemies()
    for key, data in pairs(managers.enemy:all_enemies()) do
        UT.GameUtility:killUnit(data.unit)
    end
end

function UT:killAllCivilians()
    for key, data in pairs(managers.enemy:all_civilians()) do
        UT.GameUtility:killUnit(data.unit)
    end
end

function UT:tieAllCivilians()
    for key, data in pairs(managers.enemy:all_civilians()) do
        local brain = data.unit:brain()

        if brain:is_tied() then
            goto continue
        end

        brain:action_request({
            clamp_to_graph = true,
            variant = "halt",
            body_part = 1,
            type = "act"
        })
        brain._current_logic.on_intimidated(brain._logic_data, UT.maxInteger, UT.GameUtility:playerUnit(), true)
        brain:on_tied(UT.GameUtility:playerUnit())

        ::continue::
    end
end

function UT:convertAllEnemies()
    UT:setUnlimitedConversion(true)

    for key, data in pairs(managers.enemy:all_enemies()) do
        if not UT.GameUtility:isUnitAlive(data.unit) then
            goto continue
        end

        managers.groupai:state():convert_hostage_to_criminal(data.unit)
        managers.groupai:state():sync_converted_enemy(data.unit)
        ::continue::
    end

    UT:setUnlimitedConversion(false)
end

function UT:setXRay(enabled)
    if enabled then
        UT.Utility:cloneClass(EnemyManager)

        for key, data in pairs(managers.enemy:all_civilians()) do
            data.unit:contour():add("mark_enemy", false, UT.maxInteger)
        end

        for key, data in pairs(managers.enemy:all_enemies()) do
            data.unit:contour():add("mark_enemy", false, UT.maxInteger)
        end

        for key, unit in pairs(SecurityCamera.cameras) do
            unit:contour():add("mark_unit", false, UT.maxInteger)
        end

        function EnemyManager:register_civilian(unit, ...)
            EnemyManager.orig.register_civilian(self, unit, ...)
            unit:contour():add("mark_enemy", false, UT.maxInteger)
        end

        function EnemyManager:register_enemy(unit, ...)
            EnemyManager.orig.register_enemy(self, unit, ...)
            unit:contour():add("mark_enemy", false, UT.maxInteger)
        end

        function EnemyManager:on_civilian_died(unit, ...)
            EnemyManager.orig.on_civilian_died(self, unit, ...)
            unit:contour():remove("mark_enemy", false)
        end

        function EnemyManager:on_enemy_died(unit, ...)
            EnemyManager.orig.on_enemy_died(self, unit, ...)
            unit:contour():remove("mark_enemy", false)
        end
    else
        for key, data in pairs(managers.enemy:all_civilians()) do
            data.unit:contour():remove("mark_enemy", false)
        end

        for key, data in pairs(managers.enemy:all_enemies()) do
            data.unit:contour():remove("mark_enemy", false)
        end

        for key, unit in pairs(SecurityCamera.cameras) do
            unit:contour():remove("mark_unit", false)
        end

        EnemyManager.register_enemy = EnemyManager.orig.register_enemy
        EnemyManager.register_civilian = EnemyManager.orig.register_civilian
        EnemyManager.on_enemy_died = EnemyManager.orig.on_enemy_died
        EnemyManager.on_civilian_died = EnemyManager.orig.on_civilian_died
    end
end

function UT:setPreventAlarmTriggering(enabled)
    UT.Utility:cloneClass(GroupAIStateBase)
    if enabled then
        function GroupAIStateBase:on_police_called() end
    else
        GroupAIStateBase.on_police_called = GroupAIStateBase.orig.on_police_called
    end
end

function UT:setNoClip(enabled, speed)
    UT.noClipSpeed = speed
    UT.enableNoClip = enabled
    UT:setNoFallDamage(enabled or UT:getSetting("enable-no-fall-damage"))
end

function UT:updateNoClip(speed)
    local keyboard = Input:keyboard()
    local speed = keyboard.down(keyboard, UT.GameUtility:idString("left shift")) and speed * 2 or speed
    local x = keyboard.down(keyboard, UT.GameUtility:idString("w")) and 1 or keyboard.down(keyboard, UT.GameUtility:idString("s")) and -1 or 0
    local y = keyboard.down(keyboard, UT.GameUtility:idString("d")) and 1 or keyboard.down(keyboard, UT.GameUtility:idString("a")) and -1 or 0
    local z = keyboard.down(keyboard, UT.GameUtility:idString("space")) and 1 or keyboard.down(keyboard, UT.GameUtility:idString("left ctrl")) and -1 or 0
    local rotation = UT.GameUtility:getPlayerCameraRotation()
    local direction = rotation:x() * y + rotation:y() * x
    local delta = Vector3(direction.x, direction.y, z) * speed
    local position = UT.GameUtility:getPlayerPosition() + delta
    UT.GameUtility:teleportPlayer(position, rotation)
end

function UT:setInvisiblePlayer(enabled)
    if not UT.GameUtility:isPlayerUnitAlive() then
        return
    end

    local playerUnitKey = UT.GameUtility:playerUnit():key()
    local groupAIState = managers.groupai:state()

    if enabled then
        UT.backup.playerAttentionObject = groupAIState._attention_objects.all[playerUnitKey]
        groupAIState:unregister_AI_attention_object(playerUnitKey)
    else
        groupAIState._attention_objects.all[playerUnitKey] = UT.backup.playerAttentionObject
        groupAIState:on_AI_attention_changed(playerUnitKey)
    end
end

function UT:setDisableAI(enabled)
    UT.enableDisableAi = enabled
    if not enabled then
        for key, value in pairs(managers.enemy:all_civilians()) do
            value.unit:brain():set_active(true)
        end

        for key, value in pairs(managers.enemy:all_enemies()) do
            value.unit:brain():set_active(true)
        end

        for key, unit in pairs(SecurityCamera.cameras) do
            unit:base()._detection_interval = 0.1
        end

        if managers.groupai:state():turrets() then
            for key, unit in pairs(managers.groupai:state():turrets()) do
                unit:brain():set_active(true)
            end
        end
    end
end

function UT:disableAI()
    for key, data in pairs(managers.enemy:all_civilians()) do
        if data.unit:brain():is_active() then
            data.unit:brain():set_active(false)
        end
    end

    for key, data in pairs(managers.enemy:all_enemies()) do
        if data.unit:brain():is_active() then
            data.unit:brain():set_active(false)
        end
    end

    for key, unit in pairs(SecurityCamera.cameras) do
        if unit:base()._detection_interval ~= UT.maxInteger then
            unit:base()._detection_interval = UT.maxInteger
        end
    end

    if managers.groupai:state():turrets() then
        for key, unit in pairs(managers.groupai:state():turrets()) do
            if unit:brain():is_active() then
                unit:brain():set_active(false)
            end
        end
    end
end

function UT:setUnlimitedPagers(enabled)
    tweak_data.player.alarm_pager.bluff_success_chance = { 1, 1, 1, 1, enabled and 1 or 0 }
end

function UT:setInstantDrilling(enabled)
    UT.Utility:cloneClass(TimerGui)
    if enabled then
        function TimerGui:_set_jamming_values() end

        function TimerGui:start()
            local timer = 0.01
            self:_start(timer)
            managers.network:session():send_to_peers_synched("start_timer_gui", self._unit, timer)
        end
    else
        TimerGui._set_jamming_values = TimerGui.orig._set_jamming_values
        TimerGui.start = TimerGui.orig.start
    end
end

function UT:interactFromTable(table)
    if not table then
        return
    end

    local playerUnit = UT.GameUtility:playerUnit()
    local units = UT.Utility:deepClone(managers.interaction._interactive_units)
    for index, unit in pairs(units) do
        if not UT.GameUtility:isUnitAlive(unit) then
            goto continue
        end

        local key = unit:name():key()
        if UT.Utility:inTable(key, table) then
            unit:interaction():interact(playerUnit)
        end

        ::continue::
    end
end

function UT:openDoors()
    UT:interactFromTable(UT.interactions["open-doors"])
end

function UT:openWindows()
    UT:interactFromTable(UT.interactions["open-windows"])
end

function UT:openDepositBoxes()
    UT:interactFromTable(UT.interactions["open-deposit-boxes"])
end

function UT:cutFences()
    UT:interactFromTable(UT.interactions["cut-fences"])
end

function UT:openContainers()
    UT:interactFromTable(UT.interactions["open-containers"])
end

function UT:hackComputers()
    UT:interactFromTable(UT.interactions["hack-computers"])
end

function UT:placeDrills()
    UT:interactFromTable(UT.interactions["place-drills"])
end

function UT:pickUpPackages()
    UT:interactFromTable(UT.interactions["pick-up-packages"])
end

function UT:openCrates()
    UT:setUnlimitedEquipment(true)
    UT:interactFromTable(UT.interactions["open-crates"])
    UT:setUnlimitedEquipment(UT:getSetting("enable-unlimited-equipment"))
end

function UT:barricadeWindows()
    UT:setUnlimitedEquipment(true)
    UT:interactFromTable(UT.interactions["barricade-windows"])
    UT:setUnlimitedEquipment(UT:getSetting("enable-unlimited-equipment"))
end

function UT:openAtms()
    UT:setUnlimitedEquipment(true)
    UT:interactFromTable(UT.interactions["open-atms"])
    UT:setUnlimitedEquipment(UT:getSetting("enable-unlimited-equipment"))
end

function UT:useKeycards()
    UT:setUnlimitedEquipment(true)
    UT:interactFromTable(UT.interactions["use-keycards"])
    UT:setUnlimitedEquipment(UT:getSetting("enable-unlimited-equipment"))
end

function UT:placeShapedCharges()
    UT:setUnlimitedEquipment(true)
    UT:interactFromTable(UT.interactions["place-shaped-charges"])
    UT:setUnlimitedEquipment(UT:getSetting("enable-unlimited-equipment"))
end

-- Driving

function UT:spawnAndEnterVehicle(id)
    if UT.GameUtility:isDriving() then
        UT.GameUtility:setPlayerState("standard")
    end

    if UT.Utility:isEmptyTable(UT.spawnedVehicleUnits) then
        UT.Utility:cloneClass(BaseNetworkSession)
        function BaseNetworkSession:send_to_peers_synched(name, ...)
            if UT.Utility:inTable(name, {
                    "sync_vehicle_driving",
                    "sync_vehicle_set_input",
                    "sync_vehicle_state",
                    "sync_vehicle_player",
                    "sync_ai_vehicle_action",
                    "sync_vehicle_change_stance",
                    "sync_store_loot_in_vehicle",
                    "sync_give_vehicle_loot_to_player",
                    "sync_vehicle_interact_trunk"
                }) then
                return
            end

            self.orig.send_to_peers_synched(self, name, ...)
        end
    end

    local idString = UT.GameUtility:idString(id)
    local position = UT.GameUtility:getPlayerPosition()
    local rotation = UT.GameUtility:getPlayerCameraYawRotation()
    local vehicleUnit = UT.GameUtility:spawnUnit(idString, position, rotation)

    if not vehicleUnit then
        return
    end

    managers.player:enter_vehicle(vehicleUnit, UT.GameUtility:playerUnit())

    UT.Utility:tableInsert(UT.spawnedVehicleUnits, vehicleUnit)
end

function UT:removeSpawnedVehicles()
    if UT.GameUtility:isDriving() then
        UT.GameUtility:setPlayerState("standard")
    end

    if not UT.Utility:isEmptyTable(UT.spawnedVehicleUnits) then
        BaseNetworkSession.send_to_peers_synched = BaseNetworkSession.orig.send_to_peers_synched
    end

    for index, unit in pairs(UT.spawnedVehicleUnits) do
        UT.GameUtility:deleteUnit(unit)
    end

    UT.spawnedVehicleUnits = {}
end
