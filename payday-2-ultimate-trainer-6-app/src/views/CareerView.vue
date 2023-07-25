<script>
import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";
import { useSettingsStore } from "@/stores/settings";

import NavBar from "@/components/NavBar.vue";
import BugIcon from "@/components/icons/BugIcon.vue";
import GameRestartRequiredIcon from "@/components/icons/GameRestartRequiredIcon.vue";

import colors from "@/data/colors.json";
import masks from "@/data/masks.json";
import materials from "@/data/materials.json";
import textures from "@/data/textures.json";
import weaponMods from "@/data/weapon-mods.json";
import trophies from "@/data/trophies.json";
import steamAchievements from "@/data/steam-achievements.json";

export default {
    components: {
        NavBar,
        BugIcon,
        GameRestartRequiredIcon
    },
    data() {
        return {
            level: null,
            infamyRank: null,
            spendingMoney: null,
            offshoreMoney: null,
            continentalCoins: null,
            enableSkillPointHack: null,
            skillPoints: null,
            perkPoints: null,
            blackMarketCategory: "masks",
            selectAllBlackMarketItems: false,
            blackMarketItemsSearch: null,
            selectedBlackMarketItems: [],
            selectAllTrophies: false,
            trophiesSearch: null,
            selectedTrophies: [],
            selectAllSteamAchievements: false,
            steamAchievementsSearch: null,
            selectedSteamAchievements: [],
            blackMarketCategoryLocaleKeys: {
                colors: "colors",
                masks: "masks",
                materials: "materials",
                textures: "textures",
                weaponMods: "weapon_mods"
            }
        };
    },
    computed: {
        filteredBlackMarketItems() {
            if (!this.blackMarketCategory) {
                return null;
            }

            if (!this.blackMarketItemsSearch) {
                return this.blackMarketItems[this.blackMarketCategory];
            }

            const filteredBlackMarketItems = [];
            for (const blackMarketItemId of this.blackMarketItems[this.blackMarketCategory]) {
                const blackMarketItemName = this.$t(`${this.blackMarketCategoryLocaleKeys[this.blackMarketCategory]}.${blackMarketItemId}`);
                if (blackMarketItemName.toLowerCase().includes(this.blackMarketItemsSearch.toLowerCase())) {
                    filteredBlackMarketItems.push(blackMarketItemId);
                }
            }

            return filteredBlackMarketItems;
        },
        filteredTrophies() {
            if (!this.trophiesSearch) {
                return this.trophies;
            }

            const filteredTrophies = [];
            for (const trophyId of this.trophies) {
                const trophyName = this.$t(`trophies.${trophyId}`);
                if (trophyName.toLowerCase().includes(this.trophiesSearch.toLowerCase())) {
                    filteredTrophies.push(trophyId);
                }
            }

            return filteredTrophies;
        },
        filteredSteamAchievements() {
            if (!this.steamAchievementsSearch) {
                return this.steamAchievements;
            }

            const filteredSteamAchievements = [];
            for (const steamAchievementId of this.steamAchievements) {
                const steamAchievementName = this.$t(`steam_achievements.${steamAchievementId}`);
                if (steamAchievementName.toLowerCase().includes(this.steamAchievementsSearch.toLowerCase())) {
                    filteredSteamAchievements.push(steamAchievementId);
                }
            }

            return filteredSteamAchievements;
        }
    },
    watch: {
        blackMarketCategory() {
            this.selectedBlackMarketItems = [];
            this.selectAllBlackMarketItems = false;
        }
    },
    created() {
        this.mainStore = useMainStore();
        this.callStore = useCallStore();
        this.settingsStore = useSettingsStore();

        this.blackMarketItems = { colors, masks, materials, textures, weaponMods };
        this.trophies = trophies;
        this.steamAchievements = steamAchievements;

        this.enableSkillPointHack = this.settingsStore.getSetting("enable-skill-point-hack");
        this.skillPoints = this.settingsStore.getSetting("skill-points");
    },
    methods: {
        setLevel() {
            this.callStore.addCall(["UT:setLevel", this.level]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
            this.level = null;
        },
        setInfamyRank() {
            this.callStore.addCall(["UT:setInfamyRank", this.infamyRank]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
            this.infamyRank = null;
        },
        addSpendingMoney() {
            this.callStore.addCall(["UT:addSpendingMoney", this.spendingMoney]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
            this.spendingMoney = null;
        },
        addOffshoreMoney() {
            this.callStore.addCall(["UT:addOffshoreMoney", this.offshoreMoney]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
            this.offshoreMoney = null;
        },
        resetMoney() {
            this.callStore.addCall(["UT:resetMoney"]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
        },
        addContinentalCoins() {
            this.callStore.addCall(["UT:addContinentalCoins", this.continentalCoins]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
            this.continentalCoins = null;
        },
        resetContinentalCoins() {
            this.callStore.addCall(["UT:resetContinentalCoins"]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
        },
        setSkillPointHack() {
            if (!this.enableSkillPointHack || this.skillPoints === "") {
                this.skillPoints = null;
            }
            this.settingsStore.setSetting("enable-skill-point-hack", this.enableSkillPointHack);
            this.settingsStore.setSetting("skill-points", this.skillPoints);
            this.settingsStore.saveSettings();
        },
        addPerkPoints() {
            this.callStore.addCall(["UT:addPerkPoints", this.perkPoints]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
            this.perkPoints = null;
        },
        resetPerkDecks() {
            this.callStore.addCall(["UT:resetPerkDecks"]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
        },
        addItemsToBlackMarket() {
            this.callStore.addCall(["UT:addItemsToBlackMarket", this.blackMarketCategory, this.selectedBlackMarketItems]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
        },
        removeItemsFromBlackMarket() {
            this.callStore.addCall(["UT:removeItemsFromBlackMarket", this.blackMarketCategory, this.selectedBlackMarketItems]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
        },
        unlockBlackMarketSlots() {
            this.callStore.addCall(["UT:setBlackMarketSlotsLock", true]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
        },
        lockBlackMarketSlots() {
            this.callStore.addCall(["UT:setBlackMarketSlotsLock", false]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
        },
        removeBlackMarketExclamationMarks() {
            this.callStore.addCall(["UT:removeBlackMarketExclamationMarks"]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
        },
        unlockTrophies() {
            this.callStore.addCall(["UT:unlockTrophies", this.selectedTrophies]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
        },
        lockTrophies() {
            this.callStore.addCall(["UT:lockTrophies", this.selectedTrophies]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
        },
        unlockSteamAchievements() {
            this.callStore.addCall(["UT:unlockSteamAchievements", this.selectedSteamAchievements]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
        },
        lockSteamAchievements() {
            this.callStore.addCall(["UT:lockSteamAchievements", this.selectedSteamAchievements]);
            if (this.mainStore.isInMainMenu) {
                this.callStore.addCall(["UT.GameUtility:refreshPlayerProfileGUI"]);
            }
            this.callStore.addCall(["UT.GameUtility:saveProgress"]);
        },
        toggleAllBlackMarketItems() {
            this.selectedBlackMarketItems = [];
            if (this.selectAllBlackMarketItems) {
                for (const itemId of this.blackMarketItems[this.blackMarketCategory]) {
                    this.selectedBlackMarketItems.push(itemId);
                }
            }
        },
        toggleAllTrophies() {
            this.selectedTrophies = [];
            if (this.selectAllTrophies) {
                for (const trophyId of this.trophies) {
                    this.selectedTrophies.push(trophyId);
                }
            }
        },
        toggleAllSteamAchievements() {
            this.selectedSteamAchievements = [];
            if (this.selectAllSteamAchievements) {
                for (const steamAchievementId of this.steamAchievements) {
                    this.selectedSteamAchievements.push(steamAchievementId);
                }
            }
        },
        toggleSelectedBlackMarketItem(itemId) {
            const index = this.selectedBlackMarketItems.indexOf(itemId);
            if (index !== -1) {
                this.selectedBlackMarketItems.splice(index, 1);
            } else {
                this.selectedBlackMarketItems.push(itemId);
            }
        },
        toggleSelectedTrophy(trophyId) {
            const index = this.selectedTrophies.indexOf(trophyId);
            if (index !== -1) {
                this.selectedTrophies.splice(index, 1);
            } else {
                this.selectedTrophies.push(trophyId);
            }
        },
        toggleSelectedSteamAchievement(steamAchievementId) {
            const index = this.selectedSteamAchievements.indexOf(steamAchievementId);
            if (index !== -1) {
                this.selectedSteamAchievements.splice(index, 1);
            } else {
                this.selectedSteamAchievements.push(steamAchievementId);
            }
        }
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 850px;" class="container my-5">
        <div class="card">
            <div class="card-header">{{ $t("main.career") }}</div>
            <div class="card-body p-4">
                <div class="row">
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="nav nav-pills">
                            <button class="nav-link text-start w-100 active" data-bs-toggle="pill" data-bs-target="#level-tab">{{ $t("main.level") }}</button>
                            <button class="nav-link text-start w-100" data-bs-toggle="pill" data-bs-target="#infamy-rank-tab">{{ $t("main.infamy_rank") }}</button>
                            <button class="nav-link text-start w-100" data-bs-toggle="pill" data-bs-target="#money-tab">{{ $t("main.money") }}</button>
                            <button class="nav-link text-start w-100" data-bs-toggle="pill" data-bs-target="#continental-coins-tab">{{ $t("main.continental_coins") }}</button>
                            <button class="nav-link text-start w-100" data-bs-toggle="pill" data-bs-target="#skill-points-tab">{{ $t("main.skill_points") }}</button>
                            <button class="nav-link text-start w-100" data-bs-toggle="pill" data-bs-target="#perk-points-tab">{{ $t("main.perk_points") }}</button>
                            <button class="nav-link text-start w-100" data-bs-toggle="pill" data-bs-target="#inventory-tab">{{ $t("main.inventory") }}</button>
                            <button class="nav-link text-start w-100" data-bs-toggle="pill" data-bs-target="#trophies-tab">{{ $t("main.trophies") }}</button>
                            <button class="nav-link text-start w-100" data-bs-toggle="pill" data-bs-target="#steam-achievements-tab">{{ $t("main.steam_achievements") }}</button>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <fieldset class="tab-content" :class="{ disabled: mainStore.isOffline }" :disabled="mainStore.isOffline">
                            <div id="level-tab" class="tab-pane show active" tabindex="0">
                                <form @submit.prevent="setLevel">
                                    <div class="row align-items-end">
                                        <div class="col-8">
                                            <label for="level" class="form-label">{{ $t("main.level") }}</label>
                                            <input id="level" v-model="level" type="number" min="0" max="100" step="1" class="form-control" required>
                                        </div>
                                        <div class="col-4">
                                            <button type="submit" class="btn btn-primary w-100">{{ $t("main.apply") }}</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div id="infamy-rank-tab" class="tab-pane" tabindex="0">
                                <form @submit.prevent="setInfamyRank">
                                    <div class="row align-items-end">
                                        <div class="col-8">
                                            <label for="infamy-rank" class="form-label">{{ $t("main.infamy_rank") }}</label>
                                            <input id="infamy-rank" v-model="infamyRank" type="number" min="0" max="500" step="1" class="form-control" required>
                                        </div>
                                        <div class="col-4">
                                            <button type="submit" class="btn btn-primary w-100">{{ $t("main.apply") }}</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div id="money-tab" class="tab-pane" tabindex="0">
                                <form class="mb-4" @submit.prevent="addSpendingMoney">
                                    <div class="row align-items-end">
                                        <div class="col-8">
                                            <label for="spending-money" class="form-label">{{ $t("main.spending_money") }}</label>
                                            <input id="spending-money" v-model="spendingMoney" type="number" min="1" step="1" class="form-control" required>
                                        </div>
                                        <div class="col-4">
                                            <button type="submit" class="btn btn-primary w-100">{{ $t("main.add") }}</button>
                                        </div>
                                    </div>
                                </form>
                                <form class="mb-4" @submit.prevent="addOffshoreMoney">
                                    <div class="row align-items-end">
                                        <div class="col-8">
                                            <label for="offshore-money" class="form-label">{{ $t("main.offshore_money") }}</label>
                                            <input id="offshore-money" v-model="offshoreMoney" type="number" min="1" step="1" class="form-control" required>
                                        </div>
                                        <div class="col-4">
                                            <button type="submit" class="btn btn-primary w-100">{{ $t("main.add") }}</button>
                                        </div>
                                    </div>
                                </form>
                                <form @submit.prevent="resetMoney">
                                    <button type="submit" class="btn btn-warning">{{ $t("main.reset_money") }}</button>
                                </form>
                            </div>
                            <div id="continental-coins-tab" class="tab-pane" tabindex="0">
                                <form class="mb-4" @submit.prevent="addContinentalCoins">
                                    <div class="row align-items-end">
                                        <div class="col-8">
                                            <label for="continental-coins" class="form-label">{{ $t("main.continental_coins") }}</label>
                                            <input id="continental-coins" v-model="continentalCoins" type="number" min="1" step="1" class="form-control" required>
                                        </div>
                                        <div class="col-4">
                                            <button type="submit" class="btn btn-primary w-100">{{ $t("main.add") }}</button>
                                        </div>
                                    </div>
                                </form>
                                <form @submit.prevent="resetContinentalCoins">
                                    <button type="submit" class="btn btn-warning">{{ $t("main.reset_continental_coins") }}</button>
                                </form>
                            </div>
                            <div id="skill-points-tab" class="tab-pane" tabindex="0">
                                <div class="form-check form-switch mb-3" @change="setSkillPointHack">
                                    <input id="enable-skill-point-hack" v-model="enableSkillPointHack" class="form-check-input" type="checkbox">
                                    <label for="enable-skill-point-hack" class="form-check-label">{{ $t("main.enable_skill_point_hack") }}</label>
                                    <GameRestartRequiredIcon class="ms-3" />
                                </div>
                                <div class="row align-items-end">
                                    <label for="skill-points" class="form-label">{{ $t("main.skill_points") }}</label>
                                    <input id="skill-points" v-model="skillPoints" type="number" min="0" max="690" step="1" class="form-control" :disabled="!enableSkillPointHack" @change="setSkillPointHack">
                                </div>
                            </div>
                            <div id="perk-points-tab" class="tab-pane" tabindex="0">
                                <form class="mb-4" @submit.prevent="addPerkPoints">
                                    <div class="row align-items-end">
                                        <div class="col-8">
                                            <label for="perk-points" class="form-label">{{ $t("main.perk_points") }}</label>
                                            <input id="perk-points" v-model="perkPoints" type="number" min="1" step="1" class="form-control" required>
                                        </div>
                                        <div class="col-4">
                                            <button type="submit" class="btn btn-primary w-100">{{ $t("main.add") }}</button>
                                        </div>
                                    </div>
                                </form>
                                <form @submit.prevent="resetPerkDecks">
                                    <button type="submit" class="btn btn-warning">{{ $t("main.reset_perk_decks") }}</button>
                                </form>
                            </div>
                            <div id="inventory-tab" class="tab-pane" tabindex="0">
                                <form class="mb-4" @submit.prevent="addItemsToBlackMarket">
                                    <div class="mb-3">
                                        <label for="black-market-category" class="form-label">{{ $t("main.category") }}</label>
                                        <select id="black-market-category" v-model="blackMarketCategory" class="form-select">
                                            <option value="masks">{{ $t("main.masks") }}</option>
                                            <option value="materials">{{ $t("main.materials") }}</option>
                                            <option value="textures">{{ $t("main.textures") }}</option>
                                            <option value="colors">{{ $t("main.colors") }}</option>
                                            <option value="weaponMods">{{ $t("main.weapon_mods") }}</option>
                                        </select>
                                    </div>
                                    <template v-if="blackMarketCategory">
                                        <div class="mb-3">
                                            <div class="table-responsive">
                                                <table class="table align-middle mb-0">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 40px;" class="bg-dark text-center align-middle">
                                                                <input v-model="selectAllBlackMarketItems" class="form-check-input" type="checkbox" role="button" @change="toggleAllBlackMarketItems">
                                                            </th>
                                                            <th class="bg-dark">
                                                                <input v-model="blackMarketItemsSearch" type="search" class="form-control form-control-sm">
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-for="itemId in filteredBlackMarketItems" :key="itemId" role="button" @click="toggleSelectedBlackMarketItem(itemId)">
                                                            <td class="bg-transparent text-center align-middle">
                                                                <input v-model="selectedBlackMarketItems" class="form-check-input" type="checkbox" :value="itemId" role="button">
                                                            </td>
                                                            <td class="bg-transparent">{{ $t(`${blackMarketCategory === "weaponMods" ? "weapon_mods" : blackMarketCategory}.${itemId}`) }}</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary me-3" :disabled="!selectedBlackMarketItems.length">{{ $t("main.add") }} {{ selectedBlackMarketItems.length ? `(${selectedBlackMarketItems.length})` : null }}</button>
                                        <button type="button" class="btn btn-warning" :disabled="!selectedBlackMarketItems.length" @click="removeItemsFromBlackMarket">{{ $t("main.remove") }} {{ selectedBlackMarketItems.length ? `(${selectedBlackMarketItems.length})` : null }}</button>
                                    </template>
                                </form>
                                <div class="mb-4">
                                    <button type="button" class="btn btn-primary me-3" @click="unlockBlackMarketSlots">{{ $t("main.unlock_slots") }}</button>
                                    <button type="button" class="btn btn-primary" @click="lockBlackMarketSlots">{{ $t("main.lock_slots") }}</button>
                                </div>
                                <form @submit.prevent="removeBlackMarketExclamationMarks">
                                    <button type="submit" class="btn btn-primary">{{ $t("main.remove_exclamation_marks") }}</button>
                                </form>
                            </div>
                            <div id="trophies-tab" class="tab-pane" tabindex="0">
                                <form @submit.prevent="unlockTrophies">
                                    <div class="mb-3">
                                        <div class="table-responsive">
                                            <table class="table align-middle mb-0">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 40px;" class="bg-dark text-center align-middle">
                                                            <input v-model="selectAllTrophies" class="form-check-input" type="checkbox" role="button" @change="toggleAllTrophies">
                                                        </th>
                                                        <th class="bg-dark">
                                                            <input v-model="trophiesSearch" type="search" class="form-control form-control-sm">
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="trophyId in filteredTrophies" :key="trophyId" role="button" @click="toggleSelectedTrophy(trophyId)">
                                                        <td class="bg-transparent text-center align-middle">
                                                            <input v-model="selectedTrophies" class="form-check-input" type="checkbox" :value="trophyId" role="button">
                                                        </td>
                                                        <td class="bg-transparent">{{ $t(`trophies.${trophyId}`) }}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary me-3" :disabled="!selectedTrophies.length">{{ $t("main.unlock") }} {{ selectedTrophies.length ? `(${selectedTrophies.length})` : null }}</button>
                                    <button type="button" class="btn btn-primary" :disabled="!selectedTrophies.length" @click="lockTrophies">{{ $t("main.lock") }} {{ selectedTrophies.length ? `(${selectedTrophies.length})` : null }}</button>
                                </form>
                            </div>
                            <div id="steam-achievements-tab" class="tab-pane" tabindex="0">
                                <form @submit.prevent="unlockSteamAchievements">
                                    <div class="mb-3">
                                        <div class="table-responsive">
                                            <table class="table align-middle mb-0">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 40px;" class="bg-dark text-center align-middle">
                                                            <input v-model="selectAllSteamAchievements" class="form-check-input" type="checkbox" role="button" @change="toggleAllSteamAchievements">
                                                        </th>
                                                        <th class="bg-dark"><input v-model="steamAchievementsSearch" type="search" class="form-control form-control-sm"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="steamAchievementId in filteredSteamAchievements" :key="steamAchievementId" role="button" @click="toggleSelectedSteamAchievement(steamAchievementId)">
                                                        <td class="bg-transparent text-center align-middle">
                                                            <input v-model="selectedSteamAchievements" class="form-check-input" type="checkbox" :value="steamAchievementId" role="button">
                                                        </td>
                                                        <td class="bg-transparent">{{ $t(`steam_achievements.${steamAchievementId}`) }}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-danger me-3" :disabled="!selectedSteamAchievements.length">
                                        {{ $t("main.unlock") }} {{ selectedSteamAchievements.length ? `(${selectedSteamAchievements.length})` : null }}
                                        <BugIcon v-if="selectedSteamAchievements.length > 10" class="ms-3" />
                                    </button>
                                    <button type="button" class="btn btn-danger" :disabled="!selectedSteamAchievements.length" @click="selectedSteamAchievements">{{ $t("main.lock") }} {{ selectedSteamAchievements.length ? `(${selectedSteamAchievements.length})` : null }}</button>
                                </form>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.nav-link {
    transition: none;
}

.table-responsive {
    max-height: 400px;
}

thead {
    overflow: auto;
}

thead th {
    position: sticky;
    top: 0;
    z-index: 1;
}
</style>
