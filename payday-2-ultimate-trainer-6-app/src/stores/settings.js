import { defineStore } from "pinia";

import { useCallStore } from "@/stores/calls";

import { getWebSocket } from "@/web-socket";

export const useSettingsStore = defineStore("settings", {
    state: () => ({
        settings: {}
    }),
    actions: {
        saveSettings() {
            const callStore = useCallStore();

            const ws = getWebSocket();

            const data = {
                type: "settings",
                data: this.settings
            };
            ws.send(JSON.stringify(data));

            callStore.addCall(["UT:requestSettings"]);
        },
        getSetting(name) {
            return typeof this.settings[name] !== "undefined" ? this.settings[name] : null;
        },
        setSetting(name, value) {
            this.settings[name] = value;
        },
        setSettings(settings) {
            this.settings = settings;
        }
    }
});
