import { defineStore } from "pinia";
import { nextTick, ref } from "vue";

import { getWebSocket, webSocketConnected } from "@/web-socket";

const ignoreSubscription = ref(false);

export const useAddonsStore = defineStore("addons", {
    state: () => ({
        addons: []
    }),
    getters: {
        getAddonById: (state) => (addonId) => state.addons.find((addon) => addon.id === addonId),
        getAddonIndexById: (state) => (addonId) => state.addons.findIndex((addon) => addon.id === addonId)
    },
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
                        name: "addons",
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
        },
        createAddon(addon) {
            this.addons.push(addon);
        },
        updateAddon(addon) {
            const index = this.getAddonIndexById(addon.id);
            this.addons[index] = addon;
        },
        deleteAddon(addon) {
            const index = this.getAddonIndexById(addon.id);
            this.addons.splice(index, 1);
        }
    }
});
