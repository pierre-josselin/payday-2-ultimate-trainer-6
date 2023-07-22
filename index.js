const fs = require("fs/promises");
const os = require("os");
const path = require("path");
const util = require("util");
const exec = util.promisify(require("child_process").exec);

async function getEnv() {
    let data;
    try {
        data = await fs.readFile(path.join(__dirname, ".env"), { encoding: "utf-8" });
    } catch (error) {
        if (error.code === "ENOENT") {
            throw new Error("The environment file was not found. Did you run the install?");
        }
        throw error;
    }

    return data
        .split(/\r?\n/)
        .filter(element => element)
        .map(element => element.split("="))
        .reduce((acc, [key, value]) => ({ ...acc, [key]: value }), {});
}

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
    const env = await getEnv();

    exec(["cd", `"${path.join(__dirname, "payday-2-ultimate-trainer-6-server")}"`, "&&", "npm", "run", "start"].join(" "));

    const port = env.APP_PORT || 1140;
    exec(["http-server", "--port", port, "--proxy", `"http://127.0.0.1:${port}?"`, `"${path.join(__dirname, "payday-2-ultimate-trainer-6-app", "dist")}"`].join(" "));

    console.log("Server running...");
    console.log("Application running...\n");
    console.log(`http://127.0.0.1:${port}\n`);
    console.log("Close this window before restarting the game.");
}

async function getRemoteURL() {
    const env = await getEnv();

    console.log("The app should be accessible from any device on the same network at the following URL:\n");

    const networkInterfaces = Object.values(os.networkInterfaces()).flat(1);

    for (const networkInterface of networkInterfaces) {
        const family = typeof networkInterface.family === "string" ? "IPv4" : 4;

        if (!networkInterface.internal && networkInterface.family === family) {
            console.log(`http://${networkInterface.address}:${env.APP_PORT}`);
        }
    }
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
        case "get-remote-url": {
            await getRemoteURL();
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
