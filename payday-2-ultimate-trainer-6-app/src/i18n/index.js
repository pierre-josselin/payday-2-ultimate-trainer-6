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

import frMain from "@/locales/fr/main.json";
import frDialogs from "@/locales/fr/dialogs.json";
import frColors from "@/locales/fr/generated/colors.json";
import frMasks from "@/locales/fr/generated/masks.json";
import frMaterials from "@/locales/fr/generated/materials.json";
import frSteamAchievements from "@/locales/fr/generated/steam-achievements.json";
import frTextures from "@/locales/fr/generated/textures.json";
import frTrophies from "@/locales/fr/generated/trophies.json";
import frWeaponMods from "@/locales/fr/generated/weapon-mods.json";

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

import ruMain from "@/locales/ru/main.json";
import ruDialogs from "@/locales/ru/dialogs.json";
import ruColors from "@/locales/ru/generated/colors.json";
import ruMasks from "@/locales/ru/generated/masks.json";
import ruMaterials from "@/locales/ru/generated/materials.json";
import ruSteamAchievements from "@/locales/ru/generated/steam-achievements.json";
import ruTextures from "@/locales/ru/generated/textures.json";
import ruTrophies from "@/locales/ru/generated/trophies.json";
import ruWeaponMods from "@/locales/ru/generated/weapon-mods.json";

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
            weapon_mods: enWeaponMods
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
            weapon_mods: frWeaponMods
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
            weapon_mods: zhWeaponMods
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
            weapon_mods: ruWeaponMods
        }
    }
});
