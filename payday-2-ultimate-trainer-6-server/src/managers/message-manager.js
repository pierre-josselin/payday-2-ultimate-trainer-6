class MessageManager {
    constructor(webSocketServer) {
        this.webSocketServer = webSocketServer;
    }

    sendMessage(message) {
        this.webSocketServer.server.clients.forEach(function (ws) {
            ws.send(JSON.stringify(message));
        });
    }
}

module.exports = MessageManager;
