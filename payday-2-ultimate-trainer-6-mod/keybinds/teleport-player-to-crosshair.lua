if not UT.GameUtility:isInHeist() then
    do return end
end

if not UT.GameUtility:isUnitAlive(UT.GameUtility:playerUnit()) then
    do return end
end

UT:teleportPlayerToCrosshair()
