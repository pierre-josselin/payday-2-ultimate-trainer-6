UT.Editor = {}

UT.Editor.pickedUnit = nil
UT.Editor.spawnedUnits = {}

function UT.Editor:pickUnit()
    local crosshairRay = UT.GameUtility:getCrosshairRay()

    if not crosshairRay or not crosshairRay.unit then
        return
    end

    local unit = crosshairRay.unit

    if unit:base() then
        return
    end

    UT.Editor.pickedUnit = unit
end

function UT.Editor:spawnUnit()
    if not UT.Editor.pickedUnit then
        return
    end

    local crosshairRay = UT.GameUtility:getCrosshairRay()

    if not crosshairRay or not crosshairRay.position then
        return
    end

    local position = crosshairRay.position
    local rotation = UT.GameUtility:getPlayerCameraYawRotation()

    local unitId = UT.Editor.pickedUnit:name()
    local unit = UT.GameUtility:spawnUnit(unitId, position, rotation)

    if not unit then
        return
    end

    UT.Editor.spawnedUnits[UT.Utility:toString(unit)] = unit
end

function UT.Editor:deleteUnit()
    local crosshairRay = UT.GameUtility:getCrosshairRay()

    if not crosshairRay or not crosshairRay.unit then
        return
    end

    local unit = crosshairRay.unit
    local unitKey = UT.Utility:toString(unit)

    if not UT.Editor.spawnedUnits[unitKey] then
        return
    end

    UT.Editor.spawnedUnits[unitKey] = nil
    UT.GameUtility:deleteUnit(unit)
end

function UT.Editor:drawPickedUnit()
    local unit = UT.Editor.pickedUnit

    if not UT.GameUtility:isUnitAlive(unit) then
        return
    end

    if unit:network_sync() == "spawn" then
        Application:draw(unit, 0, 1, 0)
    else
        Application:draw(unit, 1, 0.5, 0)
    end
end
