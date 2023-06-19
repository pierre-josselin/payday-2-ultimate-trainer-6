const dotenv = require("dotenv");
const path = require("path");

const CallManager = require(path.join(__dirname, "managers", "call-manager.js"));
const SettingsManager = require(path.join(__dirname, "managers", "settings-manager.js"));
const HttpServer = require(path.join(__dirname, "servers", "http-server.js"));
const WebSocketServer = require(path.join(__dirname, "servers", "web-socket-server.js"));

dotenv.config({
    path: path.join(path.dirname(path.dirname(__dirname)), ".env")
});

const callManager = new CallManager();
const settingsManager = new SettingsManager(path.join(path.dirname(path.dirname(__dirname)), "settings.json"));

const httpServer = new HttpServer(process.env.HTTP_SERVER_PORT, callManager, settingsManager);
const webSocketServer = new WebSocketServer(process.env.WEB_SOCKET_SERVER_PORT, callManager, settingsManager);

settingsManager.loadSettings();

httpServer.run();
webSocketServer.run();
