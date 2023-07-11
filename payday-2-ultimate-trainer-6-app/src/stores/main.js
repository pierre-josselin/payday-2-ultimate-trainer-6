import { defineStore } from "pinia";

export const useMainStore = defineStore("main", {
    state: () => ({
        gameState: null,
        isHost: null,
        vehiclesPackagesLoaded: null
    }),
    getters: {
        isOffline: (state) => state.gameState === "offline",
        isInBootup: (state) => state.gameState === "bootup",
        isInMainMenu: (state) => typeof state.gameState === "string" && state.gameState.startsWith("menu_"),
        isInGame: (state) => typeof state.gameState === "string" && state.gameState.startsWith("ingame_"),
        isPlaying: (state) => typeof state.gameState === "string" && state.gameState.startsWith("ingame_") && !state.gameState.startsWith("ingame_waiting_"),
        isInHeist: (state) => typeof state.gameState === "string" && state.gameState.startsWith("ingame_") && state.gameState !== "ingame_waiting_for_players",
        isAtEndGame: (state) => ["victoryscreen", "gameoverscreen", "disconnected", "server_left", "kicked"].includes(state.gameState)
    }
});
