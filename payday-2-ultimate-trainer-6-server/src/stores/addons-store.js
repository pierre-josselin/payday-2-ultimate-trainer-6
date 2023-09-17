const fs = require("fs");

module.exports = class AddonsStore {
    state = {};
    defaultState = {
        addons: []
    };

    constructor(addonsFilePath) {
        this.addonsFilePath = addonsFilePath;
        this.reset();
    }

    reset() {
        this.state = { ...this.defaultState };
    }

    setState(state) {
        this.state = { ...state };
    }

    loadAddons() {
        let data;
        const options = { encoding: "utf8", flag: "r" };

        try {
            data = fs.readFileSync(this.addonsFilePath, options);
        } catch (error) {
            if (error.code === "ENOENT") {
                this.saveAddons();
            } else {
                throw error;
            }
            return;
        }

        const addons = JSON.parse(data);
        this.setState(addons);
    }

    saveAddons() {
        const data = JSON.stringify(this.state);
        const options = { encoding: "utf8", flag: "w" };
        fs.writeFileSync(this.addonsFilePath, data, options);
    }
};
