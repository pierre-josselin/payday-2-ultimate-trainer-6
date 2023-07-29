import { defineStore } from "pinia";

export const useMissionStore = defineStore("mission", {
    state: () => ({
        enableXRay: false,
        enablePreventAlarmTriggering: false,
        enableNoClip: false,
        enableInvisiblePlayer: false,
        enableDisableAI: false,
        enableSuspendPointOfNoReturnTimer: false,
        enableUnlimitedPagers: false,
        enableInstantDrilling: false,
        enableCarryStacker: false,
        noClipSpeed: 10,
        replenishType: "equipment",
        enableSlowMotion: false,
        slowMotionWorldSpeed: 0.2,
        slowMotionPlayerSpeed: 0.5
    })
});
