import { createI18n } from "vue-i18n";

import enMain from "@/locales/en/main.json";
import enDialogs from "@/locales/en/dialogs.json";
import enColors from "@/locales/en/generated/colors.json";
import enMasks from "@/locales/en/generated/masks.json";
import enMaterials from "@/locales/en/generated/materials.json";
import enSteamAchievements from "@/locales/en/generated/steam-achievements.json";
import enTextures from "@/locales/en/generated/textures.json";
import enTrophies from "@/locales/en/generated/trophies.json";
import enWeaponMods from "@/locales/en/generated/weapon-mods.json";
import enBags from "@/locales/en/generated/bags.json";
import enSpecialEquipment from "@/locales/en/generated/special-equipment.json";

import frMain from "@/locales/fr/main.json";
import frDialogs from "@/locales/fr/dialogs.json";
import frColors from "@/locales/fr/generated/colors.json";
import frMasks from "@/locales/fr/generated/masks.json";
import frMaterials from "@/locales/fr/generated/materials.json";
import frSteamAchievements from "@/locales/fr/generated/steam-achievements.json";
import frTextures from "@/locales/fr/generated/textures.json";
import frTrophies from "@/locales/fr/generated/trophies.json";
import frWeaponMods from "@/locales/fr/generated/weapon-mods.json";
import frBags from "@/locales/fr/generated/bags.json";
import frSpecialEquipment from "@/locales/fr/generated/special-equipment.json";

import roMain from "@/locales/ro/main.json";
import roDialogs from "@/locales/ro/dialogs.json";

import zhMain from "@/locales/zh/main.json";
import zhDialogs from "@/locales/zh/dialogs.json";
import zhColors from "@/locales/zh/generated/colors.json";
import zhMasks from "@/locales/zh/generated/masks.json";
import zhMaterials from "@/locales/zh/generated/materials.json";
import zhSteamAchievements from "@/locales/zh/generated/steam-achievements.json";
import zhTextures from "@/locales/zh/generated/textures.json";
import zhTrophies from "@/locales/zh/generated/trophies.json";
import zhWeaponMods from "@/locales/zh/generated/weapon-mods.json";
import zhBags from "@/locales/zh/generated/bags.json";
import zhSpecialEquipment from "@/locales/zh/generated/special-equipment.json";

import ruMain from "@/locales/ru/main.json";
import ruDialogs from "@/locales/ru/dialogs.json";
import ruColors from "@/locales/ru/generated/colors.json";
import ruMasks from "@/locales/ru/generated/masks.json";
import ruMaterials from "@/locales/ru/generated/materials.json";
import ruSteamAchievements from "@/locales/ru/generated/steam-achievements.json";
import ruTextures from "@/locales/ru/generated/textures.json";
import ruTrophies from "@/locales/ru/generated/trophies.json";
import ruWeaponMods from "@/locales/ru/generated/weapon-mods.json";
import ruBags from "@/locales/ru/generated/bags.json";
import ruSpecialEquipment from "@/locales/ru/generated/special-equipment.json";

import esMain from "@/locales/es/main.json";
import esDialogs from "@/locales/es/dialogs.json";
import esColors from "@/locales/es/generated/colors.json";
import esMasks from "@/locales/es/generated/masks.json";
import esMaterials from "@/locales/es/generated/materials.json";
import esSteamAchievements from "@/locales/es/generated/steam-achievements.json";
import esTextures from "@/locales/es/generated/textures.json";
import esTrophies from "@/locales/es/generated/trophies.json";
import esWeaponMods from "@/locales/es/generated/weapon-mods.json";
import esBags from "@/locales/es/generated/bags.json";
import esSpecialEquipment from "@/locales/es/generated/special-equipment.json";

export default createI18n({
    locale: "en",
    fallbackLocale: "en",
    silentTranslationWarn: true,
    silentFallbackWarn: true,
    warnHtmlInMessage: "off",
    messages: {
        en: {
            main: enMain,
            dialogs: enDialogs,
            colors: enColors,
            masks: enMasks,
            materials: enMaterials,
            steam_achievements: enSteamAchievements,
            textures: enTextures,
            trophies: enTrophies,
            weapon_mods: enWeaponMods,
            bags: enBags,
            special_equipment: enSpecialEquipment
        },
        fr: {
            main: frMain,
            dialogs: frDialogs,
            colors: frColors,
            masks: frMasks,
            materials: frMaterials,
            steam_achievements: frSteamAchievements,
            textures: frTextures,
            trophies: frTrophies,
            weapon_mods: frWeaponMods,
            bags: frBags,
            special_equipment: frSpecialEquipment
        },
        ro: {
            main: roMain,
            dialogs: roDialogs
        },
        zh: {
            main: zhMain,
            dialogs: zhDialogs,
            colors: zhColors,
            masks: zhMasks,
            materials: zhMaterials,
            steam_achievements: zhSteamAchievements,
            textures: zhTextures,
            trophies: zhTrophies,
            weapon_mods: zhWeaponMods,
            bags: zhBags,
            special_equipment: zhSpecialEquipment
        },
        ru: {
            main: ruMain,
            dialogs: ruDialogs,
            colors: ruColors,
            masks: ruMasks,
            materials: ruMaterials,
            steam_achievements: ruSteamAchievements,
            textures: ruTextures,
            trophies: ruTrophies,
            weapon_mods: ruWeaponMods,
            bags: ruBags,
            special_equipment: ruSpecialEquipment
        },
        es: {
            main: esMain,
            dialogs: esDialogs,
            colors: esColors,
            masks: esMasks,
            materials: esMaterials,
            steam_achievements: esSteamAchievements,
            textures: esTextures,
            trophies: esTrophies,
            weapon_mods: esWeaponMods,
            bags: esBags,
            special_equipment: esSpecialEquipment
        }
    }
});
