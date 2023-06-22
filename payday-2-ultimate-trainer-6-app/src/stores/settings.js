import { defineStore } from "pinia";

import { getWebSocket } from "@/web-socket";

export const useSettingsStore = defineStore("settings", {
    state: () => ({
        settings: {}
    }),
    actions: {
        saveSettings() {
            const ws = getWebSocket();

            const data = {
                type: "settings",
                data: this.settings
            };
            ws.send(JSON.stringify(data));
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
