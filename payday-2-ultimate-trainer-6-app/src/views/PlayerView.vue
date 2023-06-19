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
            infamyRank: null,
            spendingMoney: null,
            offshoreMoney: null,
            continentalCoins: null,
            perkPoints: null
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
        },
        addSpendingMoney() {
            this.callStore.addCall(["UT:addSpendingMoney", this.spendingMoney]);
            this.spendingMoney = null;
        },
        addOffshoreMoney() {
            this.callStore.addCall(["UT:addOffshoreMoney", this.offshoreMoney]);
            this.offshoreMoney = null;
        },
        resetMoney() {
            this.callStore.addCall(["UT:resetMoney"]);
        },
        addContinentalCoins() {
            this.callStore.addCall(["UT:addContinentalCoins", this.continentalCoins]);
            this.continentalCoins = null;
        },
        resetContinentalCoins() {
            this.callStore.addCall(["UT:resetContinentalCoins"]);
        },
        addPerkPoints() {
            this.callStore.addCall(["UT:addPerkPoints", this.perkPoints]);
            this.perkPoints = null;
        },
        resetPerkPoints() {
            this.callStore.addCall(["UT:resetPerkPoints"]);
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
                <button class="nav-link" data-bs-toggle="pill" data-bs-target="#money-tab">{{ $t("main.money") }}</button>
                <button class="nav-link" data-bs-toggle="pill" data-bs-target="#continental-coins-tab">{{ $t("main.continental_coins") }}</button>
                <button class="nav-link" data-bs-toggle="pill" data-bs-target="#perk-points-tab">{{ $t("main.perk_points") }}</button>
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
                <div id="money-tab" class="tab-pane fade" tabindex="0">
                    <form @submit.prevent="addSpendingMoney" class="mb-4">
                        <div class="mb-3">
                            <label for="spending-money" class="form-label">{{ $t("main.spending_money") }}</label>
                            <input id="spending-money" v-model="spendingMoney" type="number" min="1" step="1" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary">{{ $t("main.add") }}</button>
                    </form>
                    <form @submit.prevent="addOffshoreMoney" class="mb-4">
                        <div class="mb-3">
                            <label for="offshore-money" class="form-label">{{ $t("main.offshore_money") }}</label>
                            <input id="offshore-money" v-model="offshoreMoney" type="number" min="1" step="1" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary">{{ $t("main.add") }}</button>
                    </form>
                    <form @submit.prevent="resetMoney">
                        <button type="submit" class="btn btn-danger">{{ $t("main.reset_money") }}</button>
                    </form>
                </div>
                <div id="continental-coins-tab" class="tab-pane fade" tabindex="0">
                    <form @submit.prevent="addContinentalCoins" class="mb-4">
                        <div class="mb-3">
                            <label for="continental-coins" class="form-label">{{ $t("main.continental_coins") }}</label>
                            <input id="continental-coins" v-model="continentalCoins" type="number" min="1" step="1" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary">{{ $t("main.add") }}</button>
                    </form>
                    <form @submit.prevent="resetContinentalCoins">
                        <button type="submit" class="btn btn-danger">{{ $t("main.reset_continental_coins") }}</button>
                    </form>
                </div>
                <div id="perk-points-tab" class="tab-pane fade" tabindex="0">
                    <form @submit.prevent="addPerkPoints" class="mb-4">
                        <div class="mb-3">
                            <label for="perk-points" class="form-label">{{ $t("main.perk_points") }}</label>
                            <input id="perk-points" v-model="perkPoints" type="number" min="1" step="1" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary">{{ $t("main.add") }}</button>
                    </form>
                    <form @submit.prevent="resetPerkPoints">
                        <button type="submit" class="btn btn-danger">{{ $t("main.reset_perk_points") }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>
