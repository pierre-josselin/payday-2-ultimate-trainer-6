import { ref } from "vue";

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
        callStore.addCall(["UT:sendGameContext"]);
        callStore.addCall(["UT:sendLoadedVehicles"]);

        // Wait for settings
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
        const rawMessage = messageEvent.data;
        const message = JSON.parse(rawMessage);

        if (!message || !message.type || !("data" in message)) {
            return;
        }

        switch (message.type) {
            case "game-context": {
                const gameContext = message.data.split(",");

                const isInHeist = Boolean(parseInt(gameContext[3]));
                if (mainStore.isInHeist && !isInHeist) {
                    missionStore.$reset();
                    spawnStore.$reset();
                    mainStore.loadedVehicles = [];
                }

                mainStore.isOffline = false;
                mainStore.isInBootup = Boolean(parseInt(gameContext[0]));
                mainStore.isInMainMenu = Boolean(parseInt(gameContext[1]));
                mainStore.isInGame = Boolean(parseInt(gameContext[2]));
                mainStore.isInHeist = Boolean(parseInt(gameContext[3]));
                mainStore.isPlaying = Boolean(parseInt(gameContext[4]));
                mainStore.isInCustody = Boolean(parseInt(gameContext[5]));
                mainStore.isAtEndGame = Boolean(parseInt(gameContext[6]));
                mainStore.isServer = Boolean(parseInt(gameContext[7]));
                mainStore.isTeamAIEnabled = Boolean(parseInt(gameContext[8]));
                break;
            }
            case "game-paused": {
                mainStore.isGamePaused = message.data
                break;
            }
            case "loaded-vehicles": {
                mainStore.loadedVehicles = message.data.split(",");
                break;
            }
            case "game-offline": {
                if (mainStore.isGamePaused) {
                    break;
                }

                mainStore.isOffline = true;
                mainStore.isInBootup = false;
                mainStore.isInMainMenu = false;
                mainStore.isInGame = false;
                mainStore.isInHeist = false;
                mainStore.isPlaying = false;
                mainStore.isInCustody = false;
                mainStore.isAtEndGame = false;
                callStore.addCall(["UT:sendGameContext"]);
                break;
            }
            case "settings": {
                settingsStore.setSettings(message.data);
                break;
            }
            case "call-acknowledge": {
                mainStore.lastCallAcknowledgmentTime = message.data;
                break;
            }
            case "game-crash-log": {
                setTimeout(() => mainStore.gameCrashLog = message.data, 500);
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
