import { defineStore } from "pinia";
import { nextTick, ref } from "vue";

import { getWebSocket, webSocketConnected } from "@/web-socket";

const ignoreSubscription = ref(false);

export const useSpawnStore = defineStore("spawn", {
    state: () => ({
        id: null,
        categoryId: null,
        positionType: null,
        convertedEnemies: null
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
                        name: "spawn",
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
