<script>
import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";

import NavBar from "@/components/NavBar.vue";

export default {
    components: {
        NavBar
    },
    data() {
        return {
            environments: [
                {
                    id: null,
                    imagePath: "/src/assets/environments/default.jpg",
                    title: "environments.default"
                },
                {
                    id: "environments/pd2_env_hox_02/pd2_env_hox_02",
                    imagePath: "/src/assets/environments/early-morning.jpg",
                    title: "environments.early_morning"
                },
                {
                    id: "environments/pd2_env_morning_02/pd2_env_morning_02",
                    imagePath: "/src/assets/environments/morning.jpg",
                    title: "environments.morning"
                },
                {
                    id: "environments/pd2_env_mid_day/pd2_env_mid_day",
                    imagePath: "/src/assets/environments/mid-day.jpg",
                    title: "environments.mid_day"
                },
                {
                    id: "environments/pd2_env_afternoon/pd2_env_afternoon",
                    imagePath: "/src/assets/environments/afternoon.jpg",
                    title: "environments.afternoon"
                },
                {
                    id: "environments/pd2_env_jry_plane/pd2_env_jry_plane",
                    imagePath: "/src/assets/environments/bright-day.jpg",
                    title: "environments.bright_day"
                },
                {
                    id: "environments/pd2_env_docks/pd2_env_docks",
                    imagePath: "/src/assets/environments/cloudy-day.jpg",
                    title: "environments.cloudy_day"
                },
                {
                    id: "environments/pd2_env_n2/pd2_env_n2",
                    imagePath: "/src/assets/environments/night.jpg",
                    title: "environments.night"
                },
                {
                    id: "environments/pd2_env_arm_hcm_02/pd2_env_arm_hcm_02",
                    imagePath: "/src/assets/environments/misty-night.jpg",
                    title: "environments.misty_night"
                },
                {
                    id: "environments/pd2_env_foggy_bright/pd2_env_foggy_bright",
                    imagePath: "/src/assets/environments/foggy-night.jpg",
                    title: "environments.foggy_night"
                }
            ]
        };
    },
    computed: {
        isInHeist() {
            return this.mainStore.getIsInHeist;
        }
    },
    created() {
        this.mainStore = useMainStore();
        this.callStore = useCallStore();
    },
    methods: {
        setEnvironment(environmentId) {
            if (!this.isInHeist) {
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
                <div class="card mb-4" :role="isInHeist ? 'button' : null" @click="setEnvironment(environment.id)">
                    <img :src="environment.imagePath" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title mb-0">{{ $t(environment.title) }}</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
