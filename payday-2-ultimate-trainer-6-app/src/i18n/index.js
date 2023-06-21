import { createI18n } from "vue-i18n";

import enMain from "@/locales/en/main.json";
import enColors from "@/locales/en/colors.json";
import enMasks from "@/locales/en/masks.json";
import enMaterials from "@/locales/en/materials.json";
import enSteamAchievements from "@/locales/en/steam-achievements.json";
import enTextures from "@/locales/en/textures.json";
import enTrophies from "@/locales/en/trophies.json";
import enWeaponMods from "@/locales/en/weapon-mods.json";

export default createI18n({
    locale: "en",
    fallbackLocale: "en",
    silentTranslationWarn: true,
    messages: {
        en: {
            main: enMain,
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
