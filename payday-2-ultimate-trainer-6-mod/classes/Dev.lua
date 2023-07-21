UT.Dev = {}

function UT.Dev:generateData()
    local data = {}
    local categories = { "masks", "materials", "textures", "colors", "weapon-mods", "trophies", "steam-achievements", "bags", "special-equipment" }

    for index, category in pairs(categories) do
        data[category] = {}
    end

    for maskId, mask in pairs(tweak_data.blackmarket.masks) do
        if mask.name_id ~= "bm_msk_cheat_error" and UT.GameUtility:localizationExists(mask.name_id) then
            UT.Utility:tableInsert(data["masks"], maskId)
        end
    end

    for materialId, material in pairs(tweak_data.blackmarket.materials) do
        if UT.GameUtility:localizationExists(material.name_id) then
            UT.Utility:tableInsert(data["materials"], materialId)
        end
    end

    for textureId, texture in pairs(tweak_data.blackmarket.textures) do
        if UT.GameUtility:localizationExists(texture.name_id) then
            UT.Utility:tableInsert(data["textures"], textureId)
        end
    end

    for colorId, color in pairs(tweak_data.blackmarket.colors) do
        if UT.GameUtility:localizationExists(color.name_id) then
            UT.Utility:tableInsert(data["colors"], colorId)
        end
    end

    for weaponModId, weaponMod in pairs(tweak_data.blackmarket.weapon_mods) do
        if UT.GameUtility:localizationExists(weaponMod.name_id) then
            UT.Utility:tableInsert(data["weapon-mods"], weaponModId)
        end
    end

    for index, trophy in pairs(Global.custom_safehouse_manager.trophies) do
        if UT.GameUtility:localizationExists(trophy.name_id) then
            UT.Utility:tableInsert(data["trophies"], trophy.id)
        end
    end

    for steamAchievementId, steamAchievement in pairs(managers.achievment.achievments) do
        if UT.GameUtility:localizationExists("achievement_" .. steamAchievement.id) then
            UT.Utility:tableInsert(data["steam-achievements"], steamAchievementId)
        end
    end

    local excludedBags = {
        "cg22_bag",
        "cg22_bag_green",
        "cg22_bag_yellow",
        "pda9_feed",
        "turret_part",
        "vehicle_falcogini"
    }

    for bagId, bag in pairs(tweak_data.carry) do
        if not UT.Utility:inTable(bagId, excludedBags) and bag.name_id and UT.GameUtility:localizationExists(bag.name_id) then
            UT.Utility:tableInsert(data["bags"], bagId)
        end
    end

    for specialEquipmentId, specialEquipment in pairs(tweak_data.equipments.specials) do
        if specialEquipment.text_id and UT.GameUtility:localizationExists(specialEquipment.text_id) then
            UT.Utility:tableInsert(data["special-equipment"], specialEquipmentId)
        end
    end

    for index, category in pairs(categories) do
        local content = UT.Utility:jsonEncode(data[category])
        UT.Utility:writeFile(UT.rootPath .. "/payday-2-ultimate-trainer-6-app/src/data/" .. category .. ".json", content)
    end

    UT.Log:debug("Data generated!")
end

function UT.Dev:generateDataLocales(locale)
    local data = {}
    local locales = {}
    local categories = { "masks", "materials", "textures", "colors", "weapon-mods", "trophies", "steam-achievements", "bags", "special-equipment" }

    for index, category in pairs(categories) do
        locales[category] = {}
    end

    for index, category in pairs(categories) do
        local content = UT.Utility:readFile(UT.rootPath .. "/payday-2-ultimate-trainer-6-app/src/data/" .. category .. ".json")
        if not content then
            return
        end
        data[category] = UT.Utility:jsonDecode(content)
    end

    for index, maskId in pairs(data["masks"]) do
        local mask = tweak_data.blackmarket.masks[maskId]
        if mask then
            locales["masks"][maskId] = UT.GameUtility:getLocalizationText(mask.name_id)
        end
    end

    for index, materialId in pairs(data["materials"]) do
        local material = tweak_data.blackmarket.materials[materialId]
        if material then
            locales["materials"][materialId] = UT.GameUtility:getLocalizationText(material.name_id)
        end
    end

    for index, textureId in pairs(data["textures"]) do
        local texture = tweak_data.blackmarket.textures[textureId]
        if texture then
            locales["textures"][textureId] = UT.GameUtility:getLocalizationText(texture.name_id)
        end
    end

    for index, colorId in pairs(data["colors"]) do
        local color = tweak_data.blackmarket.colors[colorId]
        if color then
            locales["colors"][colorId] = UT.GameUtility:getLocalizationText(color.name_id)
        end
    end

    for index, weaponModId in pairs(data["weapon-mods"]) do
        local weaponMod = tweak_data.blackmarket.weapon_mods[weaponModId]
        if weaponMod then
            locales["weapon-mods"][weaponModId] = UT.GameUtility:getLocalizationText(weaponMod.name_id)
        end
    end

    for index, colorId in pairs(data["colors"]) do
        local color = tweak_data.blackmarket.colors[colorId]
        if color then
            locales["colors"][colorId] = UT.GameUtility:getLocalizationText(color.name_id)
        end
    end

    for index, trophyId in pairs(data["trophies"]) do
        local trophy = UT:getTrophy(trophyId)
        if trophy then
            locales["trophies"][trophyId] = UT.GameUtility:getLocalizationText(trophy.name_id)
        end
    end

    for index, steamAchievementId in pairs(data["steam-achievements"]) do
        local steamAchievement = managers.achievment.achievments[steamAchievementId]
        if steamAchievement then
            locales["steam-achievements"][steamAchievementId] = UT.GameUtility:getLocalizationText("achievement_" .. steamAchievement.id)
        end
    end

    for index, bagId in pairs(data["bags"]) do
        local bag = tweak_data.carry[bagId]
        if bag then
            locales["bags"][bagId] = UT.GameUtility:getLocalizationText(bag.name_id) .. " (" .. bagId .. ")"
        end
    end

    for index, specialEquipmentId in pairs(data["special-equipment"]) do
        local specialEquipment = tweak_data.equipments.specials[specialEquipmentId]
        if specialEquipment then
            locales["special-equipment"][specialEquipmentId] = UT.GameUtility:getLocalizationText(specialEquipment.text_id) .. " (" .. specialEquipmentId .. ")"
        end
    end

    for index, category in pairs(categories) do
        local content = UT.Utility:jsonEncode(locales[category])
        UT.Utility:writeFile(UT.rootPath .. "/payday-2-ultimate-trainer-6-app/src/locales/" .. locale .. "/generated/" .. category .. ".json", content)
    end

    UT.Log:debug("Data locales generated!")
end
