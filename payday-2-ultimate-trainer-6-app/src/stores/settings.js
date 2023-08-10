import { defineStore } from "pinia";
import { nextTick, ref } from "vue";

import { getWebSocket, webSocketConnected } from "@/web-socket";

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
            this.$subscribe(() => {
                if (ignoreSubscription.value || !webSocketConnected()) {
                    return;
                }

                const ws = getWebSocket();
                ws.send(JSON.stringify({
                    type: "store",
                    data: {
                        name: "settings",
                        state: this.$state
                    }
                }));
            });
        },
        setState(state) {
            ignoreSubscription.value = true;
            for (const [name, value] of Object.entries(state)) {
                if (name in this.$state) {
                    this.$state[name] = value;
                }
            }
            nextTick(() => {
                ignoreSubscription.value = false;
            });
        }
    }
});
