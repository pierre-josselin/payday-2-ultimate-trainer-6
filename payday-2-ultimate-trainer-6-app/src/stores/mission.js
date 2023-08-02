import { defineStore } from "pinia";
import { nextTick, ref } from "vue";

import { getWebSocket, webSocketConnected } from "@/web-socket";

const ignoreSubscription = ref(false);

export const useMissionStore = defineStore("mission", {
    state: () => ({
        enableXRay: false,
        enablePreventAlarmTriggering: false,
        enableNoClip: false,
        enableInvisiblePlayer: false,
        enableDisableAI: false,
        enableRemoveTeamAI: false,
        enableSuspendPointOfNoReturnTimer: false,
        enableUnlimitedPagers: false,
        enableInstantDrilling: false,
        enableCarryStacker: false,
        enableNoCivilianKillPenalty: false,
        noClipSpeed: 10,
        replenishType: "equipment",
        enableSlowMotion: false,
        slowMotionWorldSpeed: 0.2,
        slowMotionPlayerSpeed: 0.5
    }),
    actions: {
        subscribe() {
            this.$subscribe(() => {
                if (ignoreSubscription.value || !webSocketConnected()) {
                    return;
                }

                const ws = getWebSocket();

                const data = {
                    type: "store",
                    data: {
                        name: "mission",
                        state: this.$state
                    }
                };

                ws.send(JSON.stringify(data));
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
