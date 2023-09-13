module.exports = class SpawnStore {
    state = {};
    defaultState = {
        id: null,
        categoryId: "enemies",
        positionType: "on-crosshair",
        convertedEnemies: false
    };

    constructor() {
        this.reset();
    }

    reset() {
        this.state = { ...this.defaultState };
    }

    setState(state) {
        this.state = { ...state };
    }
};
