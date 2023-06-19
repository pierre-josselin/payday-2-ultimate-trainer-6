const ws = require("ws");

class WebSocketServer {
    handlers = {
        call: (data) => {
            this.callManager.addCall(data);
        },
        setting: (data) => {
            this.settingsManager.setSetting(data.name, data.value);
            this.settingsManager.saveSettings();
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

                handler(data);
            });

            const data = {
                type: "settings",
                data: this.settingsManager.getSettings()
            };
            ws.send(JSON.stringify(data));
        });
    }
}

module.exports = WebSocketServer;
