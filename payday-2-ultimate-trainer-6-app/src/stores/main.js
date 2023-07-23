import { defineStore } from "pinia";

import { getWebSocket } from "@/web-socket";

export const useMainStore = defineStore("main", {
    state: () => ({
        isOffline: true,
        isInBootup: false,
        isInMainMenu: false,
        isInGame: false,
        isInHeist: false,
        isPlaying: false,
        isInCustody: false,
        isAtEndGame: false,
        isServer: false,
        isGamePaused: false,
        loadedVehicles: [],
        lastCallAcknowledgmentTime: null,
        gameCrashLog: null
    }),
    actions: {
        requestGameCrashLog() {
            this.gameCrashLog = null;

            const ws = getWebSocket();

            const data = {
                type: "request-game-crash-log"
            };
            ws.send(JSON.stringify(data));
        }
    }
});
