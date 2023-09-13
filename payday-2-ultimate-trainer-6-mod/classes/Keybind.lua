UT.Keybind = {}

UT.Keybind.keyboard = nil
UT.Keybind.mouse = nil

UT.Keybind.keysDown = {}

UT.Keybind.conditions = {
    ["is-in-heist"] = function() return UT.GameUtility:isInHeist() end,
    ["is-in-game"] = function() return UT.GameUtility:isInGame() end,
    ["is-playing"] = function() return UT.GameUtility:isPlaying() end,
    ["is-in-custody"] = function() return UT.GameUtility:isInCustody() end,
    ["is-server"] = function() return UT.GameUtility:isServer() end,
    ["is-in-game-or-is-at-end-game"] = function() return UT.GameUtility:isInGame() or UT.GameUtility:isAtEndGame() end
}

UT.Keybind.actions = {
    -- Environment
    ["set-initial-environment"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:setInitialEnvironment()
        end
    },
    ["set-environment-early-morning"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:setEnvironment("environments/pd2_env_hox_02/pd2_env_hox_02")
        end
    },
    ["set-environment-morning"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:setEnvironment("environments/pd2_env_morning_02/pd2_env_morning_02")
        end
    },
    ["set-environment-mid-day"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:setEnvironment("environments/pd2_env_mid_day/pd2_env_mid_day")
        end
    },
    ["set-environment-afternoon"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:setEnvironment("environments/pd2_env_afternoon/pd2_env_afternoon")
        end
    },
    ["set-environment-bright-day"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:setEnvironment("environments/pd2_env_jry_plane/pd2_env_jry_plane")
        end
    },
    ["set-environment-cloudy-day"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:setEnvironment("environments/pd2_env_docks/pd2_env_docks")
        end
    },
    ["set-environment-night"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:setEnvironment("environments/pd2_env_n2/pd2_env_n2")
        end
    },
    ["set-environment-misty-night"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:setEnvironment("environments/pd2_env_arm_hcm_02/pd2_env_arm_hcm_02")
        end
    },
    ["set-environment-foggy-night"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:setEnvironment("environments/pd2_env_foggy_bright/pd2_env_foggy_bright")
        end
    },

    -- Cheats
    ["toggle-god-mode"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableGodMode = not UT:getSetting("enable-god-mode")
            UT:setGodMode(enableGodMode)
            UT:sendStorePropertyValue("settings", "enableGodMode", enableGodMode)
        end
    },
    ["toggle-no-fall-damage"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableNoFallDamage = not UT:getSetting("enable-no-fall-damage")
            UT:setNoFallDamage(enableNoFallDamage)
            UT:sendStorePropertyValue("settings", "enableNoFallDamage", enableNoFallDamage)
        end
    },
    ["toggle-infinite-stamina"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableInfiniteStamina = not UT:getSetting("enable-infinite-stamina")
            UT:setInfiniteStamina(enableInfiniteStamina)
            UT:sendStorePropertyValue("settings", "enableInfiniteStamina", enableInfiniteStamina)
        end
    },
    ["toggle-can-run-directional"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableCanRunDirectional = not UT:getSetting("enable-can-run-directional")
            UT:setCanRunDirectional(enableCanRunDirectional)
            UT:sendStorePropertyValue("settings", "enableCanRunDirectional", enableCanRunDirectional)
        end
    },
    ["toggle-can-run-with-any-bag"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableCanRunWithAnyBag = not UT:getSetting("enable-can-run-with-any-bag")
            UT:setCanRunWithAnyBag(enableCanRunWithAnyBag)
            UT:sendStorePropertyValue("settings", "enableCanRunWithAnyBag", enableCanRunWithAnyBag)
        end
    },
    ["toggle-instant-mask-on"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableInstantMaskOn = not UT:getSetting("enable-instant-mask-on")
            UT:setInstantMaskOn(enableInstantMaskOn)
            UT:sendStorePropertyValue("settings", "enableInstantMaskOn", enableInstantMaskOn)
        end
    },
    ["toggle-no-carry-cooldown"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableNoCarryCooldown = not UT:getSetting("enable-no-carry-cooldown")
            UT:setNoCarryCooldown(enableNoCarryCooldown)
            UT:sendStorePropertyValue("settings", "enableNoCarryCooldown", enableNoCarryCooldown)
        end
    },
    ["toggle-no-flashbangs"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableNoFlashbangs = not UT:getSetting("enable-no-flashbangs")
            UT:setNoFlashbangs(enableNoFlashbangs)
            UT:sendStorePropertyValue("settings", "enableNoFlashbangs", enableNoFlashbangs)
        end
    },
    ["toggle-instant-interaction"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableInstantInteraction = not UT:getSetting("enable-instant-interaction")
            UT:setInstantInteraction(enableInstantInteraction)
            UT:sendStorePropertyValue("settings", "enableInstantInteraction", enableInstantInteraction)
        end
    },
    ["toggle-instant-deployment"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableInstantDeployment = not UT:getSetting("enable-instant-deployment")
            UT:setInstantDeployment(enableInstantDeployment)
            UT:sendStorePropertyValue("settings", "enableInstantDeployment", enableInstantDeployment)
        end
    },
    ["toggle-unlimited-equipment"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableUnlimitedEquipment = not UT:getSetting("enable-unlimited-equipment")
            UT:setUnlimitedEquipment(enableUnlimitedEquipment)
            UT:sendStorePropertyValue("settings", "enableUnlimitedEquipment", enableUnlimitedEquipment)
        end
    },
    ["toggle-instant-weapon-swap"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableInstantWeaponSwap = not UT:getSetting("enable-instant-weapon-swap")
            UT:setInstantWeaponSwap(enableInstantWeaponSwap)
            UT:sendStorePropertyValue("settings", "enableInstantWeaponSwap", enableInstantWeaponSwap)
        end
    },
    ["toggle-instant-weapon-reload"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableInstantWeaponReload = not UT:getSetting("enable-instant-weapon-reload")
            UT:setInstantWeaponReload(enableInstantWeaponReload)
            UT:sendStorePropertyValue("settings", "enableInstantWeaponReload", enableInstantWeaponReload)
        end
    },
    ["toggle-no-weapon-recoil"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableNoWeaponRecoil = not UT:getSetting("enable-no-weapon-recoil")
            UT:setNoWeaponRecoil(enableNoWeaponRecoil)
            UT:sendStorePropertyValue("settings", "enableNoWeaponRecoil", enableNoWeaponRecoil)
        end
    },
    ["toggle-no-weapon-spread"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableNoWeaponSpread = not UT:getSetting("enable-no-weapon-spread")
            UT:setNoWeaponSpread(enableNoWeaponSpread)
            UT:sendStorePropertyValue("settings", "enableNoWeaponSpread", enableNoWeaponSpread)
        end
    },
    ["toggle-shoot-through-walls"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableShootThroughWalls = not UT:getSetting("enable-shoot-through-walls")
            UT:setShootThroughWalls(enableShootThroughWalls)
            UT:sendStorePropertyValue("settings", "enableShootThroughWalls", enableShootThroughWalls)
        end
    },
    ["toggle-unlimited-ammo"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableUnlimitedAmmo = not UT:getSetting("enable-unlimited-ammo")
            UT:setUnlimitedAmmo(enableUnlimitedAmmo)
            UT:sendStorePropertyValue("settings", "enableUnlimitedAmmo", enableUnlimitedAmmo)
        end
    },
    ["toggle-no-slow-motion"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableNoSlowMotion = not UT:getSetting("enable-no-slow-motion")
            UT:setNoSlowMotion(enableNoSlowMotion)
            UT:sendStorePropertyValue("settings", "enableNoSlowMotion", enableNoSlowMotion)
        end
    },
    ["toggle-move-speed-multiplier"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableMoveSpeedMultiplier = not UT:getSetting("enable-move-speed-multiplier")
            local moveSpeedMultiplier = UT:getSetting("move-speed-multiplier") or 2
            UT:setMoveSpeedMultiplier(enableMoveSpeedMultiplier, moveSpeedMultiplier)
            UT:sendStorePropertyValue("settings", "enableMoveSpeedMultiplier", enableMoveSpeedMultiplier)
        end
    },
    ["toggle-throw-distance-multiplier"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableThrowDistanceMultiplier = not UT:getSetting("enable-throw-distance-multiplier")
            local throwDistanceMultiplier = UT:getSetting("throw-distance-multiplier") or 2
            UT:setThrowDistanceMultiplier(enableThrowDistanceMultiplier, throwDistanceMultiplier)
            UT:sendStorePropertyValue("settings", "enableThrowDistanceMultiplier", enableThrowDistanceMultiplier)
        end
    },
    ["toggle-fire-rate-multiplier"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableFireRateMultiplier = not UT:getSetting("enable-fire-rate-multiplier")
            local fireRateMultiplier = UT:getSetting("fire-rate-multiplier") or 2
            UT:setFireRateMultiplier(enableFireRateMultiplier, fireRateMultiplier)
            UT:sendStorePropertyValue("settings", "enableFireRateMultiplier", enableFireRateMultiplier)
        end
    },
    ["toggle-damage-multiplier"] = {
        conditions = { "is-in-heist" },
        callback = function()
            local enableDamageMultiplier = not UT:getSetting("enable-damage-multiplier")
            local damageMultiplier = UT:getSetting("damage-multiplier") or 2
            UT:setDamageMultiplier(enableDamageMultiplier, damageMultiplier)
            UT:sendStorePropertyValue("settings", "enableDamageMultiplier", enableDamageMultiplier)
        end
    },

    -- Mission
    ["start-the-heist"] = {
        conditions = { "is-in-game", "is-server" },
        callback = function()
            UT:startTheHeist()
        end
    },
    ["restart-the-heist"] = {
        conditions = { "is-in-game-or-is-at-end-game", "is-server" },
        callback = function()
            UT:restartTheHeist()
        end
    },
    ["finish-the-heist"] = {
        conditions = { "is-in-game", "is-server" },
        callback = function()
            UT:finishTheHeist()
        end
    },
    ["leave-the-heist"] = {
        conditions = { "is-in-game-or-is-at-end-game" },
        callback = function()
            UT:leaveTheHeist()
        end
    },

    -- Mission / General
    ["access-cameras"] = {
        conditions = { "is-playing" },
        callback = function()
            UT:accessCameras()
        end
    },
    ["trigger-the-alarm"] = {
        conditions = { "is-in-heist", "is-server" },
        callback = function()
            UT:triggerTheAlarm()
        end
    },
    ["remove-invisible-walls"] = {
        conditions = { "is-in-heist", "is-server" },
        callback = function()
            UT:removeInvisibleWalls()
        end
    },
    ["kill-all-enemies"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:killAllEnemies()
        end
    },
    ["kill-all-civilians"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:killAllCivilians()
        end
    },
    ["tie-all-civilians"] = {
        conditions = { "is-in-heist", "is-server" },
        callback = function()
            UT:tieAllCivilians()
        end
    },
    ["convert-all-enemies"] = {
        conditions = { "is-in-heist", "is-server" },
        callback = function()
            UT:convertAllEnemies()
        end
    },
    ["get-out-of-custody"] = {
        conditions = { "is-in-custody" },
        callback = function()
            UT:getOutOfCustody()
        end
    },
    ["set-player-state-civilian"] = {
        conditions = { "is-playing" },
        callback = function()
            UT:setPlayerState("civilian")
        end
    },
    ["set-player-state-mask-off"] = {
        conditions = { "is-playing" },
        callback = function()
            UT:setPlayerState("mask_off")
        end
    },
    ["set-player-state-standard"] = {
        conditions = { "is-playing" },
        callback = function()
            UT:setPlayerState("standard")
        end
    },
    ["teleport-to-player-1"] = {
        conditions = { "is-playing" },
        callback = function()
            UT:teleportToPlayer(1)
        end
    },
    ["teleport-to-player-2"] = {
        conditions = { "is-playing" },
        callback = function()
            UT:teleportToPlayer(2)
        end
    },
    ["teleport-to-player-3"] = {
        conditions = { "is-playing" },
        callback = function()
            UT:teleportToPlayer(3)
        end
    },
    ["replenish-health"] = {
        conditions = { "is-playing" },
        callback = function()
            UT:replenishHealth()
        end
    },
    ["replenish-ammo"] = {
        conditions = { "is-playing" },
        callback = function()
            UT:replenishAmmo()
        end
    },
    ["replenish-equipment"] = {
        conditions = { "is-playing" },
        callback = function()
            UT:replenishEquipment()
        end
    },
    ["replenish-cable-ties"] = {
        conditions = { "is-playing" },
        callback = function()
            UT:replenishCableTies()
        end
    },
    ["replenish-throwables"] = {
        conditions = { "is-playing" },
        callback = function()
            UT:replenishThrowables()
        end
    },
    ["replenish-body-bags"] = {
        conditions = { "is-playing" },
        callback = function()
            UT:replenishBodyBags()
        end
    },
    ["toggle-x-ray"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT.xRayEnabled = not UT.xRayEnabled
            UT:setXRay(UT.xRayEnabled)
            UT:sendStorePropertyValue("mission", "enableXRay", UT.xRayEnabled)
        end
    },
    ["toggle-prevent-alarm-triggering"] = {
        conditions = { "is-in-heist", "is-server" },
        callback = function()
            UT.preventAlarmTriggeringEnabled = not UT.preventAlarmTriggeringEnabled
            UT:setPreventAlarmTriggering(UT.preventAlarmTriggeringEnabled)
            UT:sendStorePropertyValue("mission", "enablePreventAlarmTriggering", UT.preventAlarmTriggeringEnabled)
        end
    },
    ["toggle-invisible-player"] = {
        conditions = { "is-playing", "is-server" },
        callback = function()
            UT.invisiblePlayerEnabled = not UT.invisiblePlayerEnabled
            UT:setInvisiblePlayer(UT.invisiblePlayerEnabled)
            UT:sendStorePropertyValue("mission", "enableInvisiblePlayer", UT.invisiblePlayerEnabled)
        end
    },
    ["toggle-no-clip"] = {
        conditions = { "is-playing" },
        callback = function()
            UT.noClipEnabled = not UT.noClipEnabled
            UT:setNoClip(UT.noClipEnabled, UT.noClipSpeed)
            UT:sendStorePropertyValue("mission", "enableNoClip", UT.noClipEnabled)
        end
    },
    ["toggle-disable-ai"] = {
        conditions = { "is-in-heist", "is-server" },
        callback = function()
            UT.disableAIEnabled = not UT.disableAIEnabled
            UT:setDisableAI(UT.disableAIEnabled)
            UT:sendStorePropertyValue("mission", "enableDisableAI", UT.disableAIEnabled)
        end
    },
    ["toggle-remove-team-ai"] = {
        conditions = { "is-in-heist", "is-server" },
        callback = function()
            UT.removeTeamAIEnabled = not UT.removeTeamAIEnabled
            UT:setRemoveTeamAI(UT.removeTeamAIEnabled)
            UT:sendStorePropertyValue("mission", "enableRemoveTeamAI", UT.removeTeamAIEnabled)
        end
    },
    ["toggle-suspend-point-of-no-return-timer"] = {
        conditions = { "is-in-heist", "is-server" },
        callback = function()
            UT.suspendPointOfNoReturnTimerEnabled = not UT.suspendPointOfNoReturnTimerEnabled
            UT:setSuspendPointOfNoReturnTimer(UT.suspendPointOfNoReturnTimerEnabled)
            UT:sendStorePropertyValue("mission", "enableSuspendPointOfNoReturnTimer", UT.suspendPointOfNoReturnTimerEnabled)
        end
    },
    ["toggle-unlimited-pagers"] = {
        conditions = { "is-in-heist", "is-server" },
        callback = function()
            UT.unlimitedPagersEnabled = not UT.unlimitedPagersEnabled
            UT:setUnlimitedPagers(UT.unlimitedPagersEnabled)
            UT:sendStorePropertyValue("mission", "enableUnlimitedPagers", UT.unlimitedPagersEnabled)
        end
    },
    ["toggle-instant-drilling"] = {
        conditions = { "is-in-heist", "is-server" },
        callback = function()
            UT.instantDrillingEnabled = not UT.instantDrillingEnabled
            UT:setInstantDrilling(UT.instantDrillingEnabled)
            UT:sendStorePropertyValue("mission", "enableInstantDrilling", UT.instantDrillingEnabled)
        end
    },
    ["toggle-carry-stacker"] = {
        conditions = { "is-in-heist", "is-server" },
        callback = function()
            UT.CarryStacker.enabled = not UT.CarryStacker.enabled
            UT:setCarryStacker(UT.CarryStacker.enabled)
            UT:sendStorePropertyValue("mission", "enableCarryStacker", UT.CarryStacker.enabled)
        end
    },
    ["toggle-no-civilian-kill-penalty"] = {
        conditions = { "is-in-heist", "is-server" },
        callback = function()
            UT.noCivilianKillPenaltyEnabled = not UT.noCivilianKillPenaltyEnabled
            UT:setNoCivilianKillPenalty(UT.noCivilianKillPenaltyEnabled)
            UT:sendStorePropertyValue("mission", "enableNoCivilianKillPenalty", UT.noCivilianKillPenaltyEnabled)
        end
    },

    -- Mission / Interactions
    ["open-doors"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:openDoors()
        end
    },
    ["open-windows"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:openWindows()
        end
    },
    ["open-deposit-boxes"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:openDepositBoxes()
        end
    },
    ["cut-fences"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:cutFences()
        end
    },
    ["open-containers"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:openContainers()
        end
    },
    ["hack-computers"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:hackComputers()
        end
    },
    ["place-drills"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:placeDrills()
        end
    },
    ["pick-up-packages"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:pickUpPackages()
        end
    },
    ["open-crates"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:openCrates()
        end
    },
    ["barricade-windows"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:barricadeWindows()
        end
    },
    ["use-keycards"] = {
        conditions = { "is-in-heist" },
        callback = function()
            UT:useKeycards()
        end
    },
    ["open-atms"] = {
        conditions = { "is-in-heist", "is-server" },
        callback = function()
            UT:openAtms()
        end
    },
    ["place-shaped-charges"] = {
        conditions = { "is-in-heist", "is-server" },
        callback = function()
            UT:placeShapedCharges()
        end
    },

    -- Mission / Bags
    ["throw-bag"] = {
        conditions = { "is-playing", "is-server" },
        callback = function(bagId)
            UT:throwBag(bagId)
        end
    },

    -- Mission / Special equipment
    ["add-special-equipment"] = {
        conditions = { "is-playing" },
        callback = function(specialEquipmentId)
            UT:addSpecialEquipment(specialEquipmentId)
        end
    },

    -- Driving
    ["spawn-and-drive-vehicle"] = {
        conditions = { "is-playing", "is-server" },
        callback = function(vehicleId)
            UT:spawnAndDriveVehicle(vehicleId)
        end
    },
    ["remove-spawned-vehicles"] = {
        conditions = { "is-playing", "is-server" },
        callback = function()
            UT:removeSpawnedVehicles()
        end
    },

    -- Spawn / Spawn
    ["spawn-spawn"] = {
        conditions = { "is-playing", "is-server" },
        callback = function()
            UT.Spawn:spawn()
        end
    },

    -- Build
    ["build-pick"] = {
        conditions = { "is-playing", "is-server" },
        callback = function()
            UT.Build:pickUnit()
        end
    },
    ["build-spawn"] = {
        conditions = { "is-playing", "is-server" },
        callback = function()
            UT.Build:spawnUnit()
        end
    },
    ["build-delete"] = {
        conditions = { "is-playing", "is-server" },
        callback = function()
            UT.Build:deleteUnit()
        end
    },

    -- Default
    ["teleport-to-crosshair"] = {
        conditions = { "is-playing" },
        callback = function()
            UT:teleportToCrosshair()
        end
    },

    -- Addons
    ["run-keybind-addon"] = {
        conditions = {},
        callback = function(addonId)
            UT:runKeybindAddon(addonId)
        end
    }
}

