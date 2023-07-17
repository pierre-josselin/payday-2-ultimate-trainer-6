UT.Keybind = {}

function UT.Keybind:teleportPlayerToCrosshair()
    if not UT.GameUtility:isInHeist() then
        return
    end

    if not UT.GameUtility:isPlayerUnitAlive() then
        return
    end

    if UT.GameUtility:isDriving() then
        return
    end

    local crosshairRay = UT.GameUtility:getCrosshairRay()

    if not crosshairRay then
        return
    end

    local offset = Vector3()
    mvector3.set(offset, UT.GameUtility:getPlayerCameraForward())
    mvector3.multiply(offset, 150)
    mvector3.add(crosshairRay.hit_position, offset)

    UT.GameUtility:teleportPlayer(crosshairRay.hit_position, UT.GameUtility:getPlayerCameraRotation())
end

function UT.Keybind:spawnSpawn()
    if not UT.GameUtility:isInHeist() then
        return
    end

    if not UT.GameUtility:isServer() then
        return
    end

    if not UT.GameUtility:isPlayerUnitAlive() then
        return
    end

    UT.Spawn:spawn()
end

function UT.Keybind:editorPick()
    if not UT.GameUtility:isInHeist() then
        return
    end

    if not UT.GameUtility:isPlayerUnitAlive() then
        return
    end

    UT.Editor:pickUnit()
end

function UT.Keybind:editorSpawn()
    if not UT.GameUtility:isInHeist() then
        return
    end

    if not UT.GameUtility:isServer() then
        return
    end

    if not UT.GameUtility:isPlayerUnitAlive() then
        return
    end

    UT.Editor:spawnUnit()
end

function UT.Keybind:editorDelete()
    if not UT.GameUtility:isInHeist() then
        return
    end

    if not UT.GameUtility:isServer() then
        return
    end

    if not UT.GameUtility:isPlayerUnitAlive() then
        return
    end

    UT.Editor:deleteUnit()
end
