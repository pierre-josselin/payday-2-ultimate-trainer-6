<script>
import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";
import { useSettingsStore } from "@/stores/settings";

import NavBar from "@/components/NavBar.vue";
import BugIcon from "@/components/icons/BugIcon.vue";
import GameRestartRequiredIcon from "@/components/icons/GameRestartRequiredIcon.vue";

import sportCarVehicleImagePath from "@/assets/images/vehicles/sport-car.jpg";
import muscleCarVehicleImagePath from "@/assets/images/vehicles/muscle-car.jpg";
import bikeVehicleImagePath from "@/assets/images/vehicles/bike.jpg";
import truckVehicleImagePath from "@/assets/images/vehicles/truck.jpg";
import forkliftVehicleImagePath from "@/assets/images/vehicles/forklift.jpg";
import boatVehicleImagePath from "@/assets/images/vehicles/boat.jpg";

export default {
    components: {
        NavBar,
        BugIcon,
        GameRestartRequiredIcon
    },
    data() {
        return {
            vehiclesToLoad: [],
            vehicles: [
                {
                    id: "sport-car",
                    unitId: "units/pd2_dlc_cage/vehicles/fps_vehicle_falcogini_1/fps_vehicle_falcogini_1",
                    imagePath: sportCarVehicleImagePath,
                    name: "main.sport_car"
                },
                {
                    id: "muscle-car",
                    unitId: "units/pd2_dlc_shoutout_raid/vehicles/fps_vehicle_muscle_1/fps_vehicle_muscle_1",
                    imagePath: muscleCarVehicleImagePath,
                    name: "main.muscle_car"
                },
                {
                    id: "bike",
                    unitId: "units/pd2_dlc_born/vehicles/fps_vehicle_bike_2/fps_vehicle_bike_2",
                    imagePath: bikeVehicleImagePath,
                    name: "main.bike"
                },
                {
                    id: "truck",
                    unitId: "units/pd2_dlc_jolly/vehicles/fps_vehicle_box_truck_1/fps_vehicle_box_truck_1",
                    imagePath: truckVehicleImagePath,
                    name: "main.truck"
                },
                {
                    id: "forklift",
                    unitId: "units/pd2_dlc_shoutout_raid/vehicles/fps_vehicle_forklift_1/fps_vehicle_forklift_1",
                    imagePath: forkliftVehicleImagePath,
                    name: "main.forklift"
                },
                {
                    id: "boat",
                    unitId: "units/pd2_dlc_jerry/vehicles/fps_vehicle_boat_rib_1/fps_vehicle_boat_rib_1",
                    imagePath: boatVehicleImagePath,
                    name: "main.boat"
                }
            ]
        };
    },
    created() {
        this.mainStore = useMainStore();
        this.callStore = useCallStore();
        this.settingsStore = useSettingsStore();

        if (this.settingsStore.getSetting("vehicles-to-load")) {
            this.vehiclesToLoad = this.settingsStore.getSetting("vehicles-to-load");
        }
    },
    methods: {
        setVehiclesToLoad() {
            if (this.vehiclesToLoad.length) {
                this.settingsStore.setSetting("vehicles-to-load", this.vehiclesToLoad);
            } else {
                this.settingsStore.deleteSetting("vehicles-to-load");
            }
            this.settingsStore.saveSettings();
        },
        spawnAndDriveVehicle(id) {
            this.callStore.addCall(["UT:spawnAndDriveVehicle", id]);
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
            <div class="card-header">{{ $t("main.driving") }}</div>
            <div class="card-body p-4">
                <div class="mb-3">
                    <b class="me-3">{{ $t("main.vehicles_to_load") }}</b>
                    <div class="form-check form-check-inline" v-for="vehicle in vehicles" :key="vehicle.id">
                        <input :id="vehicle.id" class="form-check-input" type="checkbox" :value="vehicle.id" v-model="vehiclesToLoad" @change="setVehiclesToLoad">
                        <label :for="vehicle.id" class="form-check-label" :class="{ 'text-success': mainStore.isInGame && mainStore.loadedVehicles.includes(vehicle.id) }">{{ $t(vehicle.name) }}</label>
                    </div>
                    <BugIcon />
                    <GameRestartRequiredIcon class="ms-3" />
                </div>
                <div id="carousel" class="carousel slide">
                    <div class="carousel-indicators">
                        <button v-for="(vehicle, index) in vehicles" :key="index" data-bs-target="#carousel" :data-bs-slide-to="index" :class="{ 'active': index === 0 }" />
                    </div>
                    <div class="carousel-inner">
                        <div v-for="(vehicle, index) in vehicles" :key="index" class="carousel-item" :class="{ 'active': index === 0 }">
                            <img :src="vehicle.imagePath" class="d-block w-100">
                            <div class="carousel-caption mb-3">
                                <button class="btn btn-dark" :disabled="!mainStore.isPlaying || !mainStore.loadedVehicles.includes(vehicle.id)" @click="spawnAndDriveVehicle(vehicle.unitId)">
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
                <button class="btn btn-primary mt-3" :disabled="!mainStore.isPlaying || !mainStore.loadedVehicles.length" @click="removeSpawnedVehicles">{{ $t("main.delete_all_spawned_vehicles") }}</button>
            </div>
        </div>
    </div>
</template>

<style scoped>
.carousel-item {
    transition: transform 0.3s ease;
}
</style>
