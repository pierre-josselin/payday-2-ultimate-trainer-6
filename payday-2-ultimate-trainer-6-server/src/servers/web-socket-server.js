const fs = require("fs");
const path = require("path");
const ws = require("ws");

module.exports = class WebSocketServer {
    handlers = {
        "call": (ws, data) => {
            this.callManager.addCall(data);
        },
        "store": (ws, data) => {
            const { name, state } = data;
            switch (name) {
                case "main": {
                    this.mainStore.setState(state);
                    break;
                }
                case "mission": {
                    this.missionStore.setState(state);
                    break;
                }
                case "settings": {
                    this.settingsStore.setState(state);
                    this.settingsStore.saveSettings();
                    this.callManager.addCall(["UT:loadSettings"]);
                    break;
                }
                case "spawn": {
                    this.spawnStore.setState(state);
                    break;
                }
            }
            this.sendMessageToAllClientsExceptOne("store", data, ws);
        },
        "request-game-crash-log": (ws) => {
            let gameCrashLog = false;
            try {
                gameCrashLog = fs.readFileSync(path.join(process.env.LOCALAPPDATA, "PAYDAY 2", "crash.txt"), { encoding: "utf8", flag: "r" });
            } catch (error) { }

            this.sendMessage("game-crash-log", gameCrashLog, ws);
        }
    };

    constructor(port, managers, stores) {
        this.port = port;

        this.callManager = managers.callManager;

        this.mainStore = stores.mainStore;
        this.missionStore = stores.missionStore;
        this.settingsStore = stores.settingsStore;
        this.spawnStore = stores.spawnStore;
    }

    sendMessage(type, data, client) {
        const message = { type, data };
        client.send(JSON.stringify(message));
    }

    sendMessageToAllClients(type, data) {
        if (this.server) {
            this.server.clients.forEach((client) => {
                this.sendMessage(type, data, client);
            });
        }
    }

    sendMessageToAllClientsExceptOne(type, data, excludedClient) {
        if (this.server) {
            this.server.clients.forEach((client) => {
                if (!excludedClient || excludedClient !== client) {
                    this.sendMessage(type, data, client);
                }
            });
        }
    }

    run() {
        this.server = new ws.WebSocketServer({
            port: this.port
        });

        this.server.on("connection", (ws) => {
            ws.on("message", (rawMessage) => {
                const { type, data } = JSON.parse(rawMessage);
                const handler = this.handlers[type];

                if (handler) {
                    handler(ws, data);
                }
            });

            this.sendMessage("store", { name: "main", state: this.mainStore.state }, ws);
            this.sendMessage("store", { name: "mission", state: this.missionStore.state }, ws);
            this.sendMessage("store", { name: "settings", state: this.settingsStore.state }, ws);
            this.sendMessage("store", { name: "spawn", state: this.spawnStore.state }, ws);
        });
    }
}
