import { defineStore } from "pinia";

export const useSpawnStore = defineStore("spawn", {
    state: () => ({
        id: null,
        categoryId: null,
        positionType: null,
        convertedEnemies: null
    })
});
