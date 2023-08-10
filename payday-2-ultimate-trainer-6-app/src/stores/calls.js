import { defineStore } from "pinia";

import { getWebSocket } from "@/web-socket";

export const useCallStore = defineStore("calls", {
    actions: {
        addCall(call) {
            const ws = getWebSocket();
            ws.send(JSON.stringify({
                type: "call",
                data: call
            }));
        }
    }
});
