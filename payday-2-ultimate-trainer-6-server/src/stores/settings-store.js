const fs = require("fs");

module.exports = class SettingsStore {
    state = {};
    defaultState = {
        // Global
        locale: "en",
        theme: "darkly",
        enableHideUltimateTrainerButton: false,

        // Career
        enableSkillPointHack: false,
        skillPoints: null,

        // Cheats
        enableGodMode: false,
        enableNoFallDamage: false,
        enableInfiniteStamina: false,
        enableCanRunDirectional: false,
        enableCanRunWithAnyBag: false,
        enableInstantMaskOn: false,
        enableNoCarryCooldown: false,
        enableNoFlashbangs: false,
        enableInstantInteraction: false,
        enableInstantDeployment: false,
        enableUnlimitedEquipment: false,
        enableInstantWeaponSwap: false,
        enableInstantWeaponReload: false,
        enableNoWeaponRecoil: false,
        enableNoWeaponSpread: false,
        enableShootThroughWalls: false,
        enableUnlimitedAmmo: false,
        enableNoSlowMotion: false,
        enableMoveSpeedMultiplier: false,
        enableThrowDistanceMultiplier: false,
        enableFireRateMultiplier: false,
        enableDamageMultiplier: false,
        moveSpeedMultiplier: 2,
        throwDistanceMultiplier: 2,
        fireRateMultiplier: 2,
        damageMultiplier: 2,

        // Driving
        vehiclesToLoad: [],

        // Game
        enablePauseStatsPublishing: false,
        enableHideModList: false
    };

    settingNamesByVariableNames = {
        locale: "locale",
        theme: "theme",
        enableHideUltimateTrainerButton: "enable-hide-ultimate-trainer-button",
        enableSkillPointHack: "enable-skill-point-hack",
        skillPoints: "skill-points",
        enableGodMode: "enable-god-mode",
        enableNoFallDamage: "enable-no-fall-damage",
        enableInfiniteStamina: "enable-infinite-stamina",
        enableCanRunDirectional: "enable-can-run-directional",
        enableCanRunWithAnyBag: "enable-can-run-with-any-bag",
        enableInstantMaskOn: "enable-instant-mask-on",
        enableNoCarryCooldown: "enable-no-carry-cooldown",
        enableNoFlashbangs: "enable-no-flashbangs",
        enableInstantInteraction: "enable-instant-interaction",
        enableInstantDeployment: "enable-instant-deployment",
        enableUnlimitedEquipment: "enable-unlimited-equipment",
        enableInstantWeaponSwap: "enable-instant-weapon-swap",
        enableInstantWeaponReload: "enable-instant-weapon-reload",
        enableNoWeaponRecoil: "enable-no-weapon-recoil",
        enableNoWeaponSpread: "enable-no-weapon-spread",
        enableShootThroughWalls: "enable-shoot-through-walls",
        enableUnlimitedAmmo: "enable-unlimited-ammo",
        enableNoSlowMotion: "enable-no-slow-motion",
        enableMoveSpeedMultiplier: "enable-move-speed-multiplier",
        enableThrowDistanceMultiplier: "enable-throw-distance-multiplier",
        enableFireRateMultiplier: "enable-fire-rate-multiplier",
        enableDamageMultiplier: "enable-damage-multiplier",
        moveSpeedMultiplier: "move-speed-multiplier",
        throwDistanceMultiplier: "throw-distance-multiplier",
        fireRateMultiplier: "fire-rate-multiplier",
        damageMultiplier: "damage-multiplier",
        vehiclesToLoad: "vehicles-to-load",
        enablePauseStatsPublishing: "enable-pause-stats-publishing",
        enableHideModList: "enable-hide-mod-list"
    };

    constructor(settingsFilePath) {
        this.settingsFilePath = settingsFilePath;
        this.variableNamesBySettingNames = Object.fromEntries(Object.entries(this.settingNamesByVariableNames).map(name => name.reverse()));
        this.reset();
    }

    reset() {
        this.state = { ...this.defaultState };
    }

    setState(state) {
        this.state = { ...state };
        this.saveSettings();
    }

    loadSettings() {
        let data;
        const options = { encoding: "utf8", flag: "r" };

        try {
            data = fs.readFileSync(this.settingsFilePath, options);
        } catch (error) {
            if (error.code === "ENOENT") {
                this.saveSettings();
            } else {
                throw error;
            }
            return;
        }

        const settings = JSON.parse(data);
        this.setStateFromSettings(settings);
    }

    saveSettings() {
        const data = JSON.stringify(this.getSettingsFromState());
        const options = { encoding: "utf8", flag: "w" };
        fs.writeFileSync(this.settingsFilePath, data, options);
    }

    getSettingsFromState() {
        const settings = {};
        for (const [name, value] of Object.entries(this.state)) {
            if (name in this.settingNamesByVariableNames) {
                settings[this.settingNamesByVariableNames[name]] = value;
            }
        }
        return settings;
    }

    setStateFromSettings(settings) {
        for (const [name, value] of Object.entries(settings)) {
            if (name in this.variableNamesBySettingNames) {
                this.state[this.variableNamesBySettingNames[name]] = value;
            }
        }
    }
};
