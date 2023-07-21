UT.Dev = {}

UT.Dev.excludedBags = {
    "cg22_bag",
    "cg22_bag_green",
    "cg22_bag_yellow",
    "pda9_feed",
    "turret_part",
    "vehicle_falcogini"
}

function UT.Dev:generateData()
    local masks = {}
    local materials = {}
    local textures = {}
    local colors = {}
    local weaponMods = {}
    local trophies = {}
    local achievements = {}
    local bags = {}
    local specialEquipment = {}

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

    for bagId, bag in pairs(tweak_data.carry) do
        if not UT.Utility:inTable(bagId, UT.Dev.excludedBags) and bag.name_id and UT.GameUtility:localizationExists(bag.name_id) then
            UT.Utility:tableInsert(bags, bagId)
        end
    end

    for specialEquipmentId, _specialEquipment in pairs(tweak_data.equipments.specials) do
        if _specialEquipment.text_id and UT.GameUtility:localizationExists(_specialEquipment.text_id) then
            UT.Utility:tableInsert(specialEquipment, specialEquipmentId)
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
    UT.Utility:writeFile(path .. "/bags.json", UT.Utility:jsonEncode(bags))
    UT.Utility:writeFile(path .. "/special-equipment.json", UT.Utility:jsonEncode(specialEquipment))

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
    local bags = {}
    local specialEquipment = {}

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

    for bagId, bag in pairs(tweak_data.carry) do
        if not UT.Utility:inTable(bagId, UT.Dev.excludedBags) and bag.name_id and UT.GameUtility:localizationExists(bag.name_id) then
            bags[bagId] = UT.GameUtility:getLocalizationText(bag.name_id) .. " (" .. bagId .. ")"
        end
    end

    for specialEquipmentId, _specialEquipment in pairs(tweak_data.equipments.specials) do
        if _specialEquipment.text_id and UT.GameUtility:localizationExists(_specialEquipment.text_id) then
            specialEquipment[specialEquipmentId] = UT.GameUtility:getLocalizationText(_specialEquipment.text_id) .. " (" .. specialEquipmentId .. ")"
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
    UT.Utility:writeFile(path .. "/bags.json", UT.Utility:jsonEncode(bags))
    UT.Utility:writeFile(path .. "/special-equipment.json", UT.Utility:jsonEncode(specialEquipment))

    UT.Log:debug("Data locales generated!")
end
