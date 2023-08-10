local rootPath = ModPath:gsub("\\", "/")

if rootPath:sub(-1) == "/" then
    rootPath = rootPath:sub(1, -2)
end

local modPath = rootPath .. "/payday-2-ultimate-trainer-6-mod"

dofile(modPath .. "/libraries/base64.lua")

dofile(modPath .. "/classes/UT.lua")

dofile(modPath .. "/classes/Build.lua")
dofile(modPath .. "/classes/CarryStacker.lua")
dofile(modPath .. "/classes/GameUtility.lua")
dofile(modPath .. "/classes/Hook.lua")
dofile(modPath .. "/classes/Keybind.lua")
dofile(modPath .. "/classes/Log.lua")
dofile(modPath .. "/classes/Spawn.lua")
dofile(modPath .. "/classes/Utility.lua")

UT_APP_URL = "http://127.0.0.1:1140"
UT_SERVER_URL = "http://127.0.0.1:1139"
UT_CALLS_REQUESTS_PER_SECOND = 10
UT_LOG_LEVEL = UT.Log.INFO

dofile(modPath .. "/config.lua")

if UT_DEV then
    dofile(modPath .. "/classes/Dev.lua")
end

UT.rootPath = rootPath
UT.modPath = modPath

UT:init()
