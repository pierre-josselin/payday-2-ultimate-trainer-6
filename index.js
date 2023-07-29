const fs = require("fs/promises");
const os = require("os");
const path = require("path");
const util = require("util");
const exec = util.promisify(require("child_process").exec);

async function install() {
    process.stdout.write("Creating environment file...");

    await fs.copyFile(path.join(__dirname, ".env.example"), path.join(__dirname, ".env"));

    process.stdout.write(" OK\n");

    process.stdout.write("Creating config file...");

    await fs.copyFile(path.join(__dirname, "payday-2-ultimate-trainer-6-mod", "config.lua.example"), path.join(__dirname, "payday-2-ultimate-trainer-6-mod", "config.lua"));

    process.stdout.write(" OK\n");

    process.stdout.write("Installing http-server...");

    await exec(["npm", "install", "-g", "http-server@14.1.1"].join(" "));

    process.stdout.write(" OK\n");

    process.stdout.write("Installing application...");

    await exec(["cd", `"${path.join(__dirname, "payday-2-ultimate-trainer-6-app")}"`, "&&", "npm", "install"].join(" "));

    process.stdout.write(" OK\n");

    process.stdout.write("Building application...");

    await exec(["cd", `"${path.join(__dirname, "payday-2-ultimate-trainer-6-app")}"`, "&&", "npm", "run", "build"].join(" "));

    process.stdout.write(" OK\n");

    process.stdout.write("Installing server...");

    await exec(["cd", `"${path.join(__dirname, "payday-2-ultimate-trainer-6-server")}"`, "&&", "npm", "install"].join(" "));

    process.stdout.write(" OK\n\n");

    console.log("Successfully installed!");
}

async function run() {
    let data;
    try {
        data = await fs.readFile(path.join(__dirname, ".env"), { encoding: "utf-8" });
    } catch (error) {
        if (error.code === "ENOENT") {
            throw new Error("The environment file was not found.\nDid you run the install script?");
        }
        throw error;
    }

    const env = data
        .split(/\r?\n/)
        .filter(element => element)
        .map(element => element.split("="))
        .reduce((acc, [key, value]) => ({ ...acc, [key]: value }), {});

    if (!env.APP_PORT) {
        throw new Error("Application port is missing.");
    }

    exec(["cd", `"${path.join(__dirname, "payday-2-ultimate-trainer-6-server")}"`, "&&", "npm", "run", "start"].join(" "));

    exec(["http-server", "--port", env.APP_PORT, "--proxy", `"http://127.0.0.1:${env.APP_PORT}?"`, `"${path.join(__dirname, "payday-2-ultimate-trainer-6-app", "dist")}"`].join(" "));

    console.log("Server & application running...\n");

    console.log("Application URL:");

    let networkInterfaces = Object.values(os.networkInterfaces()).flat(1);
    networkInterfaces = networkInterfaces.filter(networkInterface => ["IPv4", 4].includes(networkInterface.family));
    networkInterfaces.sort((a, b) => a.internal < b.internal ? 1 : -1);

    for (const networkInterface of networkInterfaces) {
        console.log(`http://${networkInterface.address}:${env.APP_PORT} (from ${networkInterface.internal ? "this computer" : "local network"})`);
    }

    console.log("\nClose this window before restarting the game.");
}

async function main() {
    console.log("PAYDAY 2 - Ultimate Trainer 6\n");

    if (process.platform !== "win32") {
        throw new Error("Platform not supported.");
    }

    if (process.argv.length !== 3) {
        throw new Error("Invalid arguments.");
    }

    switch (process.argv[2]) {
        case "install": {
            await install();
            break;
        }
        case "run": {
            await run();
            break;
        }
        default: {
            throw new Error("Invalid command.");
        }
    }
}

main().catch(error => {
    console.error("\nAn error has occurred:\n");

    if (error.message) {
        console.error(error.message);
    } else if (error.stdout || error.stderr) {
        console.error(error.stdout, error.stderr);
    } else {
        console.error(error);
    }
});
