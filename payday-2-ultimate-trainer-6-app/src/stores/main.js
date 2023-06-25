import { defineStore } from "pinia";

import { useMissionStore } from "@/stores/mission";

export const useMainStore = defineStore("main", {
    state: () => ({
        gameState: null,
        isHost: null,
        vehiclesPackagesLoaded: null
    }),
    getters: {
        getIsOffline() {
            return this.gameState === "offline";
        },
        getIsInBootup() {
            return this.gameState === "bootup";
        },
        getIsInMainMenu() {
            return typeof this.gameState === "string" && this.gameState.startsWith("menu_");
        },
        getIsInGame() {
            return typeof this.gameState === "string" && this.gameState.startsWith("ingame_");
        },
        getIsPlaying() {
            return typeof this.gameState === "string" && this.gameState.startsWith("ingame_") && !this.gameState.startsWith("ingame_waiting_");
        },
        getIsInHeist() {
            return typeof this.gameState === "string" && this.gameState.startsWith("ingame_") && this.gameState !== "ingame_waiting_for_players";
        },
        getIsAtEndGame() {
            return ["victoryscreen", "gameoverscreen", "disconnected", "server_left", "kicked"].includes(this.gameState);
        },
        getIsHost() {
            return this.isHost;
        },
        getVehiclesPackagesLoaded() {
            return this.vehiclesPackagesLoaded;
        }
    },
    actions: {
        setGameState(gameState) {
            if (this.getIsInGame && typeof gameState === "string" && (!gameState.startsWith("ingame_") || gameState === "ingame_waiting_for_players")) {
                const missionStore = useMissionStore();
                missionStore.$reset();
            }

            this.gameState = gameState;
        },
        setIsHost(isHost) {
            this.isHost = isHost;
        },
        setVehiclesPackagesLoaded(vehiclesPackagesLoaded) {
            this.vehiclesPackagesLoaded = vehiclesPackagesLoaded;
        }
    }
});
