<script>
import { useCallStore } from "@/stores/calls";

import NavBar from "@/components/NavBar.vue";

export default {
    components: {
        NavBar
    },
    data() {
        return {
            level: null,
            infamyRank: null
        };
    },
    created() {
        this.callStore = useCallStore();
    },
    methods: {
        setLevel() {
            this.callStore.addCall(["UT:setLevel", this.level]);
            this.level = null;
        },
        setInfamyRank() {
            this.callStore.addCall(["UT:setInfamyRank", this.infamyRank]);
            this.infamyRank = null;
        }
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 800px;" class="container my-5">
        <div class="d-flex align-items-start">
            <div style="width: 300px;" class="nav flex-column nav-pills me-3">
                <button class="nav-link active" data-bs-toggle="pill" data-bs-target="#level-tab">{{ $t("main.level") }}</button>
                <button class="nav-link" data-bs-toggle="pill" data-bs-target="#infamy-rank-tab">{{ $t("main.infamy_rank") }}</button>
            </div>
            <div class="tab-content w-100">
                <div id="level-tab" class="tab-pane fade show active" tabindex="0">
                    <form @submit.prevent="setLevel">
                        <div class="mb-3">
                            <label for="level" class="form-label">{{ $t("main.level") }}</label>
                            <input id="level" v-model="level" type="number" min="0" max="100" step="1" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary">{{ $t("main.apply") }}</button>
                    </form>
                </div>
                <div id="infamy-rank-tab" class="tab-pane fade" tabindex="0">
                    <form @submit.prevent="setInfamyRank">
                        <div class="mb-3">
                            <label for="infamy-rank" class="form-label">{{ $t("main.infamy_rank") }}</label>
                            <input id="infamy-rank" v-model="infamyRank" type="number" min="0" max="500" step="1" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary">{{ $t("main.apply") }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>
