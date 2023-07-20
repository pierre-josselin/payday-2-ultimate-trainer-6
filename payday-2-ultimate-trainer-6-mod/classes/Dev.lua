UT.Dev = {}

function UT.Dev:generateData()
    local masks = {}
    local materials = {}
    local textures = {}
    local colors = {}
    local weaponMods = {}
    local trophies = {}
    local achievements = {}

    for maskId, mask in pairs(tweak_data.blackmarket.masks) do
        if mask.name_id ~= "bm_msk_cheat_error" and UT.GameUtility:localizationExists(mask.name_id) then
            UT.Utility:tableInsert(masks, maskId)
        end
    end

    for materialId, material in pairs(tweak_data.blackmarket.materials) do
        if UT.GameUtility:localizationExists(material.name_id) then
            UT.Utility:tableInsert(materials, materialId)
        end
    end

    for textureId, texture in pairs(tweak_data.blackmarket.textures) do
        if UT.GameUtility:localizationExists(texture.name_id) then
            UT.Utility:tableInsert(textures, textureId)
        end
    end

    for colorId, color in pairs(tweak_data.blackmarket.colors) do
        if UT.GameUtility:localizationExists(color.name_id) then
            UT.Utility:tableInsert(colors, colorId)
        end
    end

    for weaponModId, weaponMod in pairs(tweak_data.blackmarket.weapon_mods) do
        if UT.GameUtility:localizationExists(weaponMod.name_id) then
            UT.Utility:tableInsert(weaponMods, weaponModId)
        end
    end

    for index, trophy in pairs(Global.custom_safehouse_manager.trophies) do
        if UT.GameUtility:localizationExists(trophy.name_id) then
            UT.Utility:tableInsert(trophies, trophy.id)
        end
    end

    for achievementId, achievement in pairs(managers.achievment.achievments) do
        if UT.GameUtility:localizationExists("achievement_" .. achievement.id) then
            UT.Utility:tableInsert(achievements, achievementId)
        end
    end

    local path = UT.rootPath .. "/payday-2-ultimate-trainer-6-app/src/data"
    UT.Utility:writeFile(path .. "/masks.json", UT.Utility:jsonEncode(masks))
    UT.Utility:writeFile(path .. "/materials.json", UT.Utility:jsonEncode(materials))
    UT.Utility:writeFile(path .. "/textures.json", UT.Utility:jsonEncode(textures))
    UT.Utility:writeFile(path .. "/colors.json", UT.Utility:jsonEncode(colors))
    UT.Utility:writeFile(path .. "/weapon-mods.json", UT.Utility:jsonEncode(weaponMods))
    UT.Utility:writeFile(path .. "/trophies.json", UT.Utility:jsonEncode(trophies))
    UT.Utility:writeFile(path .. "/steam-achievements.json", UT.Utility:jsonEncode(achievements))

    UT.Log:debug("Data generated!")
end

function UT.Dev:generateDataLocales(locale)
    local masks = {}
    local materials = {}
    local textures = {}
    local colors = {}
    local weaponMods = {}
    local trophies = {}
    local achievements = {}

    for maskId, mask in pairs(tweak_data.blackmarket.masks) do
        if mask.name_id ~= "bm_msk_cheat_error" and UT.GameUtility:localizationExists(mask.name_id) then
            masks[maskId] = UT.GameUtility:getLocalizationText(mask.name_id)
        end
    end

    for materialId, material in pairs(tweak_data.blackmarket.materials) do
        if UT.GameUtility:localizationExists(material.name_id) then
            materials[materialId] = UT.GameUtility:getLocalizationText(material.name_id)
        end
    end

    for textureId, texture in pairs(tweak_data.blackmarket.textures) do
        if UT.GameUtility:localizationExists(texture.name_id) then
            textures[textureId] = UT.GameUtility:getLocalizationText(texture.name_id)
        end
    end

    for colorId, color in pairs(tweak_data.blackmarket.colors) do
        if UT.GameUtility:localizationExists(color.name_id) then
            colors[colorId] = UT.GameUtility:getLocalizationText(color.name_id)
        end
    end

    for weaponModId, weaponMod in pairs(tweak_data.blackmarket.weapon_mods) do
        if UT.GameUtility:localizationExists(weaponMod.name_id) then
            weaponMods[weaponModId] = UT.GameUtility:getLocalizationText(weaponMod.name_id)
        end
    end

    for index, trophy in pairs(Global.custom_safehouse_manager.trophies) do
        if UT.GameUtility:localizationExists(trophy.name_id) then
            trophies[trophy.id] = UT.GameUtility:getLocalizationText(trophy.name_id)
        end
    end

    for achievementId, achievement in pairs(managers.achievment.achievments) do
        if UT.GameUtility:localizationExists("achievement_" .. achievement.id) then
            achievements[achievement.id] = UT.GameUtility:getLocalizationText("achievement_" .. achievement.id)
        end
    end

    local path = UT.rootPath .. "/payday-2-ultimate-trainer-6-app/src/locales/" .. locale .. "/generated"
    UT.Utility:writeFile(path .. "/masks.json", UT.Utility:jsonEncode(masks))
    UT.Utility:writeFile(path .. "/materials.json", UT.Utility:jsonEncode(materials))
    UT.Utility:writeFile(path .. "/textures.json", UT.Utility:jsonEncode(textures))
    UT.Utility:writeFile(path .. "/colors.json", UT.Utility:jsonEncode(colors))
    UT.Utility:writeFile(path .. "/weapon-mods.json", UT.Utility:jsonEncode(weaponMods))
    UT.Utility:writeFile(path .. "/trophies.json", UT.Utility:jsonEncode(trophies))
    UT.Utility:writeFile(path .. "/steam-achievements.json", UT.Utility:jsonEncode(achievements))

    UT.Log:debug("Data locales generated!")
end
