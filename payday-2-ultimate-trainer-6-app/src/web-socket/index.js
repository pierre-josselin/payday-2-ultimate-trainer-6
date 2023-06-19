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
    });
}

export function closeWebSocket() {
    ws.close();
}

export function webSocketConnected() {
    return connected.value;
}
