import { defineStore } from "pinia";

export const useMainStore = defineStore("main", {
    state: () => ({
        gameState: null
    }),
    getters: {
        getGameState() {
            return this.gameState;
        },
        isInMainMenu() {
            return Boolean(this.gameState === "menu_main");
        },
        isInPrePlanning() {
            return Boolean(this.gameState === "ingame_waiting_for_players");
        },
        isInGame() {
            return Boolean(typeof this.gameState === "string" && this.gameState.startsWith("ingame_"));
        }
    },
    actions: {
        setGameState(gameState) {
            this.gameState = gameState;
        }
    }
});
