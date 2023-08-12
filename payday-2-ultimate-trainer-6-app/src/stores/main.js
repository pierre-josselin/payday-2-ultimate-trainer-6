import { defineStore } from "pinia";

export const useMainStore = defineStore("main", {
    state: () => ({
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
    }),
    actions: {
        setState(state) {
            for (const [name, value] of Object.entries(state)) {
                if (name in this.$state) {
                    this.$state[name] = value;
                }
            }
        }
    }
});
