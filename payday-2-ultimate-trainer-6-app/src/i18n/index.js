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

export default createI18n({
    locale: "en",
    fallbackLocale: "en",
    silentTranslationWarn: true,
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
        }
    }
});
