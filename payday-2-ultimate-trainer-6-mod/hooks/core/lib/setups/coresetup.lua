local rootPath = ModPath:gsub("\\", "/")

if rootPath:sub(-1) == "/" then
    rootPath = rootPath:sub(1, -2)
end

local modPath = rootPath .. "/payday-2-ultimate-trainer-6-mod"

dofile(modPath .. "/classes/UT.lua")

dofile(modPath .. "/classes/Editor.lua")
dofile(modPath .. "/classes/GameUtility.lua")
dofile(modPath .. "/classes/Hook.lua")
dofile(modPath .. "/classes/Keybind.lua")
dofile(modPath .. "/classes/Log.lua")
dofile(modPath .. "/classes/Spawn.lua")
dofile(modPath .. "/classes/Utility.lua")

dofile(modPath .. "/config.lua")

UT.rootPath = rootPath
UT.modPath = modPath

UT:init()
