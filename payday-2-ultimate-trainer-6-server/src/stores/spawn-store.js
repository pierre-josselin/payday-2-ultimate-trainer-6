module.exports = class SpawnStore {
    state = {};
    defaultState = {
        id: null,
        categoryId: null,
        positionType: null,
        convertedEnemies: null
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
