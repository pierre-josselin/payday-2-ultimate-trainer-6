<script>
import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";
import { useMissionStore } from "@/stores/mission";

import NavBar from "@/components/NavBar.vue";
import AntiCheatDetectedIcon from "@/components/icons/AntiCheatDetectedIcon.vue";
import BugIcon from "@/components/icons/BugIcon.vue";

export default {
    components: {
        NavBar,
        AntiCheatDetectedIcon,
        BugIcon
    },
    created() {
        this.mainStore = useMainStore();
        this.callStore = useCallStore();
        this.missionStore = useMissionStore();
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
            this.callStore.addCall(["UT:setXRay", this.missionStore.enableXRay]);
        },
        setPreventAlarmTriggering() {
            this.callStore.addCall(["UT:setPreventAlarmTriggering", this.missionStore.enablePreventAlarmTriggering]);
        },
        setNoClip() {
            this.callStore.addCall(["UT:setNoClip", this.missionStore.enableNoClip, this.missionStore.noClipSpeed]);
        },
        setInvisiblePlayer() {
            this.callStore.addCall(["UT:setInvisiblePlayer", this.missionStore.enableInvisiblePlayer]);
        },
        setDisableAI() {
            this.callStore.addCall(["UT:setDisableAI", this.missionStore.enableDisableAI]);
        },
        setUnlimitedPagers() {
            this.callStore.addCall(["UT:setUnlimitedPagers", this.missionStore.enableUnlimitedPagers]);
        },
        setInstantDrilling() {
            this.callStore.addCall(["UT:setInstantDrilling", this.missionStore.enableInstantDrilling]);
        },
        openDoors() {
            this.callStore.addCall(["UT:openDoors"]);
        },
        openWindows() {
            this.callStore.addCall(["UT:openWindows"]);
        },
        openDepositBoxes() {
            this.callStore.addCall(["UT:openDepositBoxes"]);
        },
        cutFences() {
            this.callStore.addCall(["UT:cutFences"]);
        },
        openContainers() {
            this.callStore.addCall(["UT:openContainers"]);
        },
        hackComputers() {
            this.callStore.addCall(["UT:hackComputers"]);
        },
        placeDrills() {
            this.callStore.addCall(["UT:placeDrills"]);
        },
        pickUpPackages() {
            this.callStore.addCall(["UT:pickUpPackages"]);
        },
        openCrates() {
            this.callStore.addCall(["UT:openCrates"]);
        },
        barricadeWindows() {
            this.callStore.addCall(["UT:barricadeWindows"]);
        },
        openAtms() {
            this.callStore.addCall(["UT:openAtms"]);
        },
        useKeycards() {
            this.callStore.addCall(["UT:useKeycards"]);
        },
        placeShapedCharges() {
            this.callStore.addCall(["UT:placeShapedCharges"]);
        }
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 1000px;" class="container my-5">
        <div class="card">
            <div class="card-header">{{ $t("main.mission") }}</div>
            <div class="card-body p-4">
                <fieldset :disabled="!mainStore.isInGame">
                    <div class="row">
                        <div class="col">
                            <div class="ratio control-button">
                                <button class="btn btn-primary w-100" :disabled="!mainStore.isHost" @click="startTheHeist">
                                    <FontAwesomeIcon icon="fa-solid fa-play" />
                                    <BugIcon class="ms-3" />
                                </button>
                            </div>
                        </div>
                        <div class="col">
                            <div class="ratio control-button">
                                <button class="btn btn-primary w-100" :disabled="!mainStore.isHost" @click="restartTheHeist">
                                    <FontAwesomeIcon icon="fa-solid fa-rotate-right" />
                                </button>
                            </div>
                        </div>
                        <div class="col">
                            <div class="ratio control-button">
                                <button class="btn btn-primary w-100" :disabled="!mainStore.isHost" @click="finishTheHeist">
                                    <FontAwesomeIcon icon="fa-solid fa-flag" />
                                </button>
                            </div>
                        </div>
                        <div class="col">
                            <div class="ratio control-button">
                                <button class="btn btn-primary w-100" @click="leaveTheHeist">
                                    <FontAwesomeIcon icon="fa-solid fa-person-running" />
                                </button>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <ul class="nav nav-tabs mt-4">
                    <li class="nav-item">
                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#general-tab">{{ $t("mission.general") }}</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#interactions-tab">{{ $t("mission.interactions") }}</button>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="general-tab" class="tab-pane pt-4 show active" tabindex="0">
                        <fieldset :disabled="!mainStore.isPlaying">
                            <div class="row">
                                <div class="col-4">
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
                                <div class="col-8">
                                    <div class="form-check form-switch mb-3" @change="setXRay">
                                        <input id="enable-x-ray" v-model="missionStore.enableXRay" class="form-check-input" type="checkbox">
                                        <label for="enable-x-ray" class="form-check-label">{{ $t("mission.x_ray") }}</label>
                                    </div>
                                    <div class="form-check form-switch mb-3" @change="setPreventAlarmTriggering">
                                        <input id="enable-prevent-alarm-triggering" v-model="missionStore.enablePreventAlarmTriggering" class="form-check-input" type="checkbox" :disabled="!mainStore.isHost">
                                        <label for="enable-prevent-alarm-triggering" class="form-check-label">{{ $t("mission.prevent_alarm_triggering") }}</label>
                                    </div>
                                    <div class="form-check form-switch mb-3" @change="setInvisiblePlayer">
                                        <input id="enable-invisible-player" v-model="missionStore.enableInvisiblePlayer" class="form-check-input" type="checkbox" :disabled="!mainStore.isHost">
                                        <label for="enable-invisible-player" class="form-check-label">{{ $t("mission.invisible_player") }}</label>
                                    </div>
                                    <div class="form-check form-switch mb-3" @change="setNoClip">
                                        <input id="enable-no-clip" v-model="missionStore.enableNoClip" class="form-check-input" type="checkbox">
                                        <label for="enable-no-clip" class="form-check-label">{{ $t("mission.no_clip") }}</label>
                                    </div>
                                    <div class="mb-3" v-if="missionStore.enableNoClip">
                                        <label for="no-clip-speed" class="form-label">{{ $t("mission.no_clip_speed") }}</label>
                                        <input id="no-clip-speed" type="number" min="1" max="100" step="1" class="form-control" v-model="missionStore.noClipSpeed" @change="setNoClip">
                                    </div>
                                    <div class="form-check form-switch mb-3" @change="setDisableAI">
                                        <input id="enable-disable-ai" v-model="missionStore.enableDisableAI" class="form-check-input" type="checkbox" :disabled="!mainStore.isHost">
                                        <label for="enable-disable-ai" class="form-check-label">{{ $t("mission.disable_ai") }}</label>
                                    </div>
                                    <div class="form-check form-switch mb-3" @change="setUnlimitedPagers">
                                        <input id="enable-unlimited-pagers" v-model="missionStore.enableUnlimitedPagers" class="form-check-input" type="checkbox" :disabled="!mainStore.isHost">
                                        <label for="enable-unlimited-pagers" class="form-check-label">{{ $t("mission.unlimited_pagers") }}</label>
                                    </div>
                                    <div class="form-check form-switch" @change="setInstantDrilling">
                                        <input id="enable-instant-drilling" v-model="missionStore.enableInstantDrilling" class="form-check-input" type="checkbox" :disabled="!mainStore.isHost">
                                        <label for="enable-instant-drilling" class="form-check-label">{{ $t("mission.instant_drilling") }}</label>
                                        <BugIcon class="ms-3" />
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div id="interactions-tab" class="tab-pane" tabindex="0">
                        <fieldset :disabled="!mainStore.isPlaying">
                            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4">
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="openDoors">{{ $t("mission.open_doors") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="openWindows">{{ $t("mission.open_windows") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="openDepositBoxes">{{ $t("mission.open_deposit_boxes") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="cutFences">{{ $t("mission.cut_fences") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="openContainers">{{ $t("mission.open_containers") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="hackComputers">{{ $t("mission.hack_computers") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="placeDrills">{{ $t("mission.place_drills") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="pickUpPackages">{{ $t("mission.pick_up_packages") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="openCrates">{{ $t("mission.open_crates") }}
                                            <AntiCheatDetectedIcon class="ms-3" />
                                        </button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="barricadeWindows">{{ $t("mission.barricade_windows") }}
                                            <AntiCheatDetectedIcon class="ms-3" />
                                        </button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="openAtms">{{ $t("mission.open_atms") }}
                                            <AntiCheatDetectedIcon class="ms-3" />
                                        </button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="useKeycards">{{ $t("mission.use_keycards") }}
                                            <AntiCheatDetectedIcon class="ms-3" />
                                        </button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="d-block btn btn-primary" @click="placeShapedCharges">{{ $t("mission.place_shaped_charges") }}
                                            <AntiCheatDetectedIcon class="ms-3" />
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.control-button {
    --bs-aspect-ratio: 30%;
}
.interaction-button {
    --bs-aspect-ratio: 45%;
}
</style>
