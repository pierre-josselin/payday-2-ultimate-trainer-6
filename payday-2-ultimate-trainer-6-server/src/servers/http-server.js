const http = require("http");
const url = require("url");

module.exports = class HttpServer {
    lastCallRequestTime = null;

    routes = {
        "/get-calls": {
            method: "GET",
            handler: (request, response) => {
                const calls = this.callManager.getCalls();
                const body = JSON.stringify(calls);

                this.lastCallRequestTime = Date.now();

                response.setHeader("Content-Type", "application/json");
                response.writeHead(200);
                response.end(body);

                if (calls.length > 0) {
                    this.mainStore.state.lastCallsReceivedTime = this.lastCallRequestTime;
                    this.webSocketServer.sendMessageToAllClients("store", { name: "main", state: this.mainStore.state });
                }
            }
        },
        "/send-message": {
            method: "GET",
            handler: (request, response) => {
                const body = request.query.body;
                const message = JSON.parse(atob(body));
                const { type, data } = message;

                switch (type) {
                    case "game-context": {
                        if (this.mainStore.state.isInHeist && !data.isInHeist) {
                            this.mainStore.state.loadedVehicles = [];
                            this.missionStore.reset();
                            this.spawnStore.reset();

                            this.webSocketServer.sendMessageToAllClients("store", { name: "mission", state: this.missionStore.state });
                            this.webSocketServer.sendMessageToAllClients("store", { name: "spawn", state: this.spawnStore.state });
                        }

                        this.mainStore.state.isOffline = false;
                        this.mainStore.state.isInBootup = data.isInBootup;
                        this.mainStore.state.isInMainMenu = data.isInMainMenu;
                        this.mainStore.state.isInGame = data.isInGame;
                        this.mainStore.state.isInHeist = data.isInHeist;
                        this.mainStore.state.isPlaying = data.isPlaying;
                        this.mainStore.state.isInCustody = data.isInCustody;
                        this.mainStore.state.isAtEndGame = data.isAtEndGame;
                        this.mainStore.state.isServer = data.isServer;
                        this.mainStore.state.isTeamAIEnabled = data.isTeamAIEnabled;

                        this.webSocketServer.sendMessageToAllClients("store", { name: "main", state: this.mainStore.state });
                        break;
                    }
                    case "game-paused": {
                        this.mainStore.state.isGamePaused = data;

                        this.webSocketServer.sendMessageToAllClients("store", { name: "main", state: this.mainStore.state });
                        break;
                    }
                    case "loaded-vehicles": {
                        this.mainStore.state.loadedVehicles = data;

                        this.webSocketServer.sendMessageToAllClients("store", { name: "main", state: this.mainStore.state });
                        break;
                    }
                    case "store-property-value": {
                        switch (data.storeName) {
                            case "mission": {
                                this.missionStore.state[data.propertyName] = data.propertyValue;
                                this.webSocketServer.sendMessageToAllClients("store", { name: "mission", state: this.missionStore.state });
                                break;
                            }
                            case "spawn": {
                                this.spawnStore.state[data.propertyName] = data.propertyValue;
                                this.webSocketServer.sendMessageToAllClients("store", { name: "spawn", state: this.spawnStore.state });
                                break;
                            }
                            case "settings": {
                                this.settingsStore.state[data.propertyName] = data.propertyValue;
                                this.webSocketServer.sendMessageToAllClients("store", { name: "settings", state: this.settingsStore.state });
                                this.settingsStore.saveSettings();
                                this.callManager.addCall(["UT:loadSettings"]);
                                break;
                            }
                            default: {
                                response.writeHead(400);
                                response.end();
                                break;
                            }
                        }
                        break;
                    }
                    default: {
                        response.writeHead(400);
                        response.end();
                        return;
                    }
                }

                response.writeHead(204);
                response.end();
            }
        }
    };

    constructor(port, webSocketServer, managers, stores) {
        this.port = port;
        this.webSocketServer = webSocketServer;

        this.callManager = managers.callManager;

        this.mainStore = stores.mainStore;
        this.missionStore = stores.missionStore;
        this.spawnStore = stores.spawnStore;
        this.settingsStore = stores.settingsStore;

        this.httpRequestListener = this.httpRequestListener.bind(this);
        this.server = http.createServer(this.httpRequestListener);

        setInterval(() => {
            if (this.lastCallRequestTime !== null && Date.now() - this.lastCallRequestTime > 1500) {
                if (!this.mainStore.state.isGamePaused) {
                    this.mainStore.state.isOffline = true;
                    this.mainStore.state.isInBootup = false;
                    this.mainStore.state.isInMainMenu = false;
                    this.mainStore.state.isInGame = false;
                    this.mainStore.state.isInHeist = false;
                    this.mainStore.state.isPlaying = false;
                    this.mainStore.state.isInCustody = false;
                    this.mainStore.state.isAtEndGame = false;

                    this.webSocketServer.sendMessageToAllClients("store", { name: "main", state: this.mainStore.state });
                    this.callManager.addCall(["UT:sendGameContext"]);
                }
                this.lastCallRequestTime = null;
            }
        }, 100);
    }

    httpRequestListener(request, response) {
        const { pathname: path, query } = url.parse(request.url, true);
        request.query = query;

        const route = this.routes[path];

        if (!route) {
            response.writeHead(404);
            response.end();
            return;
        }

        if (request.method.toUpperCase() !== route.method.toUpperCase()) {
            response.writeHead(405);
            response.end();
            return;
        }

        route.handler(request, response);
    }

    run() {
        this.server.listen(this.port);
    }
}
