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
        callStore.addCall(["UT:sendGameState"]);
        callStore.addCall(["UT:sendIsHost"]);
        callStore.addCall(["UT:sendVehiclesPackagesLoaded"]);

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

        if (!message || !message.type || !message.data) {
            return;
        }

        switch (message.type) {
            case "game-state": {
                const gameState = message.data;

                if (mainStore.isInGame && typeof gameState === "string" && (!gameState.startsWith("ingame_") || gameState === "ingame_waiting_for_players")) {
                    missionStore.$reset();
                    spawnStore.id = null;
                }

                if (gameState === "offline") {
                    callStore.addCall(["UT:sendGameState"]);
                }

                mainStore.gameState = gameState;
                break;
            }
            case "is-host": {
                mainStore.isHost = message.data === "true";
                break;
            }
            case "vehicles-packages-loaded": {
                mainStore.vehiclesPackagesLoaded = message.data === "true";
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
        }
    });
}

export function closeWebSocket() {
    ws.close();
}

export function webSocketConnected() {
    return connected.value;
}
