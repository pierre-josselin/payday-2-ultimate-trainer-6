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

import deMain from "@/locales/de/main.json";
import deDialogs from "@/locales/de/dialogs.json";
import deColors from "@/locales/de/generated/colors.json";
import deMasks from "@/locales/de/generated/masks.json";
import deMaterials from "@/locales/de/generated/materials.json";
import deSteamAchievements from "@/locales/de/generated/steam-achievements.json";
import deTextures from "@/locales/de/generated/textures.json";
import deTrophies from "@/locales/de/generated/trophies.json";
import deWeaponMods from "@/locales/de/generated/weapon-mods.json";
import deBags from "@/locales/de/generated/bags.json";
import deSpecialEquipment from "@/locales/de/generated/special-equipment.json";

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

import ptBRMain from "@/locales/pt-br/main.json";
import ptBRDialogs from "@/locales/pt-br/dialogs.json";

import roMain from "@/locales/ro/main.json";
import roDialogs from "@/locales/ro/dialogs.json";

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

import ukMain from "@/locales/uk/main.json";
import ukDialogs from "@/locales/uk/dialogs.json";

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

import jaMain from "@/locales/ja/main.json";
import jaDialogs from "@/locales/ja/dialogs.json";
import jaColors from "@/locales/ja/generated/colors.json";
import jaMasks from "@/locales/ja/generated/masks.json";
import jaMaterials from "@/locales/ja/generated/materials.json";
import jaSteamAchievements from "@/locales/ja/generated/steam-achievements.json";
import jaTextures from "@/locales/ja/generated/textures.json";
import jaTrophies from "@/locales/ja/generated/trophies.json";
import jaWeaponMods from "@/locales/ja/generated/weapon-mods.json";
import jaBags from "@/locales/ja/generated/bags.json";
import jaSpecialEquipment from "@/locales/ja/generated/special-equipment.json";

import koMain from "@/locales/ko/main.json";
import koDialogs from "@/locales/ko/dialogs.json";
import koColors from "@/locales/ko/generated/colors.json";
import koMasks from "@/locales/ko/generated/masks.json";
import koMaterials from "@/locales/ko/generated/materials.json";
import koSteamAchievements from "@/locales/ko/generated/steam-achievements.json";
import koTextures from "@/locales/ko/generated/textures.json";
import koTrophies from "@/locales/ko/generated/trophies.json";
import koWeaponMods from "@/locales/ko/generated/weapon-mods.json";
import koBags from "@/locales/ko/generated/bags.json";
import koSpecialEquipment from "@/locales/ko/generated/special-equipment.json";

export default createI18n({
    locale: "en",
    fallbackLocale: "en",
    missingWarn: false,
    fallbackWarn: false,
    warnHtmlMessage: false,
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
        de: {
            main: deMain,
            dialogs: deDialogs,
            colors: deColors,
            masks: deMasks,
            materials: deMaterials,
            steam_achievements: deSteamAchievements,
            textures: deTextures,
            trophies: deTrophies,
            weapon_mods: deWeaponMods,
            bags: deBags,
            special_equipment: deSpecialEquipment
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
        "pt-br": {
            main: ptBRMain,
            dialogs: ptBRDialogs
        },
        ro: {
            main: roMain,
            dialogs: roDialogs
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
        uk: {
            main: ukMain,
            dialogs: ukDialogs
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
        ja: {
            main: jaMain,
            dialogs: jaDialogs,
            colors: jaColors,
            masks: jaMasks,
            materials: jaMaterials,
            steam_achievements: jaSteamAchievements,
            textures: jaTextures,
            trophies: jaTrophies,
            weapon_mods: jaWeaponMods,
            bags: jaBags,
            special_equipment: jaSpecialEquipment
        },
        ko: {
            main: koMain,
            dialogs: koDialogs,
            colors: koColors,
            masks: koMasks,
            materials: koMaterials,
            steam_achievements: koSteamAchievements,
            textures: koTextures,
            trophies: koTrophies,
            weapon_mods: koWeaponMods,
            bags: koBags,
            special_equipment: koSpecialEquipment
        }
    }
});
