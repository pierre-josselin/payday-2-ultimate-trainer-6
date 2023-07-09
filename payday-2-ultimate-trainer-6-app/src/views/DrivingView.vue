<script>
import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";
import { useSettingsStore } from "@/stores/settings";

import NavBar from "@/components/NavBar.vue";

import sportCarVehicleImagePath from "@/assets/vehicles/sport-car.jpg";
import muscleCarVehicleImagePath from "@/assets/vehicles/muscle-car.jpg";
import bikeVehicleImagePath from "@/assets/vehicles/bike.jpg";
import truckVehicleImagePath from "@/assets/vehicles/truck.jpg";
import forkliftVehicleImagePath from "@/assets/vehicles/forklift.jpg";
import boatVehicleImagePath from "@/assets/vehicles/boat.jpg";

export default {
    components: {
        NavBar
    },
    data() {
        return {
            enableVehiclesPackagesLoading: false,
            vehicles: [
                {
                    id: "units/pd2_dlc_cage/vehicles/fps_vehicle_falcogini_1/fps_vehicle_falcogini_1",
                    imagePath: sportCarVehicleImagePath
                },
                {
                    id: "units/pd2_dlc_shoutout_raid/vehicles/fps_vehicle_muscle_1/fps_vehicle_muscle_1",
                    imagePath: muscleCarVehicleImagePath
                },
                {
                    id: "units/pd2_dlc_born/vehicles/fps_vehicle_bike_2/fps_vehicle_bike_2",
                    imagePath: bikeVehicleImagePath
                },
                {
                    id: "units/pd2_dlc_jolly/vehicles/fps_vehicle_box_truck_1/fps_vehicle_box_truck_1",
                    imagePath: truckVehicleImagePath
                },
                {
                    id: "units/pd2_dlc_shoutout_raid/vehicles/fps_vehicle_forklift_1/fps_vehicle_forklift_1",
                    imagePath: forkliftVehicleImagePath
                },
                {
                    id: "units/pd2_dlc_jerry/vehicles/fps_vehicle_boat_rib_1/fps_vehicle_boat_rib_1",
                    imagePath: boatVehicleImagePath
                }
            ]
        };
    },
    created() {
        this.mainStore = useMainStore();
        this.callStore = useCallStore();
        this.settingsStore = useSettingsStore();

        this.enableVehiclesPackagesLoading = this.settingsStore.getSetting("enable-vehicles-packages-loading");
    },
    methods: {
        setVehiclesPackagesLoading() {
            this.settingsStore.setSetting("enable-vehicles-packages-loading", this.enableVehiclesPackagesLoading);
            this.settingsStore.saveSettings();

            if (this.mainStore.isInGame) {
                alert(this.$t("main.heist_restart_required"));
            }
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
                <span v-if="mainStore.vehiclesPackagesLoaded" class="badge text-bg-success">{{ $t("main.vehicles_packages_loaded") }}</span>
                <span v-else class="badge text-bg-warning">{{ $t("main.vehicles_packages_not_loaded") }}</span>
            </div>
            <div class="card-body p-4">
                <div class="form-check form-switch mb-3">
                    <input id="enable-vehicles-packages-loading" v-model="enableVehiclesPackagesLoading" class="form-check-input" type="checkbox" @change="setVehiclesPackagesLoading">
                    <label for="enable-vehicles-packages-loading" class="form-check-label">{{ $t("main.vehicles_packages_loading") }}</label>
                </div>
                <div id="carousel" class="carousel slide">
                    <div class="carousel-indicators">
                        <button v-for="(vehicle, index) in vehicles" :key="index" data-bs-target="#carousel" :data-bs-slide-to="index" :class="{ 'active': index === 0 }"></button>
                    </div>
                    <div class="carousel-inner">
                        <div v-for="(vehicle, index) in vehicles" :key="index" class="carousel-item" :class="{ 'active': index === 0 }">
                            <img :src="vehicle.imagePath" class="d-block w-100">
                            <div class="carousel-caption mb-3">
                                <button class="btn btn-dark" @click="spawnAndEnterVehicle(vehicle.id)" :disabled="!mainStore.vehiclesPackagesLoaded || !mainStore.isPlaying">
                                    <FontAwesomeIcon icon="key" class="me-3" />{{ $t("main.drive") }}
                                </button>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" data-bs-target="#carousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true" />
                    </button>
                    <button class="carousel-control-next" data-bs-target="#carousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true" />
                    </button>
                </div>
                <button class="btn btn-primary mt-3" @click="removeSpawnedVehicles" :disabled="!mainStore.vehiclesPackagesLoaded || !mainStore.isPlaying">{{ $t("main.delete_all_spawned_vehicles") }}</button>
            </div>
        </div>
    </div>
</template>

<style scoped>
.carousel-item {
    transition: transform 0.3s ease;
}
</style>