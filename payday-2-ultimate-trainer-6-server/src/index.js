const dotenv = require("dotenv");
const path = require("path");

const MainStore = require(path.join(__dirname, "stores", "main-store.js"));
const MissionStore = require(path.join(__dirname, "stores", "mission-store.js"));
const SettingsStore = require(path.join(__dirname, "stores", "settings-store.js"));
const SpawnStore = require(path.join(__dirname, "stores", "spawn-store.js"));

const CallManager = require(path.join(__dirname, "managers", "call-manager.js"));

const HttpServer = require(path.join(__dirname, "servers", "http-server.js"));
const WebSocketServer = require(path.join(__dirname, "servers", "web-socket-server.js"));

dotenv.config({
    path: path.join(path.dirname(path.dirname(__dirname)), ".env")
});

const mainStore = new MainStore();
const missionStore = new MissionStore();
const settingsStore = new SettingsStore(path.join(path.dirname(path.dirname(__dirname)), "settings.json"));
const spawnStore = new SpawnStore();

const callManager = new CallManager();

const managers = { callManager };
const stores = { mainStore, missionStore, settingsStore, spawnStore };

const webSocketServer = new WebSocketServer(process.env.WEB_SOCKET_SERVER_PORT, managers, stores);
const httpServer = new HttpServer(process.env.HTTP_SERVER_PORT, webSocketServer, managers, stores);

settingsStore.loadSettings();

httpServer.run();
webSocketServer.run();
