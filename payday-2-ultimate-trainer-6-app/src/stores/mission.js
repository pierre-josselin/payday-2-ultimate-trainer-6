import { defineStore } from "pinia";

export const useMissionStore = defineStore("mission", {
    state: () => ({
        enableXRay: false,
        enablePreventAlarmTriggering: false,
        enableInvisiblePlayer: false,
        enableDisableAI: false,
        enableUnlimitedPagers: false,
        enableInstantDrilling: false
    })
});
