const childProcess = require("child_process")
const fs = require("fs/promises");
const os = require("os");
const path = require("path");
const util = require("util");

const exec = util.promisify(childProcess.exec);

async function getEnv() {
    const data = await fs.readFile(path.join(__dirname, ".env"), { encoding: "utf-8" });

    return data
        .split(/\r?\n/)
        .filter(element => element)
        .map(element => element.split("="))
        .reduce((acc, [key, value]) => ({ ...acc, [key]: value }), {});
}

async function install() {
    console.log("--- INSTALLATION ---\n");

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

    process.stdout.write(" OK\n");

    process.stdout.write("Creating install status file...");

    fs.writeFile(path.join(__dirname, "installed"), "w");

    process.stdout.write(" OK\n\n");

    console.log("Successfully installed!");
}

async function run() {
    console.log("--- RUN ---\n");

    const env = getEnv();

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

async function test() {
    console.log("--- TEST ---\n");
    console.log("You must close this window before using the mod!\n");

    process.stdout.write("Checking Node.js version...");

    process.stdout.write(String(process.version).startsWith("v18") ? " OK\n" : ` ${process.version} (could be incompatible)\n`);

    process.stdout.write("Checking installation status...");

    try {
        await fs.readFile(path.join(__dirname, "installed"));
    } catch (error) {
        throw new Error("The project is not installed.\nPlease install it following the instructions.");
    }

    process.stdout.write(" OK\n");

    const env = await getEnv();

    const tests = [
        {
            message: "Testing application web server...",
            command: ["http-server", "--port", env.APP_PORT, "--proxy", `"http://127.0.0.1:${env.APP_PORT}?"`, `"${path.join(__dirname, "payday-2-ultimate-trainer-6-app", "dist")}"`].join(" ")
        },
        {
            message: "Testing server...",
            command: ["cd", `"${path.join(__dirname, "payday-2-ultimate-trainer-6-server")}"`, "&&", "npm", "run", "start"].join(" ")
        }
    ];

    for (const test of tests) {
        process.stdout.write(test.message);

        const result = {};
        childProcess.exec(test.command, function (error, stdout, stderr) {
            result.error = error;
            result.stdout = stdout;
            result.stderr = stderr;
        });

        await new Promise(resolve => setTimeout(resolve, 5000));

        if (result.error) {
            throw new Error(result);
        }

        process.stdout.write(" OK\n");
    }

    console.log("\nAll tests passed!\nYou can now close this window.");
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
        case "test": {
            await test();
            break;
        }
        default: {
            throw new Error("Invalid command.");
        }
    }
}

main().catch(error => {
    console.error("\n\nAn error has occurred:\n");

    if (error.message) {
        console.error(error.message);
    } else if (error.stdout || error.stderr) {
        console.error(error.stdout, error.stderr);
    } else {
        console.error(error);
    }
});