function UT.Keybind:init()
    UT.Keybind.keyboard = Input:keyboard()
    UT.Keybind.mouse = Input:mouse()
end

function UT.Keybind:update()
    if not UT.Keybind.keyboard or not UT.Keybind.mouse then
        return
    end

    local keybinds = UT:getSetting("keybinds")

    if not keybinds or #keybinds == 0 then
        return
    end

    for index, keybind in pairs(keybinds) do
        if UT.Keybind.keysDown[keybind.key] then
            goto continue
        end

        local key = keybind.key
        if UT.Utility:stringStartsWith(key, "mouse ") then
            if not UT.Utility:stringStartsWith(key, "mouse wheel ") then
                key = UT.Utility:subString(key, 7)
            end

            local keyIdString = UT.GameUtility:idString(key)
            if not keyIdString or not UT.Keybind.mouse:down(keyIdString) then
                goto continue
            end
        else
            local keyIdString = UT.GameUtility:idString(key)
            if not keyIdString or not UT.Keybind.keyboard:down(keyIdString) then
                goto continue
            end
        end

        local action = UT.Keybind.actions[keybind.name]

        if not action then
            goto continue
        end

        if UT.GameUtility:isInChat() then
            goto continue
        end

        if UT.GameUtility:isListeningToInput() then
            goto continue
        end

        if UT.GameUtility:isInPauseMenu() then
            goto continue
        end

        if action.conditions then
            for index, condition in pairs(action.conditions) do
                if not UT.Keybind.conditions[condition]() then
                    goto continue
                end
            end
        end

        if keybind.argument then
            action.callback(keybind.argument)
        else
            action.callback()
        end

        if managers.menu_component then
            managers.menu_component:post_event("box_tick")
        end

        ::continue::
    end

    UT.Keybind.keysDown = {}
    for index, key in pairs(UT.Keybind.keyboard:down_list()) do
        local id = UT.Keybind.keyboard:button_name(key)
        local name = UT.Keybind.keyboard:button_name_str(id)
        if name and name ~= "" then
            UT.Keybind.keysDown[name] = true
        end
    end
    for index, key in pairs(UT.Keybind.mouse:down_list()) do
        local id = UT.Keybind.mouse:button_name(key)
        local name = UT.Keybind.mouse:button_name_str(id)
        if name and name ~= "" then
            if not UT.Utility:stringStartsWith(name, "mouse wheel ") then
                name = "mouse " .. name
            end
            UT.Keybind.keysDown[name] = true
        end
    end
end
