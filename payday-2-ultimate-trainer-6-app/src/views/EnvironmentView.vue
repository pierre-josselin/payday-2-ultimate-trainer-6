<script>
import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";

import NavBar from "@/components/NavBar.vue";

import defaultEnvironmentImagePath from "@/assets/environments/default.jpg";
import earlyMorningEnvironmentImagePath from "@/assets/environments/early-morning.jpg";
import morningEnvironmentImagePath from "@/assets/environments/morning.jpg";
import midDayEnvironmentImagePath from "@/assets/environments/mid-day.jpg";
import afternoonEnvironmentImagePath from "@/assets/environments/afternoon.jpg";
import brightDayEnvironmentImagePath from "@/assets/environments/bright-day.jpg";
import cloudyDayEnvironmentImagePath from "@/assets/environments/cloudy-day.jpg";
import nightEnvironmentImagePath from "@/assets/environments/night.jpg";
import mistyNightEnvironmentImagePath from "@/assets/environments/misty-night.jpg";
import foggyNightEnvironmentImagePath from "@/assets/environments/foggy-night.jpg";

export default {
    components: {
        NavBar
    },
    data() {
        return {
            environments: [
                {
                    id: null,
                    imagePath: defaultEnvironmentImagePath,
                    title: "main.default"
                },
                {
                    id: "environments/pd2_env_hox_02/pd2_env_hox_02",
                    imagePath: earlyMorningEnvironmentImagePath,
                    title: "main.early_morning"
                },
                {
                    id: "environments/pd2_env_morning_02/pd2_env_morning_02",
                    imagePath: morningEnvironmentImagePath,
                    title: "main.morning"
                },
                {
                    id: "environments/pd2_env_mid_day/pd2_env_mid_day",
                    imagePath: midDayEnvironmentImagePath,
                    title: "main.mid_day"
                },
                {
                    id: "environments/pd2_env_afternoon/pd2_env_afternoon",
                    imagePath: afternoonEnvironmentImagePath,
                    title: "main.afternoon"
                },
                {
                    id: "environments/pd2_env_jry_plane/pd2_env_jry_plane",
                    imagePath: brightDayEnvironmentImagePath,
                    title: "main.bright_day"
                },
                {
                    id: "environments/pd2_env_docks/pd2_env_docks",
                    imagePath: cloudyDayEnvironmentImagePath,
                    title: "main.cloudy_day"
                },
                {
                    id: "environments/pd2_env_n2/pd2_env_n2",
                    imagePath: nightEnvironmentImagePath,
                    title: "main.night"
                },
                {
                    id: "environments/pd2_env_arm_hcm_02/pd2_env_arm_hcm_02",
                    imagePath: mistyNightEnvironmentImagePath,
                    title: "main.misty_night"
                },
                {
                    id: "environments/pd2_env_foggy_bright/pd2_env_foggy_bright",
                    imagePath: foggyNightEnvironmentImagePath,
                    title: "main.foggy_night"
                }
            ]
        };
    },
    created() {
        this.mainStore = useMainStore();
        this.callStore = useCallStore();
    },
    methods: {
        setEnvironment(environmentId) {
            if (!this.mainStore.isInHeist) {
                return;
            }

            if (environmentId) {
                this.callStore.addCall(["UT:setEnvironment", environmentId]);
            } else {
                this.callStore.addCall(["UT:setInitialEnvironment"]);
            }
        }
    }
}
</script>

<template>
    <NavBar />

    <div class="container-fluid my-5">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
            <div v-for="(environment, index) in environments" :key="index" class="col">
                <div class="card mb-4" :role="mainStore.isInHeist ? 'button' : null" @click="setEnvironment(environment.id)">
                    <img :src="environment.imagePath" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t(environment.title) }}</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
