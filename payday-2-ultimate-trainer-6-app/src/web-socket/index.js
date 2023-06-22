import { ref } from "vue";

let ws = null;
const connected = ref(false);

export function getWebSocket() {
    return ws;
}

export function createWebSocket(options) {
    const url = `ws://${options.host}:${options.port}`;
    ws = new WebSocket(url);

    ws.addEventListener("open", () => {
        connected.value = true;
        options.connectionErrorCallback = null;
        options.callStore.addCall(["UT:sendGameState"]);
        options.router.push({ name: "home" });
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
        options.mainStore.$reset();
    });

    ws.addEventListener("message", (messageEvent) => {
        const rawMessage = messageEvent.data;
        const message = JSON.parse(rawMessage);

        if (!message || !message.type || !message.data) {
            return;
        }

        switch (message.type) {
            case "game-state": {
                options.mainStore.setGameState(message.data);
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
