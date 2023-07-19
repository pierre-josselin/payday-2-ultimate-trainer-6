const fs = require("fs");
const path = require("path");
const ws = require("ws");

class WebSocketServer {
    handlers = {
        call: (data) => {
            this.callManager.addCall(data);
        },
        settings: (data) => {
            this.settingsManager.setSettings(data);
            this.settingsManager.saveSettings();
        },
        "request-game-crash-log": (data, ws) => {
            let gameCrashLog = false;
            try {
                gameCrashLog = fs.readFileSync(path.join(process.env.LOCALAPPDATA, "PAYDAY 2", "crash.txt"), { encoding: "utf8" });
            } catch (error) {
            }

            ws.send(JSON.stringify({
                type: "game-crash-log",
                data: gameCrashLog
            }));
        }
    };

    constructor(port, callManager, settingsManager) {
        this.port = port;
        this.callManager = callManager;
        this.settingsManager = settingsManager;
    }

    run() {
        this.server = new ws.WebSocketServer({
            port: this.port
        });

        this.server.on("connection", ws => {
            ws.on("message", message => {
                const { type, data } = JSON.parse(message);
                const handler = this.handlers[type];

                if (!handler) {
                    return;
                }

                handler(data, ws);
            });

            ws.send(JSON.stringify({
                type: "settings",
                data: this.settingsManager.getSettings()
            }));
        });
    }
}

module.exports = WebSocketServer;
