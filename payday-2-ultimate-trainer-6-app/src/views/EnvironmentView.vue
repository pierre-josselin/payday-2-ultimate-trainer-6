<script>
import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";

import NavBar from "@/components/NavBar.vue";

export default {
    components: {
        NavBar
    },
    created() {
        this.mainStore = useMainStore();
        this.callStore = useCallStore();
    },
    computed: {
        isInHeist() {
            return this.mainStore.getIsInHeist;
        }
    },
    methods: {
        setEnvironment(environmentId) {
            this.callStore.addCall(["UT:setEnvironment", environmentId]);
        },
        setInitialEnvironment() {
            if (this.isInHeist) {
                this.callStore.addCall(["UT:setInitialEnvironment"]);
            }
        },
        setEnvironmentEarlyMorning() {
            if (this.isInHeist) {
                this.setEnvironment("environments/pd2_env_hox_02/pd2_env_hox_02");
            }
        },
        setEnvironmentMorning() {
            if (this.isInHeist) {
                this.setEnvironment("environments/pd2_env_morning_02/pd2_env_morning_02");
            }
        },
        setEnvironmentMidDay() {
            if (this.isInHeist) {
                this.setEnvironment("environments/pd2_env_mid_day/pd2_env_mid_day");
            }
        },
        setEnvironmentAfternoon() {
            if (this.isInHeist) {
                this.setEnvironment("environments/pd2_env_afternoon/pd2_env_afternoon");
            }
        },
        setEnvironmentBrightDay() {
            if (this.isInHeist) {
                this.setEnvironment("environments/pd2_env_jry_plane/pd2_env_jry_plane");
            }
        },
        setEnvironmentCloudyDay() {
            if (this.isInHeist) {
                this.setEnvironment("environments/pd2_env_docks/pd2_env_docks");
            }
        },
        setEnvironmentNight() {
            if (this.isInHeist) {
                this.setEnvironment("environments/pd2_env_n2/pd2_env_n2");
            }
        },
        setEnvironmentMistyNight() {
            if (this.isInHeist) {
                this.setEnvironment("environments/pd2_env_arm_hcm_02/pd2_env_arm_hcm_02");
            }
        },
        setEnvironmentFoggyNight() {
            if (this.isInHeist) {
                this.setEnvironment("environments/pd2_env_foggy_bright/pd2_env_foggy_bright");
            }
        }
    }
}
</script>

<template>
    <NavBar />

    <div class="container-fluid my-5">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
            <div class="col">
                <div class="card mb-4" @click="setInitialEnvironment" :role="isInHeist ? 'button' : null">
                    <img src="@/assets/environments/default.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.default") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentEarlyMorning" :role="isInHeist ? 'button' : null">
                    <img src="@/assets/environments/early-morning.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.early_morning") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentMorning" :role="isInHeist ? 'button' : null">
                    <img src="@/assets/environments/morning.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.morning") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentMidDay" :role="isInHeist ? 'button' : null">
                    <img src="@/assets/environments/mid-day.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.mid_day") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentAfternoon" :role="isInHeist ? 'button' : null">
                    <img src="@/assets/environments/afternoon.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.afternoon") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentBrightDay" :role="isInHeist ? 'button' : null">
                    <img src="@/assets/environments/bright-day.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.bright_day") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentCloudyDay" :role="isInHeist ? 'button' : null">
                    <img src="@/assets/environments/cloudy-day.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.cloudy_day") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentNight" :role="isInHeist ? 'button' : null">
                    <img src="@/assets/environments/night.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.night") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentMistyNight" :role="isInHeist ? 'button' : null">
                    <img src="@/assets/environments/misty-night.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.misty_night") }}</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4" @click="setEnvironmentFoggyNight" :role="isInHeist ? 'button' : null">
                    <img src="@/assets/environments/foggy-night.jpg" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t("environments.foggy_night") }}</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
