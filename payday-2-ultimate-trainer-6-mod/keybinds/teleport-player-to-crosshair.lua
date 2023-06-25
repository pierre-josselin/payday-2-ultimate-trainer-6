if not UT:isInHeist() then
    do return end
end

if not alive(UT:playerUnit()) then
    do return end
end

UT:teleportPlayerToCrosshair()
