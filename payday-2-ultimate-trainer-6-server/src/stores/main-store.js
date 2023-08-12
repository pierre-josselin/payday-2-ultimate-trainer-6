module.exports = class MainStore {
    state = {};
    defaultState = {
        isOffline: true,
        isInBootup: false,
        isInMainMenu: false,
        isInGame: false,
        isInHeist: false,
        isPlaying: false,
        isInCustody: false,
        isAtEndGame: false,
        isServer: false,
        isTeamAIEnabled: false,
        isGamePaused: false,
        loadedVehicles: [],
        lastCallsReceivedTime: null
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
