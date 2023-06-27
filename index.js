const fs = require("fs/promises");
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
    process.stdout.write("Reading environment file...");

    const data = await fs.readFile(path.join(__dirname, ".env"), { encoding: "utf-8" });

    const env = data
        .split(/\r?\n/)
        .filter(element => element)
        .map(element => element.split("="))
        .reduce((acc, [key, value]) => ({ ...acc, [key]: value }), {});

    process.stdout.write(" OK\n");

    process.stdout.write("Running server...");

    exec(["cd", `"${path.join(__dirname, "payday-2-ultimate-trainer-6-server")}"`, "&&", "npm", "run", "start"].join(" "));

    process.stdout.write(" OK\n");

    process.stdout.write("Running application...");

    exec(["http-server", "-p", env.APP_PORT || 1140, `"${path.join(__dirname, "payday-2-ultimate-trainer-6-app", "dist")}"`].join(" "));

    process.stdout.write(" OK\n");
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
