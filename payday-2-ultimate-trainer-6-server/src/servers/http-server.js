const http = require("http");
const url = require("url");

class HttpServer {
    routes = {
        "/calls": {
            method: "GET",
            handler: (request, response) => {
                const calls = this.callManager.getCalls();
                const body = JSON.stringify(calls);

                response.setHeader("Content-Type", "application/json");
                response.writeHead(200);
                response.end(body);
            }
        },
        "/settings": {
            method: "GET",
            handler: (request, response) => {
                const settings = this.settingsManager.getSettings();
                const body = JSON.stringify(settings);

                response.setHeader("Content-Type", "application/json");
                response.writeHead(200);
                response.end(body);
            }
        },
        "/send-message": {
            method: "GET",
            handler: (request, response) => {
                this.messageManager.sendMessage(request.query);

                response.writeHead(204);
                response.end();
            }
        }
    };

    constructor(port, callManager, settingsManager, messageManager) {
        this.port = port;
        this.callManager = callManager;
        this.settingsManager = settingsManager;
        this.messageManager = messageManager;

        this.httpRequestListener = this.httpRequestListener.bind(this);
        this.server = http.createServer(this.httpRequestListener);
    }

    httpRequestListener(request, response) {
        const parsedURL = url.parse(request.url, true);
        request.path = parsedURL.pathname;
        request.query = parsedURL.query;

        const route = this.routes[request.path];

        if (!route) {
            response.writeHead(404);
            response.end();
            return;
        }

        if (request.method !== route.method) {
            response.writeHead(405);
            response.end();
            return;
        }

        route.handler(request, response);
    };

    run() {
        this.server.listen(this.port);
    }
}

module.exports = HttpServer;
