local modPath = ModPath:gsub("\\", "/")

if modPath:sub(-1) == "/" then
    modPath = modPath:sub(1, -2)
end

dofile(modPath .. "/payday-2-ultimate-trainer-6-mod/classes/UT.lua")

dofile(modPath .. "/payday-2-ultimate-trainer-6-mod/classes/GameUtility.lua")
dofile(modPath .. "/payday-2-ultimate-trainer-6-mod/classes/Hook.lua")
dofile(modPath .. "/payday-2-ultimate-trainer-6-mod/classes/Keybind.lua")
dofile(modPath .. "/payday-2-ultimate-trainer-6-mod/classes/Log.lua")
dofile(modPath .. "/payday-2-ultimate-trainer-6-mod/classes/Spawn.lua")
dofile(modPath .. "/payday-2-ultimate-trainer-6-mod/classes/Utility.lua")

dofile(modPath .. "/payday-2-ultimate-trainer-6-mod/config.lua")

UT.modPath = modPath

UT:init()
