UT.Spawn = {}

UT.Spawn.id = nil
UT.Spawn.categoryId = nil
UT.Spawn.positionType = nil
UT.Spawn.convertedEnemies = nil

function UT.Spawn:setConfig(id, categoryId, positionType, convertedEnemies)
    UT.Spawn.id = id
    UT.Spawn.categoryId = categoryId
    UT.Spawn.positionType = positionType
    UT.Spawn.convertedEnemies = convertedEnemies
end

function UT.Spawn:getPosition()
    local position = nil

    if UT.Spawn.positionType == "on-self" then
        position = UT.GameUtility:getPlayerPosition()
    end

    if UT.Spawn.positionType == "on-crosshair" then
        position = UT.GameUtility:getCrosshairRayPosition()
    end

    return position
end

function UT.Spawn:getRotation(id, categoryId, positionType)
    local rotation = nil

    if categoryId == "equipment" and (id == "ecm-jammer" or id == "trip-mine") and positionType == "on-crosshair" then
        local crosshairRay = UT.GameUtility:getCrosshairRay()
        if crosshairRay then
            rotation = Rotation(crosshairRay.normal, math.UP)
        end
    else
        rotation = UT.GameUtility:getPlayerCameraYawRotation()
    end

    return rotation or Rotation(0, 0, 0)
end

function UT.Spawn.spawnEnemy(id, position, rotation)
    local idString = UT.GameUtility:idString(id)
    local unit = UT.GameUtility:spawnUnit(idString, position, rotation)

    if not unit then
        return
    end

    UT.GameUtility:setUnitTeam(unit, "combatant")

    if UT.Spawn.convertedEnemies then
        UT:setUnlimitedConversion(true)
        UT.GameUtility:convertEnemy(unit)
        UT:setUnlimitedConversion(false)
    end
end

function UT.Spawn.spawnGagePackage(id, position, rotation)
    UT:setUnlimitedGagePackages(true)

    local idString = UT.GameUtility:idString(id)
    UT.GameUtility:spawnUnit(idString, position, rotation)
end

function UT.Spawn.spawnEquipment(id, position, rotation)
    local playerUnit = UT.GameUtility:getPlayerUnit()
    local localPeerId = UT.GameUtility:getLocalPeerId()

    if id == "ammo-bag" then
        AmmoBagBase.spawn(position, rotation, 1, localPeerId, 2)
    elseif id == "doctor-bag" then
        DoctorBagBase.spawn(position, rotation, 20, localPeerId)
    elseif id == "first-aid-kit" then
        FirstAidKitBase.spawn(position, rotation, 20, localPeerId)
    elseif id == "ordnance-bag" then
        GrenadeCrateDeployableBase.spawn(position, rotation)
    elseif id == "body-bag-case" then
        BodyBagsBagBase.spawn(position, rotation, 0, localPeerId)
    elseif id == "ecm-jammer" then
        managers.mission:call_global_event("player_deploy_ecmjammer")
        local unit = ECMJammerBase.spawn(position, rotation, 3, playerUnit, localPeerId)
        if not unit then return end
        unit:base():set_active(true)
        unit:base()._check_body = function() end
    elseif id == "trip-mine" then
        local unit = TripMineBase.spawn(position, rotation, true, localPeerId)
        if not unit then return end
        unit:base():set_active(true, playerUnit)
    elseif id == "sentry-gun" or id == "suppressed-sentry-gun" then
        UT:disableSentryGunPickup()
        local shield = managers.player:has_category_upgrade("sentry_gun", "shield")
        local ammoLevel = managers.player:upgrade_value("sentry_gun", "extra_ammo_multiplier", 1)
        local unit, spreadLevel, rotationSpeedLevel = SentryGunBase.spawn(playerUnit, position, rotation, localPeerId, false, id == "sentry-gun" and 1 or 2)
        if not unit then return end
        managers.network:session():send_to_peers_synched("from_server_sentry_gun_place_result", localPeerId, 0, unit, rotationSpeedLevel, spreadLevel, shield, ammoLevel, 1)
        unit:event_listener():call("on_setup", true)
        unit:base():post_setup(1)
    end
end

function UT.Spawn.spawnExplosion(id, position, rotation)
    local idString = UT.GameUtility:idString(id)
    local unit = UT.GameUtility:spawnUnit(idString, position, rotation)

    if unit and unit.base and unit:base()._detonate then
        unit:base():_detonate()
    end
end

function UT.Spawn:spawn()
    if not UT.Spawn.id or not UT.Spawn.categoryId or not UT.Spawn.positionType then
        return
    end

    local position = UT.Spawn:getPosition()
    local rotation = UT.Spawn:getRotation(UT.Spawn.id, UT.Spawn.categoryId, UT.Spawn.positionType)

    if not position or not rotation then
        return
    end

    if UT.Spawn.categoryId == "enemies" then
        UT.Spawn.spawnEnemy(UT.Spawn.id, position, rotation)
    elseif UT.Spawn.categoryId == "gage-packages" then
        UT.Spawn.spawnGagePackage(UT.Spawn.id, position, rotation)
    elseif UT.Spawn.categoryId == "equipment" then
        UT.Spawn.spawnEquipment(UT.Spawn.id, position, rotation)
    elseif UT.Spawn.categoryId == "explosions" then
        UT.Spawn.spawnExplosion(UT.Spawn.id, position, rotation)
    end
end
