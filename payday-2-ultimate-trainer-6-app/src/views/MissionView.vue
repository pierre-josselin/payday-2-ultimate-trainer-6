<script>
import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";
import { useSettingsStore } from "@/stores/settings";
import { useMissionStore } from "@/stores/mission";

import NavBar from "@/components/NavBar.vue";
import AntiCheatDetectedIcon from "@/components/icons/AntiCheatDetectedIcon.vue";
import BugIcon from "@/components/icons/BugIcon.vue";

import bags from "@/data/bags.json";
import specialEquipment from "@/data/special-equipment.json";

export default {
    components: {
        NavBar,
        AntiCheatDetectedIcon,
        BugIcon
    },
    data() {
        return {
            bagSearch: null,
            specialEquipmentSearch: null
        };
    },
    computed: {
        noSlowMotionEnabled() {
            return this.settingsStore.getSetting("enable-no-slow-motion");
        },
        filteredBags() {
            if (!this.bagSearch) {
                return this.bags.sort();
            }

            const filteredBags = [];
            for (const bagId of this.bags) {
                const bagName = this.$t(`bags.${bagId}`);
                if (bagId.toLowerCase().includes(this.bagSearch.toLowerCase()) || bagName.toLowerCase().includes(this.bagSearch.toLowerCase())) {
                    filteredBags.push(bagId);
                }
            }

            return filteredBags.sort();
        },
        filteredSpecialEquipment() {
            if (!this.specialEquipmentSearch) {
                return this.specialEquipment.sort();
            }

            const filteredSpecialEquipment = [];
            for (const specialEquipmentId of this.specialEquipment) {
                const specialEquipmentName = this.$t(`special_equipment.${specialEquipmentId}`);
                if (specialEquipmentId.toLowerCase().includes(this.specialEquipmentSearch.toLowerCase()) || specialEquipmentName.toLowerCase().includes(this.specialEquipmentSearch.toLowerCase())) {
                    filteredSpecialEquipment.push(specialEquipmentId);
                }
            }

            return filteredSpecialEquipment.sort();
        }
    },
    created() {
        this.mainStore = useMainStore();
        this.callStore = useCallStore();
        this.settingsStore = useSettingsStore();
        this.missionStore = useMissionStore();

        this.$watch("missionStore.slowMotionWorldSpeed", (slowMotionWorldSpeed) => {
            this.missionStore.slowMotionWorldSpeed = parseFloat(slowMotionWorldSpeed);
        });
        this.$watch("missionStore.slowMotionPlayerSpeed", (slowMotionPlayerSpeed) => {
            this.missionStore.slowMotionPlayerSpeed = parseFloat(slowMotionPlayerSpeed);
        });

        this.bags = bags;
        this.specialEquipment = specialEquipment;
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
        setCarryStacker() {
            this.callStore.addCall([this.missionStore.enableCarryStacker ? "UT.CarryStacker.enable" : "UT.CarryStacker.disable"]);
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
        },
        setSlowMotion() {
            this.callStore.addCall(["UT:setSlowMotion", this.missionStore.enableSlowMotion, parseFloat(this.missionStore.slowMotionWorldSpeed), parseFloat(this.missionStore.slowMotionPlayerSpeed)]);
        },
        getOutOfCustody() {
            this.callStore.addCall(["UT:getOutOfCustody"]);
        },
        setPlayerStateCivilian() {
            this.callStore.addCall(["UT:setPlayerState", "civilian"]);
        },
        setPlayerStateMaskOff() {
            this.callStore.addCall(["UT:setPlayerState", "mask_off"]);
        },
        setPlayerStateStandard() {
            this.callStore.addCall(["UT:setPlayerState", "standard"]);
        },
        replenishHealth() {
            this.callStore.addCall(["UT:replenishHealth"]);
        },
        replenishAmmo() {
            this.callStore.addCall(["UT:replenishAmmo"]);
        },
        replenish() {
            switch (this.missionStore.replenishType) {
                case "equipment": {
                    this.callStore.addCall(["UT:replenishEquipment"]);
                    break;
                }
                case "cable-ties": {
                    this.callStore.addCall(["UT:replenishCableTies"]);
                    break;
                }
                case "throwables": {
                    this.callStore.addCall(["UT:replenishThrowables"]);
                    break;
                }
                case "body-bags": {
                    this.callStore.addCall(["UT:replenishBodyBags"]);
                    break;
                }
            }
        },
        throwBag(bagId) {
            this.callStore.addCall(["UT:throwBag", bagId]);
        },
        addSpecialEquipment(specialEquipmentId) {
            this.callStore.addCall(["UT:addSpecialEquipment", specialEquipmentId]);
        }
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 1200px;" class="container my-5">
        <div class="card">
            <div class="card-header">{{ $t("main.mission") }}</div>
            <div class="card-body p-4">
                <fieldset :disabled="!mainStore.isInGame && !mainStore.isAtEndGame">
                    <div class="row">
                        <div class="col">
                            <button class="btn btn-primary w-100 p-3 p-sm-4" :disabled="!mainStore.isServer || mainStore.isAtEndGame" @click="startTheHeist">
                                <FontAwesomeIcon icon="fa-solid fa-play" />
                                <BugIcon class="d-none d-sm-inline ms-3" />
                            </button>
                        </div>
                        <div class="col">
                            <button class="btn btn-primary w-100 p-3 p-sm-4" :disabled="!mainStore.isServer" @click="restartTheHeist">
                                <FontAwesomeIcon icon="fa-solid fa-rotate-right" />
                            </button>
                        </div>
                        <div class="col">
                            <button class="btn btn-primary w-100 p-3 p-sm-4" :disabled="!mainStore.isServer || mainStore.isAtEndGame" @click="finishTheHeist">
                                <FontAwesomeIcon icon="fa-solid fa-flag" />
                            </button>
                        </div>
                        <div class="col">
                            <button class="btn btn-primary w-100 p-3 p-sm-4" @click="leaveTheHeist">
                                <FontAwesomeIcon icon="fa-solid fa-person-running" />
                            </button>
                        </div>
                    </div>
                </fieldset>
                <ul class="nav nav-tabs mt-4">
                    <li class="nav-item">
                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#general-tab">{{ $t("main.general") }}</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#interactions-tab">{{ $t("main.interactions") }}</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#slow-motion-tab">{{ $t("main.slow_motion") }}</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#bags-tab">
                            {{ $t("main.bags") }}
                            <BugIcon class="ms-3" />
                            <AntiCheatDetectedIcon class="ms-3" />
                        </button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#special-equipment-tab">{{ $t("main.special_equipment") }}</button>
                    </li>
                </ul>
                <fieldset :disabled="!mainStore.isInHeist">
                    <div class="tab-content">
                        <div id="general-tab" class="tab-pane show active" tabindex="0">
                            <div class="row mt-4">
                                <div class="col-md-6 col-lg-8 mb-3 mb-md-0">
                                    <div class="row">
                                        <div class="col-lg-6 mb-3 mb-lg-0">
                                            <div>
                                                <button class="btn btn-primary w-100" :disabled="!mainStore.isPlaying" @click="accessCameras">{{ $t("main.access_cameras") }}</button>
                                            </div>
                                            <div class="mt-3">
                                                <button class="btn btn-primary w-100" :disabled="!mainStore.isServer" @click="triggerTheAlarm">{{ $t("main.trigger_the_alarm") }}</button>
                                            </div>
                                            <div class="mt-3">
                                                <button class="btn btn-primary w-100" :disabled="!mainStore.isServer" @click="removeInvisibleWalls">{{ $t("main.remove_invisible_walls") }}</button>
                                            </div>
                                            <div class="mt-3">
                                                <div class="btn-group w-100">
                                                    <button class="btn btn-secondary" disabled>{{ $t("main.kill_all") }}</button>
                                                    <button class="btn btn-primary" @click="killAllEnemies">{{ $t("main.enemies") }}</button>
                                                    <button class="btn btn-primary" @click="killAllCivilians">{{ $t("main.civilians") }}</button>
                                                </div>
                                            </div>
                                            <div class="mt-3">
                                                <button class="btn btn-primary w-100" :disabled="!mainStore.isServer" @click="tieAllCivilians">{{ $t("main.tie_all_civilians") }}</button>
                                            </div>
                                            <div class="mt-3">
                                                <button class="btn btn-primary w-100" :disabled="!mainStore.isServer" @click="convertAllEnemies">{{ $t("main.convert_all_enemies") }}</button>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div>
                                                <button class="btn btn-primary w-100" :disabled="!mainStore.isInCustody" @click="getOutOfCustody">{{ $t("main.get_out_of_custody") }}</button>
                                            </div>
                                            <div class="mt-3">
                                                <div class="dropdown">
                                                    <button class="btn btn-primary dropdown-toggle w-100" type="button" data-bs-toggle="dropdown" :disabled="!mainStore.isPlaying">{{ $t("main.set_player_state") }}</button>
                                                    <ul class="dropdown-menu dropdown-menu-end">
                                                        <li><button class="dropdown-item" @click="setPlayerStateCivilian">{{ $t("main.civilian") }}</button></li>
                                                        <li><button class="dropdown-item" @click="setPlayerStateMaskOff">{{ $t("main.mask_off") }}</button></li>
                                                        <li><button class="dropdown-item" @click="setPlayerStateStandard">{{ $t("main.standard") }}</button></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="mt-3">
                                                <button class="btn btn-primary w-100" :disabled="!mainStore.isPlaying" @click="replenishHealth">{{ $t("main.replenish_health") }}</button>
                                            </div>
                                            <div class="mt-3">
                                                <button class="btn btn-primary w-100" :disabled="!mainStore.isPlaying" @click="replenishAmmo">{{ $t("main.replenish_ammo") }}</button>
                                            </div>
                                            <div class="mt-3">
                                                <form @submit.prevent="replenish">
                                                    <div class="input-group">
                                                        <select v-model="missionStore.replenishType" class="form-select" :disabled="!mainStore.isPlaying" required>
                                                            <option value="equipment">{{ $t("main.equipment") }}</option>
                                                            <option value="cable-ties">{{ $t("main.cable_ties") }}</option>
                                                            <option value="throwables">{{ $t("main.throwables") }}</option>
                                                            <option value="body-bags">{{ $t("main.body_bags") }}</option>
                                                        </select>
                                                        <button type="submit" class="btn btn-primary" :disabled="!mainStore.isPlaying">
                                                            {{ $t("main.replenish") }}
                                                            <AntiCheatDetectedIcon v-if="missionStore.replenishType === 'equipment'" class="ms-3" />
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="form-check form-switch" @change="setXRay">
                                        <input id="enable-x-ray" v-model="missionStore.enableXRay" class="form-check-input" type="checkbox">
                                        <label for="enable-x-ray" class="form-check-label">{{ $t("main.x_ray") }}</label>
                                    </div>
                                    <div class="form-check form-switch mt-3" @change="setPreventAlarmTriggering">
                                        <input id="enable-prevent-alarm-triggering" v-model="missionStore.enablePreventAlarmTriggering" class="form-check-input" type="checkbox" :disabled="!mainStore.isServer">
                                        <label for="enable-prevent-alarm-triggering" class="form-check-label">{{ $t("main.prevent_alarm_triggering") }}
                                            <BugIcon class="ms-3" />
                                        </label>
                                    </div>
                                    <div class="form-check form-switch mt-3" :disabled="!mainStore.isPlaying" @change="setInvisiblePlayer">
                                        <input id="enable-invisible-player" v-model="missionStore.enableInvisiblePlayer" class="form-check-input" type="checkbox" :disabled="!mainStore.isServer">
                                        <label for="enable-invisible-player" class="form-check-label">{{ $t("main.invisible_player") }}</label>
                                    </div>
                                    <div class="form-check form-switch mt-3" :disabled="!mainStore.isPlaying" @change="setNoClip">
                                        <input id="enable-no-clip" v-model="missionStore.enableNoClip" class="form-check-input" type="checkbox">
                                        <label for="enable-no-clip" class="form-check-label">{{ $t("main.no_clip") }}</label>
                                    </div>
                                    <div v-if="missionStore.enableNoClip" class="mt-3">
                                        <label for="no-clip-speed" class="form-label">{{ $t("main.no_clip_speed") }}</label>
                                        <input id="no-clip-speed" v-model="missionStore.noClipSpeed" type="number" min="1" max="100" step="1" class="form-control form-control-sm" :disabled="!mainStore.isPlaying" @change="setNoClip">
                                    </div>
                                    <div class="form-check form-switch mt-3" @change="setDisableAI">
                                        <input id="enable-disable-ai" v-model="missionStore.enableDisableAI" class="form-check-input" type="checkbox" :disabled="!mainStore.isServer">
                                        <label for="enable-disable-ai" class="form-check-label">{{ $t("main.disable_ai") }}</label>
                                    </div>
                                    <div class="form-check form-switch mt-3" @change="setUnlimitedPagers">
                                        <input id="enable-unlimited-pagers" v-model="missionStore.enableUnlimitedPagers" class="form-check-input" type="checkbox" :disabled="!mainStore.isServer">
                                        <label for="enable-unlimited-pagers" class="form-check-label">{{ $t("main.unlimited_pagers") }}</label>
                                    </div>
                                    <div class="form-check form-switch mt-3" @change="setInstantDrilling">
                                        <input id="enable-instant-drilling" v-model="missionStore.enableInstantDrilling" class="form-check-input" type="checkbox" :disabled="!mainStore.isServer">
                                        <label for="enable-instant-drilling" class="form-check-label">{{ $t("main.instant_drilling") }}</label>
                                    </div>
                                    <div class="form-check form-switch mt-3" @change="setCarryStacker">
                                        <input id="enable-carry-stacker" v-model="missionStore.enableCarryStacker" class="form-check-input" type="checkbox" :disabled="!mainStore.isServer">
                                        <label for="enable-carry-stacker" class="form-check-label">{{ $t("main.carry_multiple_bags") }} ({{ $t("main.beta").toLowerCase() }})</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="interactions-tab" class="tab-pane" tabindex="0">
                            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="openDoors">{{ $t("main.open_doors") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="openWindows">{{ $t("main.open_windows") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="openDepositBoxes">{{ $t("main.open_deposit_boxes") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="cutFences">{{ $t("main.cut_fences") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="openContainers">{{ $t("main.open_containers") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="hackComputers">{{ $t("main.hack_computers") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="placeDrills">{{ $t("main.place_drills") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="pickUpPackages">{{ $t("main.pick_up_packages") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="openCrates">{{ $t("main.open_crates") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="barricadeWindows">{{ $t("main.barricade_windows") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" @click="useKeycards">{{ $t("main.use_keycards") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="btn btn-primary" :disabled="!mainStore.isServer" @click="openAtms">{{ $t("main.open_atms") }}</button>
                                    </div>
                                </div>
                                <div class="col mt-4">
                                    <div class="ratio interaction-button">
                                        <button class="d-block btn btn-primary" :disabled="!mainStore.isServer" @click="placeShapedCharges">{{ $t("main.place_shaped_charges") }}</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="slow-motion-tab" class="tab-pane pt-4" tabindex="0">
                            <fieldset :disabled="noSlowMotionEnabled && !missionStore.enableSlowMotion">
                                <div class="form-check form-switch mb-3">
                                    <input id="enable-slow-motion" v-model="missionStore.enableSlowMotion" class="form-check-input" type="checkbox" @change="setSlowMotion">
                                    <label for="enable-slow-motion" class="form-check-label">{{ $t("main.slow_motion") }}</label>
                                </div>
                                <div class="mb-3">
                                    <label for="slow-motion-world-speed" class="form-label">{{ $t("main.world_speed") }} · {{ missionStore.slowMotionWorldSpeed }}</label>
                                    <input id="slow-motion-world-speed" v-model="missionStore.slowMotionWorldSpeed" type="range" min="0.1" max="1" step="0.1" class="form-range" :disabled="!missionStore.enableSlowMotion" @change="setSlowMotion">
                                </div>
                                <div>
                                    <label for="slow-motion-player-speed" class="form-label">{{ $t("main.player_speed") }} · {{ missionStore.slowMotionPlayerSpeed }}</label>
                                    <input id="slow-motion-player-speed" v-model="missionStore.slowMotionPlayerSpeed" type="range" min="0.1" max="1" step="0.1" class="form-range" :disabled="!missionStore.enableSlowMotion" @change="setSlowMotion">
                                </div>
                            </fieldset>
                        </div>
                        <div id="bags-tab" class="tab-pane pt-4" tabindex="0">
                            <div class="alert alert-warning">{{ $t("dialogs.bag_spawn_crash") }}</div>
                            <input v-model="bagSearch" class="form-control mb-3" type="search" :disabled="!mainStore.isPlaying">
                            <div style="max-height: 500px;" class="table-responsive">
                                <table class="table table-striped table-hover mb-0">
                                    <thead>
                                        <tr>
                                            <th>{{ $t("main.name") }}</th>
                                            <th>{{ $t("main.id") }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="bagId in filteredBags" :key="bagId" role="button" :class="{ disabled: !mainStore.isPlaying }" @click="throwBag(bagId)">
                                            <td class="bg-transparent">{{ $t(`bags.${bagId}`) }}</td>
                                            <td class="bg-transparent">{{ bagId }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="special-equipment-tab" class="tab-pane pt-4" tabindex="0">
                            <input v-model="specialEquipmentSearch" class="form-control mb-3" type="search" :disabled="!mainStore.isPlaying">
                            <div style="max-height: 500px;" class="table-responsive">
                                <table class="table table-striped table-hover mb-0">
                                    <thead>
                                        <tr>
                                            <th>{{ $t("main.name") }}</th>
                                            <th>{{ $t("main.id") }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="specialEquipmentId in filteredSpecialEquipment" :key="specialEquipmentId" role="button" :class="{ disabled: !mainStore.isPlaying }" @click="addSpecialEquipment(specialEquipmentId)">
                                            <td class="bg-transparent">{{ $t(`special_equipment.${specialEquipmentId}`) }}</td>
                                            <td class="bg-transparent">{{ specialEquipmentId }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </fieldset>
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

th {
    top: 0;
    z-index: 1;
    position: sticky;
}
</style>
