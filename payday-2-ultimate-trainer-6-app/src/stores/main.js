import { defineStore } from "pinia";

export const useMainStore = defineStore("main", {
    state: () => ({
        gameState: null,
        isHost: null
    }),
    getters: {
        getGameState() {
            return this.gameState;
        },
        getIsInMainMenu() {
            return Boolean(this.gameState === "menu_main");
        },
        getIsInPrePlanning() {
            return Boolean(this.gameState === "ingame_waiting_for_players");
        },
        getIsInHeist() {
            return Boolean(typeof this.gameState === "string" && this.gameState.startsWith("ingame_"));
        },
        getIsHost() {
            return this.isHost;
        }
    },
    actions: {
        setGameState(gameState) {
            this.gameState = gameState;
        },
        setIsHost(isHost) {
            this.isHost = isHost;
        }
    }
});
