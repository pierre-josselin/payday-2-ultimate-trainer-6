import { defineStore } from "pinia";

import { getWebSocket } from "@/web-socket";

export const useAppStore = defineStore("app", {
    state: () => ({
        gameCrashLog: null
    }),
    actions: {
        requestGameCrashLog() {
            this.gameCrashLog = null;

            const ws = getWebSocket();
            ws.send(JSON.stringify({
                type: "request-game-crash-log"
            }));
        }
    }
});
