import { defineStore } from "pinia";

import { getWebSocket } from "@/web-socket";

export const useCallStore = defineStore("calls", {
    actions: {
        addCall(call) {
            const ws = getWebSocket();

            const data = {
                type: "call",
                data: call
            };
            ws.send(JSON.stringify(data));
        }
    }
});
