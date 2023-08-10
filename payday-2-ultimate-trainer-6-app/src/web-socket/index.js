import { ref } from "vue";

import { useAppStore } from "@/stores/app";
import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";
import { useSettingsStore } from "@/stores/settings";
import { useMissionStore } from "@/stores/mission";
import { useSpawnStore } from "@/stores/spawn";

let ws = null;
const connected = ref(false);

export function getWebSocket() {
    return ws;
}

export function createWebSocket(options) {
    const appStore = useAppStore();
    const mainStore = useMainStore();
    const callStore = useCallStore();
    const settingsStore = useSettingsStore();
    const missionStore = useMissionStore();
    const spawnStore = useSpawnStore();

    const url = `ws://${options.host}:${options.port}`;
    ws = new WebSocket(url);

    ws.addEventListener("open", () => {
        connected.value = true;
        options.connectionErrorCallback = null;

        setTimeout(() => {
            options.router.push({ name: "home" });
        }, 500);
    });

    ws.addEventListener("error", () => {
        if (options.connectionErrorCallback) {
            options.connectionErrorCallback();
        }
    });

    ws.addEventListener("close", () => {
        connected.value = false;
        ws = null;
        options.router.push({ name: "connect" });
        mainStore.$reset();
        callStore.$reset();
        settingsStore.$reset();
        missionStore.$reset();
        spawnStore.$reset();
    });

    ws.addEventListener("message", (messageEvent) => {
        const { type, data } = JSON.parse(messageEvent.data);

        switch (type) {
            case "store": {
                const { name, state } = data;
                switch (name) {
                    case "main": {
                        mainStore.setState(state);
                        break;
                    }
                    case "mission": {
                        missionStore.setState(state);
                        break;
                    }
                    case "settings": {
                        settingsStore.setState(state);
                        break;
                    }
                    case "spawn": {
                        spawnStore.setState(state);
                        break;
                    }
                }
                break;
            }
            case "game-crash-log": {
                setTimeout(() => appStore.gameCrashLog = data, 500);
                break;
            }
        }
    });
}

export function closeWebSocket() {
    ws.close();
}

export function webSocketConnected() {
    return connected.value;
}
