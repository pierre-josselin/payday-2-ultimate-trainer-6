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
        vehiclesPackagesLoaded: false,
        lastCallAcknowledgmentTime: null
    })
});
