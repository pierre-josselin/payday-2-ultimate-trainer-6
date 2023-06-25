<script>
import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";
import { useSettingsStore } from "@/stores/settings";

import NavBar from "@/components/NavBar.vue";

export default {
    components: {
        NavBar
    },
    data() {
        return {
            enableVehiclesPackagesLoading: false,
            vehicles: [
                "units/pd2_dlc_cage/vehicles/fps_vehicle_falcogini_1/fps_vehicle_falcogini_1",
                "units/pd2_dlc_shoutout_raid/vehicles/fps_vehicle_muscle_1/fps_vehicle_muscle_1",
                "units/pd2_dlc_born/vehicles/fps_vehicle_bike_2/fps_vehicle_bike_2",
                "units/pd2_dlc_jolly/vehicles/fps_vehicle_box_truck_1/fps_vehicle_box_truck_1",
                "units/pd2_dlc_shoutout_raid/vehicles/fps_vehicle_forklift_1/fps_vehicle_forklift_1",
                "units/pd2_dlc_jerry/vehicles/fps_vehicle_boat_rib_1/fps_vehicle_boat_rib_1"
            ]
        };
    },
    created() {
        this.mainStore = useMainStore();
        this.callStore = useCallStore();
        this.settingsStore = useSettingsStore();

        this.enableVehiclesPackagesLoading = this.settingsStore.getSetting("enable-vehicles-packages-loading");
    },
    computed: {
        isPlaying() {
            return this.mainStore.getIsPlaying;
        },
        vehiclesPackagesLoaded() {
            return this.mainStore.getVehiclesPackagesLoaded;
        }
    },
    methods: {
        setVehiclesPackagesLoading() {
            this.settingsStore.setSetting("enable-vehicles-packages-loading", this.enableVehiclesPackagesLoading);
            this.settingsStore.saveSettings();
        },
        spawnAndEnterVehicle(id) {
            this.callStore.addCall(["UT:spawnAndEnterVehicle", id]);
        },
        removeSpawnedVehicles() {
            this.callStore.addCall(["UT:removeSpawnedVehicles"]);
        }
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 1000px;" class="container my-5">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                {{ $t("main.driving") }}
                <span class="badge text-bg-success" v-if="vehiclesPackagesLoaded">{{ $t("main.vehicles_packages_loaded") }}</span>
                <span class="badge text-bg-warning" v-else>{{ $t("main.vehicles_packages_not_loaded") }}</span>
            </div>
            <div class="card-body p-4">
                <div class="form-check form-switch mb-3">
                    <input id="enable-vehicles-packages-loading" class="form-check-input" type="checkbox" v-model="enableVehiclesPackagesLoading" @change="setVehiclesPackagesLoading">
                    <label for="enable-vehicles-packages-loading" class="form-check-label">{{ $t("main.vehicles_packages_loading") }}</label>
                </div>
                <fieldset :disabled="!vehiclesPackagesLoaded || !isPlaying">
                    <div id="carousel" class="carousel slide">
                        <div class="carousel-indicators">
                            <button data-bs-target="#carousel" data-bs-slide-to="0" class="active"></button>
                            <button data-bs-target="#carousel" data-bs-slide-to="1"></button>
                            <button data-bs-target="#carousel" data-bs-slide-to="2"></button>
                            <button data-bs-target="#carousel" data-bs-slide-to="3"></button>
                            <button data-bs-target="#carousel" data-bs-slide-to="4"></button>
                            <button data-bs-target="#carousel" data-bs-slide-to="5"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="@/assets/vehicles/sport-car.jpg" class="d-block w-100">
                                <div class="carousel-caption mb-3">
                                    <button class="btn btn-dark" @click="spawnAndEnterVehicle('units/pd2_dlc_cage/vehicles/fps_vehicle_falcogini_1/fps_vehicle_falcogini_1')">
                                        <FontAwesomeIcon icon="key" class="me-3" />{{ $t("main.drive") }}
                                    </button>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="@/assets/vehicles/muscle-car.jpg" class="d-block w-100">
                                <div class="carousel-caption mb-3">
                                    <button class="btn btn-dark" @click="spawnAndEnterVehicle('units/pd2_dlc_shoutout_raid/vehicles/fps_vehicle_muscle_1/fps_vehicle_muscle_1')">
                                        <FontAwesomeIcon icon="key" class="me-3" />{{ $t("main.drive") }}
                                    </button>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="@/assets/vehicles/bike.jpg" class="d-block w-100">
                                <div class="carousel-caption mb-3">
                                    <button class="btn btn-dark" @click="spawnAndEnterVehicle('units/pd2_dlc_born/vehicles/fps_vehicle_bike_2/fps_vehicle_bike_2')">
                                        <FontAwesomeIcon icon="key" class="me-3" />{{ $t("main.drive") }}
                                    </button>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="@/assets/vehicles/truck.jpg" class="d-block w-100">
                                <div class="carousel-caption mb-3">
                                    <button class="btn btn-dark" @click="spawnAndEnterVehicle('units/pd2_dlc_jolly/vehicles/fps_vehicle_box_truck_1/fps_vehicle_box_truck_1')">
                                        <FontAwesomeIcon icon="key" class="me-3" />{{ $t("main.drive") }}
                                    </button>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="@/assets/vehicles/forklift.jpg" class="d-block w-100">
                                <div class="carousel-caption mb-3">
                                    <button class="btn btn-dark" @click="spawnAndEnterVehicle('units/pd2_dlc_shoutout_raid/vehicles/fps_vehicle_forklift_1/fps_vehicle_forklift_1')">
                                        <FontAwesomeIcon icon="key" class="me-3" />{{ $t("main.drive") }}
                                    </button>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="@/assets/vehicles/boat.jpg" class="d-block w-100">
                                <div class="carousel-caption mb-3">
                                    <button class="btn btn-dark" @click="spawnAndEnterVehicle('units/pd2_dlc_jerry/vehicles/fps_vehicle_boat_rib_1/fps_vehicle_boat_rib_1')">
                                        <FontAwesomeIcon icon="key" class="me-3" />{{ $t("main.drive") }}
                                    </button>
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" data-bs-target="#carousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        </button>
                        <button class="carousel-control-next" data-bs-target="#carousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        </button>
                    </div>
                    <button class="btn btn-primary mt-3" @click="removeSpawnedVehicles">{{ $t("main.delete_all_spawned_vehicles") }}</button>
                </fieldset>
            </div>
        </div>
    </div>
</template>
