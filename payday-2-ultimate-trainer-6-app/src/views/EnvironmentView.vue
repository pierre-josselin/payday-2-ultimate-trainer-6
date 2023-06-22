<script>
import { useCallStore } from "@/stores/calls";

import NavBar from "@/components/NavBar.vue";

export default {
    components: {
        NavBar
    },
    created() {
        this.callStore = useCallStore();
    },
    methods: {
        setEnvironment(environmentId) {
            this.callStore.addCall(["UT:setEnvironment", environmentId]);
        },
        setInitialEnvironment() {
            this.callStore.addCall(["UT:setInitialEnvironment"]);
        },
        setEnvironmentEarlyMorning() {
            this.setEnvironment("environments/pd2_env_hox_02/pd2_env_hox_02");
        },
        setEnvironmentMorning() {
            this.setEnvironment("environments/pd2_env_morning_02/pd2_env_morning_02");
        },
        setEnvironmentMidDay() {
            this.setEnvironment("environments/pd2_env_mid_day/pd2_env_mid_day");
        },
        setEnvironmentAfternoon() {
            this.setEnvironment("environments/pd2_env_afternoon/pd2_env_afternoon");
        },
        setEnvironmentBrightDay() {
            this.setEnvironment("environments/pd2_env_jry_plane/pd2_env_jry_plane");
        },
        setEnvironmentCloudyDay() {
            this.setEnvironment("environments/pd2_env_docks/pd2_env_docks");
        },
        setEnvironmentNight() {
            this.setEnvironment("environments/pd2_env_n2/pd2_env_n2");
        },
        setEnvironmentMistyNight() {
            this.setEnvironment("environments/pd2_env_arm_hcm_02/pd2_env_arm_hcm_02");
        },
        setEnvironmentFoggyNight() {
            this.setEnvironment("environments/pd2_env_foggy_bright/pd2_env_foggy_bright");
        }
    }
}
</script>

<template>
    <NavBar />

    <div class="container-fluid my-5">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
            <div class="col">
                <div class="card mb-4" @click="setInitialEnvironment" role="button">
                    <img src="@/assets/environments/default.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.default") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentEarlyMorning" role="button">
                    <img src="@/assets/environments/early-morning.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.early_morning") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentMorning" role="button">
                    <img src="@/assets/environments/morning.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.morning") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentMidDay" role="button">
                    <img src="@/assets/environments/mid-day.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.mid_day") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentAfternoon" role="button">
                    <img src="@/assets/environments/afternoon.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.afternoon") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentBrightDay" role="button">
                    <img src="@/assets/environments/bright-day.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.bright_day") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentCloudyDay" role="button">
                    <img src="@/assets/environments/cloudy-day.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.cloudy_day") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentNight" role="button">
                    <img src="@/assets/environments/night.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.night") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentMistyNight" role="button">
                    <img src="@/assets/environments/misty-night.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.misty_night") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentFoggyNight" role="button">
                    <img src="@/assets/environments/foggy-night.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.foggy_night") }}</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
