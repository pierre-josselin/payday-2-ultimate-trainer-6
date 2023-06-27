local modPath = ModPath:gsub("\\", "/")

if modPath:sub(-1) == "/" then
    modPath = modPath:sub(1, -2)
end

dofile(modPath .. "/payday-2-ultimate-trainer-6-mod/config.lua")

dofile(modPath .. "/payday-2-ultimate-trainer-6-mod/classes/UT.lua")
dofile(modPath .. "/payday-2-ultimate-trainer-6-mod/classes/Utils.lua")
dofile(modPath .. "/payday-2-ultimate-trainer-6-mod/classes/Tables.lua")

UT:requestSettings()

UT.modPathWindows = modPath:gsub("/", "\\")
