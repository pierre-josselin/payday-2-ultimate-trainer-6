UT.Keybind = {}

function UT.Keybind:openApp()
    Steam:overlay_activate("url", UT_APP_URL)
end

function UT.Keybind:teleportPlayerToCrosshair()
    if not UT.GameUtility:isInHeist() then
        return
    end

    if not UT.GameUtility:isUnitAlive(UT.GameUtility:playerUnit()) then
        return
    end

    local crosshairRay = UT.GameUtility:getCrosshairRay()

    if not crosshairRay then
        return
    end

    local offset = Vector3()
    mvector3.set(offset, UT.GameUtility:getPlayerCameraForward())
    mvector3.multiply(offset, 100)
    mvector3.add(crosshairRay.hit_position, offset)

    UT.GameUtility:teleportPlayer(crosshairRay.hit_position, UT.GameUtility:getPlayerCameraRotation())
end

function UT.Keybind:spawn()
    if not UT.GameUtility:isInHeist() then
        return
    end

    if not UT.GameUtility:isUnitAlive(UT.GameUtility:playerUnit()) then
        return
    end

    UT.Spawn:spawn()
end
