<script>
import { useCallStore } from "@/stores/calls";

import NavBar from "@/components/NavBar.vue";
import BugIcon from "@/components/icons/BugIcon.vue";

export default {
    components: {
        NavBar,
        BugIcon
    },
    created() {
        this.callStore = useCallStore();
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
        setXRay(enabled) {
            this.callStore.addCall(["UT:setXRay", enabled]);
        },
        setPreventAlarmTriggering(enabled) {
            this.callStore.addCall(["UT:setPreventAlarmTriggering", enabled]);
        },
        setInvisiblePlayer(enabled) {
            this.callStore.addCall(["UT:setInvisiblePlayer", enabled]);
        },
        setDisableAI(enabled) {
            this.callStore.addCall(["UT:setDisableAI", enabled]);
        },
        setUnlimitedPagers(enabled) {
            this.callStore.addCall(["UT:setUnlimitedPagers", enabled]);
        },
        setInstantDrilling(enabled) {
            this.callStore.addCall(["UT:setInstantDrilling", enabled]);
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
                <div class="row">
                    <div class="col">
                        <button class="btn btn-primary w-100" @click="startTheHeist">
                            <FontAwesomeIcon icon="fa-solid fa-play" />
                        </button>
                    </div>
                    <div class="col">
                        <button class="btn btn-primary w-100" @click="restartTheHeist">
                            <FontAwesomeIcon icon="fa-solid fa-rotate-right" />
                        </button>
                    </div>
                    <div class="col">
                        <button class="btn btn-primary w-100" @click="finishTheHeist">
                            <FontAwesomeIcon icon="fa-solid fa-flag" />
                        </button>
                    </div>
                    <div class="col">
                        <button class="btn btn-primary w-100" @click="leaveTheHeist">
                            <FontAwesomeIcon icon="fa-solid fa-person-running" />
                        </button>
                    </div>
                </div>
                <hr class="my-4" />
                <div class="row">
                    <div class="col-5">
                        <div class="mb-3">
                            <button class="btn btn-primary w-100" @click="accessCameras">{{ $t("mission.access_cameras") }}</button>
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-warning w-100" @click="triggerTheAlarm">{{ $t("mission.trigger_the_alarm") }}</button>
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-primary w-100" @click="removeInvisibleWalls">{{ $t("mission.remove_invisible_walls") }}</button>
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-primary w-100" @click="killAllEnemies">{{ $t("mission.kill_all_enemies") }}</button>
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-primary w-100" @click="killAllCivilians">{{ $t("mission.kill_all_civilians") }}</button>
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-primary w-100" @click="tieAllCivilians">{{ $t("mission.tie_all_civilians") }}</button>
                        </div>
                        <div>
                            <button class="btn btn-primary w-100" @click="convertAllEnemies">{{ $t("mission.convert_all_enemies") }}</button>
                        </div>
                    </div>
                    <div class="col-7">
                        <div class="form-check form-switch mb-3" @change="setXRay($event.target.checked)">
                            <input id="enable-x-ray" class="form-check-input" type="checkbox">
                            <label for="enable-x-ray" class="form-check-label">{{ $t("mission.x_ray") }}</label>
                        </div>
                        <div class="form-check form-switch mb-3" @change="setPreventAlarmTriggering($event.target.checked)">
                            <input id="enable-prevent-alarm-triggering" class="form-check-input" type="checkbox">
                            <label for="enable-prevent-alarm-triggering" class="form-check-label">{{ $t("mission.prevent_alarm_triggering") }}</label>
                        </div>
                        <div class="form-check form-switch mb-3" @change="setInvisiblePlayer($event.target.checked)">
                            <input id="enable-invisible-player" class="form-check-input" type="checkbox">
                            <label for="enable-invisible-player" class="form-check-label">{{ $t("mission.invisible_player") }}</label>
                        </div>
                        <div class="form-check form-switch mb-3" @change="setDisableAI($event.target.checked)">
                            <input id="enable-disable-ai" class="form-check-input" type="checkbox">
                            <label for="enable-disable-ai" class="form-check-label">{{ $t("mission.disable_ai") }}</label>
                        </div>
                        <div class="form-check form-switch mb-3" @change="setUnlimitedPagers($event.target.checked)">
                            <input id="enable-unlimited-pagers" class="form-check-input" type="checkbox">
                            <label for="enable-unlimited-pagers" class="form-check-label">{{ $t("mission.unlimited_pagers") }}</label>
                        </div>
                        <div class="form-check form-switch" @change="setInstantDrilling($event.target.checked)">
                            <input id="enable-instant-drilling" class="form-check-input" type="checkbox">
                            <label for="enable-instant-drilling" class="form-check-label">{{ $t("mission.instant_drilling") }}</label>
                            <BugIcon class="ms-3" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
