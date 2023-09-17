UT.Build = {}

UT.Build.pickedUnit = nil
UT.Build.spawnedUnits = {}

function UT.Build:pickUnit()
    local crosshairRay = UT.GameUtility:getCrosshairRay()

    if not crosshairRay or not crosshairRay.unit then
        return
    end

    local unit = crosshairRay.unit

    if unit:base() then
        return
    end

    UT.Build.pickedUnit = unit
end

function UT.Build:spawnUnit()
    if not UT.Build.pickedUnit or not UT.GameUtility:isUnitAlive(UT.Build.pickedUnit) then
        return
    end

    local crosshairRay = UT.GameUtility:getCrosshairRay()

    if not crosshairRay or not crosshairRay.position then
        return
    end

    local position = crosshairRay.position
    local rotation = UT.GameUtility:getPlayerCameraYawRotation()

    local unitId = UT.Build.pickedUnit:name()
    local unit = UT.GameUtility:spawnUnit(unitId, position, rotation)

    if not unit then
        return
    end

    UT.Build.spawnedUnits[UT.Utility:toString(unit)] = unit
end

function UT.Build:deleteUnit()
    local crosshairRay = UT.GameUtility:getCrosshairRay()

    if not crosshairRay or not crosshairRay.unit then
        return
    end

    local unit = crosshairRay.unit
    local unitKey = UT.Utility:toString(unit)

    if not UT.Build.spawnedUnits[unitKey] then
        return
    end

    UT.Build.spawnedUnits[unitKey] = nil
    UT.GameUtility:deleteUnit(unit)
end

function UT.Build:drawPickedUnit()
    local unit = UT.Build.pickedUnit

    if not UT.GameUtility:isUnitAlive(unit) then
        return
    end

    if unit:network_sync() == "spawn" then
        Application:draw(unit, 0, 1, 0)
    else
        Application:draw(unit, 1, 0.5, 0)
    end
end
