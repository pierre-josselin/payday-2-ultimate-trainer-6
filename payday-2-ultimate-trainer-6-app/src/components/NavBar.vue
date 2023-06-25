<script>
import { RouterLink } from "vue-router";

import { useMainStore } from "@/stores/main";

import { closeWebSocket } from "@/web-socket";

export default {
    data() {
        return {
            navItems: [
                "career",
                "environment",
                "cheats",
                "mission",
                "driving"
            ]
        };
    },
    computed: {
        isInBootup() {
            return this.mainStore.getIsInBootup;
        },
        isInMainMenu() {
            return this.mainStore.getIsInMainMenu;
        },
        isInGame() {
            return this.mainStore.getIsInGame;
        },
        isPlaying() {
            return this.mainStore.getIsPlaying;
        },
        isAtEndGame() {
            return this.mainStore.getIsAtEndGame;
        }
    },
    created() {
        this.mainStore = useMainStore();

        this.closeWebSocket = closeWebSocket;
    }
}
</script>

<template>
    <nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
        <div class="container-fluid">
            <span class="navbar-brand">Ultimate Trainer 6</span>
            <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbar-supported-content">
                <span class="navbar-toggler-icon" />
            </button>
            <div id="navbar-supported-content" class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li v-for="(navItem, index) in navItems" :key="index" class="nav-item">
                        <RouterLink :to="{ name: navItem }" class="nav-link" :class="{ active: $route.name === navItem }">{{ $t(`main.${navItem}`) }}</RouterLink>
                    </li>
                </ul>
                <span class="me-3">
                    <template v-if="isInBootup">{{ $t("main.bootup") }}</template>
                    <template v-else-if="isInMainMenu">{{ $t("main.main_menu") }}</template>
                    <template v-else-if="isPlaying">{{ $t("main.playing") }}</template>
                    <template v-else-if="isInGame">{{ $t("main.in_game") }}</template>
                    <template v-else-if="isAtEndGame">{{ $t("main.end_game") }}</template>
                </span>
                <a class="btn btn-primary btn-sm me-3" href="https://github.com/pierre-josselin/payday-2-ultimate-trainer-6" target="_blank">
                    <FontAwesomeIcon icon="fa-brands fa-github" />
                </a>
                <button class="btn btn-primary btn-sm" @click="closeWebSocket">
                    <FontAwesomeIcon icon="fa-solid fa-right-from-bracket" />
                </button>
            </div>
        </div>
    </nav>
</template>
