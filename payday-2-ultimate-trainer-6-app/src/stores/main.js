import { defineStore } from "pinia";

import { useMissionStore } from "@/stores/mission";

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
            return Boolean(typeof this.gameState === "string" && this.gameState.startsWith("ingame_") && this.gameState !== "ingame_waiting_for_players");
        },
        getIsHost() {
            return this.isHost;
        }
    },
    actions: {
        setGameState(gameState) {
            if (this.getIsInHeist && typeof gameState === "string" && (!gameState.startsWith("ingame_") || gameState === "ingame_waiting_for_players")) {
                const missionStore = useMissionStore();
                missionStore.$reset();
            }

            this.gameState = gameState;
        },
        setIsHost(isHost) {
            this.isHost = isHost;
        }
    }
});
