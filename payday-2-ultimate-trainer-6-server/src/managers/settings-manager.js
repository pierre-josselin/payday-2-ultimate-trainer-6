const fs = require("fs");

class SettingsManager {
    settings = {};

    constructor(settingsFilePath) {
        this.settingsFilePath = settingsFilePath;
    }

    loadSettings() {
        try {
            const data = fs.readFileSync(this.settingsFilePath);
            this.settings = JSON.parse(data);
        } catch (error) {
            if (error.code === "ENOENT") {
                this.saveSettings();
            }
        }
    }

    saveSettings() {
        const settings = JSON.stringify(this.settings);
        fs.writeFileSync(this.settingsFilePath, settings);
    }

    getSettings() {
        return this.settings;
    }

    setSettings(settings) {
        this.settings = settings;
    }

    setSetting(name, value) {
        this.settings[name] = value;
    }
}

module.exports = SettingsManager;
