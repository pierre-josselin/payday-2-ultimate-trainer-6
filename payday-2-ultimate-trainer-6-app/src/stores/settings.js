import { defineStore } from "pinia";
import { nextTick, ref } from "vue";

import { useCallStore } from "@/stores/calls";
import { getWebSocket, webSocketConnected } from "@/web-socket";

const SETTING_NAMES_BY_VARIABLE_NAMES = {
    locale: "locale",
    theme: "theme",
    enableHideUltimateTrainerButton: "enable-hide-ultimate-trainer-button",
    enableSkillPointHack: "enable-skill-point-hack",
    skillPoints: "skill-points",
    enableGodMode: "enable-god-mode",
    enableNoFallDamage: "enable-no-fall-damage",
    enableInfiniteStamina: "enable-infinite-stamina",
    enableCanRunDirectional: "enable-can-run-directional",
    enableCanRunWithAnyBag: "enable-can-run-with-any-bag",
    enableInstantMaskOn: "enable-instant-mask-on",
    enableNoCarryCooldown: "enable-no-carry-cooldown",
    enableNoFlashbangs: "enable-no-flashbangs",
    enableInstantInteraction: "enable-instant-interaction",
    enableInstantDeployment: "enable-instant-deployment",
    enableUnlimitedEquipment: "enable-unlimited-equipment",
    enableInstantWeaponSwap: "enable-instant-weapon-swap",
    enableInstantWeaponReload: "enable-instant-weapon-reload",
    enableNoWeaponRecoil: "enable-no-weapon-recoil",
    enableNoWeaponSpread: "enable-no-weapon-spread",
    enableShootThroughWalls: "enable-shoot-through-walls",
    enableUnlimitedAmmo: "enable-unlimited-ammo",
    enableNoSlowMotion: "enable-no-slow-motion",
    enableMoveSpeedMultiplier: "enable-move-speed-multiplier",
    enableThrowDistanceMultiplier: "enable-throw-distance-multiplier",
    enableFireRateMultiplier: "enable-fire-rate-multiplier",
    enableDamageMultiplier: "enable-damage-multiplier",
    moveSpeedMultiplier: "move-speed-multiplier",
    throwDistanceMultiplier: "throw-distance-multiplier",
    fireRateMultiplier: "fire-rate-multiplier",
    damageMultiplier: "damage-multiplier",
    vehiclesToLoad: "vehicles-to-load",
    enablePauseStatsPublishing: "enable-pause-stats-publishing",
    enableHideModList: "enable-hide-mod-list"
};

const VARIABLE_NAMES_BY_SETTING_NAMES = Object.fromEntries(Object.entries(SETTING_NAMES_BY_VARIABLE_NAMES).map(name => name.reverse()));

const ignoreSubscription = ref(false);

export const useSettingsStore = defineStore("settings", {
    state: () => ({
        // Global
        locale: "en",
        theme: "darkly",
        enableHideUltimateTrainerButton: false,

        // Career
        enableSkillPointHack: false,
        skillPoints: null,

        // Cheats
        enableGodMode: false,
        enableNoFallDamage: false,
        enableInfiniteStamina: false,
        enableCanRunDirectional: false,
        enableCanRunWithAnyBag: false,
        enableInstantMaskOn: false,
        enableNoCarryCooldown: false,
        enableNoFlashbangs: false,
        enableInstantInteraction: false,
        enableInstantDeployment: false,
        enableUnlimitedEquipment: false,
        enableInstantWeaponSwap: false,
        enableInstantWeaponReload: false,
        enableNoWeaponRecoil: false,
        enableNoWeaponSpread: false,
        enableShootThroughWalls: false,
        enableUnlimitedAmmo: false,
        enableNoSlowMotion: false,
        enableMoveSpeedMultiplier: false,
        enableThrowDistanceMultiplier: false,
        enableFireRateMultiplier: false,
        enableDamageMultiplier: false,
        moveSpeedMultiplier: 2,
        throwDistanceMultiplier: 2,
        fireRateMultiplier: 2,
        damageMultiplier: 2,

        // Driving
        vehiclesToLoad: [],

        // Game
        enablePauseStatsPublishing: false,
        enableHideModList: false
    }),
    actions: {
        subscribe() {
            const callStore = useCallStore();

            this.$subscribe(() => {
                if (ignoreSubscription.value || !webSocketConnected()) {
                    return;
                }

                const ws = getWebSocket();

                const data = {
                    type: "settings",
                    data: this.getSettings()
                };
                ws.send(JSON.stringify(data));

                callStore.addCall(["UT:requestSettings"]);
            })
        },
        getSettings() {
            const settings = {};
            for (const [name, value] of Object.entries(this.$state)) {
                if (name in SETTING_NAMES_BY_VARIABLE_NAMES) {
                    settings[SETTING_NAMES_BY_VARIABLE_NAMES[name]] = value;
                }
            }
            return settings;
        },
        setSettings(settings) {
            ignoreSubscription.value = true;
            for (const [name, value] of Object.entries(settings)) {
                if (name in VARIABLE_NAMES_BY_SETTING_NAMES) {
                    this[VARIABLE_NAMES_BY_SETTING_NAMES[name]] = value;
                }
            }
            nextTick(() => {
                ignoreSubscription.value = false;
            });
        }
    }
});
