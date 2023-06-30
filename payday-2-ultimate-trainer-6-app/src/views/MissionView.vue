<script>
import { storeToRefs } from "pinia";

import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";
import { useMissionStore } from "@/stores/mission";

import NavBar from "@/components/NavBar.vue";
import BugIcon from "@/components/icons/BugIcon.vue";

export default {
    components: {
        NavBar,
        BugIcon
    },
    data() {
        return {
            enableXRay: false,
            enablePreventAlarmTriggering: false,
            enableInvisiblePlayer: false,
            enableDisableAI: false,
            enableUnlimitedPagers: false,
            enableInstantDrilling: false
        };
    },
    created() {
        this.mainStore = useMainStore();
        this.callStore = useCallStore();
        this.missionStore = useMissionStore();

        const {
            enableXRay,
            enablePreventAlarmTriggering,
            enableInvisiblePlayer,
            enableDisableAI,
            enableUnlimitedPagers,
            enableInstantDrilling
        } = storeToRefs(this.missionStore);

        this.enableXRay = enableXRay;
        this.enablePreventAlarmTriggering = enablePreventAlarmTriggering;
        this.enableInvisiblePlayer = enableInvisiblePlayer;
        this.enableDisableAI = enableDisableAI;
        this.enableUnlimitedPagers = enableUnlimitedPagers;
        this.enableInstantDrilling = enableInstantDrilling;
    },
    methods: {
        startTheHeist() {
            this.callStore.addCall(["UT:startTheHeist"]);
        },
        restartTheHeist() {
            this.callStore.addCall(["UT:restartTheHeist"]);
        },
        finishTheHeist() {
            this.callStore.addCall(["UT:finishTheHeist"]);
        },
        leaveTheHeist() {
            this.callStore.addCall(["UT:leaveTheHeist"]);
        },
        accessCameras() {
            this.callStore.addCall(["UT:accessCameras"]);
        },
        triggerTheAlarm() {
            this.callStore.addCall(["UT:triggerTheAlarm"]);
        },
        removeInvisibleWalls() {
            this.callStore.addCall(["UT:removeInvisibleWalls"]);
        },
        killAllEnemies() {
            this.callStore.addCall(["UT:killAllEnemies"]);
        },
        killAllCivilians() {
            this.callStore.addCall(["UT:killAllCivilians"]);
        },
        tieAllCivilians() {
            this.callStore.addCall(["UT:tieAllCivilians"]);
        },
        convertAllEnemies() {
            this.callStore.addCall(["UT:convertAllEnemies"]);
        },
        setXRay() {
            this.callStore.addCall(["UT:setXRay", this.enableXRay]);
        },
        setPreventAlarmTriggering() {
            this.callStore.addCall(["UT:setPreventAlarmTriggering", this.enablePreventAlarmTriggering]);
        },
        setInvisiblePlayer() {
            this.callStore.addCall(["UT:setInvisiblePlayer", this.enableInvisiblePlayer]);
        },
        setDisableAI() {
            this.callStore.addCall(["UT:setDisableAI", this.enableDisableAI]);
        },
        setUnlimitedPagers() {
            this.callStore.addCall(["UT:setUnlimitedPagers", this.enableUnlimitedPagers]);
        },
        setInstantDrilling() {
            this.callStore.addCall(["UT:setInstantDrilling", this.enableInstantDrilling]);
        }
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 800px;" class="container my-5">
        <div class="card">
            <div class="card-header">{{ $t("main.mission") }}</div>
            <div class="card-body p-4">
                <fieldset :disabled="!mainStore.isInGame">
                    <div class="row">
                        <div class="col">
                            <button class="btn btn-primary w-100" :disabled="!mainStore.isHost" @click="startTheHeist">
                                <FontAwesomeIcon icon="fa-solid fa-play" />
                            </button>
                        </div>
                        <div class="col">
                            <button class="btn btn-primary w-100" :disabled="!mainStore.isHost" @click="restartTheHeist">
                                <FontAwesomeIcon icon="fa-solid fa-rotate-right" />
                            </button>
                        </div>
                        <div class="col">
                            <button class="btn btn-primary w-100" :disabled="!mainStore.isHost" @click="finishTheHeist">
                                <FontAwesomeIcon icon="fa-solid fa-flag" />
                            </button>
                        </div>
                        <div class="col">
                            <button class="btn btn-primary w-100" @click="leaveTheHeist">
                                <FontAwesomeIcon icon="fa-solid fa-person-running" />
                            </button>
                        </div>
                    </div>
                </fieldset>
                <hr class="my-4">
                <fieldset :disabled="!mainStore.isPlaying">
                    <div class="row">
                        <div class="col-5">
                            <div class="mb-3">
                                <button class="btn btn-primary w-100" @click="accessCameras">{{ $t("mission.access_cameras") }}</button>
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-warning w-100" :disabled="!mainStore.isHost" @click="triggerTheAlarm">{{ $t("mission.trigger_the_alarm") }}</button>
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-primary w-100" :disabled="!mainStore.isHost" @click="removeInvisibleWalls">{{ $t("mission.remove_invisible_walls") }}</button>
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-primary w-100" @click="killAllEnemies">{{ $t("mission.kill_all_enemies") }}</button>
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-primary w-100" @click="killAllCivilians">{{ $t("mission.kill_all_civilians") }}</button>
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-primary w-100" :disabled="!mainStore.isHost" @click="tieAllCivilians">{{ $t("mission.tie_all_civilians") }}</button>
                            </div>
                            <div>
                                <button class="btn btn-primary w-100" :disabled="!mainStore.isHost" @click="convertAllEnemies">{{ $t("mission.convert_all_enemies") }}</button>
                            </div>
                        </div>
                        <div class="col-7">
                            <div class="form-check form-switch mb-3" @change="setXRay">
                                <input id="enable-x-ray" v-model="enableXRay" class="form-check-input" type="checkbox">
                                <label for="enable-x-ray" class="form-check-label">{{ $t("mission.x_ray") }}</label>
                            </div>
                            <div class="form-check form-switch mb-3" @change="setPreventAlarmTriggering">
                                <input id="enable-prevent-alarm-triggering" v-model="enablePreventAlarmTriggering" class="form-check-input" type="checkbox" :disabled="!mainStore.isHost">
                                <label for="enable-prevent-alarm-triggering" class="form-check-label">{{ $t("mission.prevent_alarm_triggering") }}</label>
                            </div>
                            <div class="form-check form-switch mb-3" @change="setInvisiblePlayer">
                                <input id="enable-invisible-player" v-model="enableInvisiblePlayer" class="form-check-input" type="checkbox" :disabled="!mainStore.isHost">
                                <label for="enable-invisible-player" class="form-check-label">{{ $t("mission.invisible_player") }}</label>
                            </div>
                            <div class="form-check form-switch mb-3" @change="setDisableAI">
                                <input id="enable-disable-ai" v-model="enableDisableAI" class="form-check-input" type="checkbox" :disabled="!mainStore.isHost">
                                <label for="enable-disable-ai" class="form-check-label">{{ $t("mission.disable_ai") }}</label>
                            </div>
                            <div class="form-check form-switch mb-3" @change="setUnlimitedPagers">
                                <input id="enable-unlimited-pagers" v-model="enableUnlimitedPagers" class="form-check-input" type="checkbox" :disabled="!mainStore.isHost">
                                <label for="enable-unlimited-pagers" class="form-check-label">{{ $t("mission.unlimited_pagers") }}</label>
                            </div>
                            <div class="form-check form-switch" @change="setInstantDrilling">
                                <input id="enable-instant-drilling" v-model="enableInstantDrilling" class="form-check-input" type="checkbox" :disabled="!mainStore.isHost">
                                <label for="enable-instant-drilling" class="form-check-label">{{ $t("mission.instant_drilling") }}</label>
                                <BugIcon class="ms-3" />
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</template>
