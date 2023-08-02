<script>
import { RouterLink } from "vue-router";

import { useMainStore } from "@/stores/main";

import { closeWebSocket } from "@/web-socket";

import ClientIcon from "@/components/icons/ClientIcon.vue";

export default {
    components: {
        ClientIcon
    },
    created() {
        this.mainStore = useMainStore();

        this.closeWebSocket = closeWebSocket;
    }
}
</script>

<template>
    <nav class="navbar navbar-expand-xl bg-primary" data-bs-theme="dark">
        <div class="container-fluid">
            <span class="navbar-brand">Ultimate Trainer 6</span>
            <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbar-supported-content">
                <span class="navbar-toggler-icon" />
            </button>
            <div id="navbar-supported-content" class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <RouterLink :to="{ name: 'career' }" class="nav-link">{{ $t("main.career") }}</RouterLink>
                    </li>
                    <li class="nav-item">
                        <RouterLink :to="{ name: 'environment' }" class="nav-link">{{ $t("main.environment") }}</RouterLink>
                    </li>
                    <li class="nav-item">
                        <RouterLink :to="{ name: 'cheats' }" class="nav-link">{{ $t("main.cheats") }}</RouterLink>
                    </li>
                    <li class="nav-item">
                        <RouterLink :to="{ name: 'mission' }" class="nav-link">{{ $t("main.mission") }}</RouterLink>
                    </li>
                    <li class="nav-item">
                        <RouterLink :to="{ name: 'driving' }" class="nav-link">{{ $t("main.driving") }}</RouterLink>
                    </li>
                    <li class="nav-item">
                        <RouterLink :to="{ name: 'spawn' }" class="nav-link">{{ $t("main.spawn") }}</RouterLink>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link popover-focus" role="button" data-bs-toggle="popover" :data-bs-title="$t('main.help')" :data-bs-content="$t('dialogs.build_help')">{{ $t("main.build") }}</button>
                    </li>
                    <li class="nav-item">
                        <RouterLink :to="{ name: 'game' }" class="nav-link">{{ $t("main.game") }}</RouterLink>
                    </li>
                </ul>
                <span class="text-light">
                    <template v-if="mainStore.isOffline">{{ $t("main.offline") }}</template>
                    <template v-else-if="mainStore.isInBootup">{{ $t("main.bootup") }}</template>
                    <template v-else-if="mainStore.isInMainMenu">{{ $t("main.main_menu") }}</template>
                    <template v-else-if="mainStore.isInHeist">{{ $t("main.in_heist") }}</template>
                    <template v-else-if="mainStore.isInGame">{{ $t("main.in_game") }}</template>
                    <template v-else-if="mainStore.isAtEndGame">{{ $t("main.end_game") }}</template>
                </span>
                <ClientIcon v-if="mainStore.isInGame && !mainStore.isServer" class="ms-2" />
                <button class="btn btn-primary btn-sm ms-3" data-bs-toggle="modal" data-bs-target="#support-us-modal">
                    <FontAwesomeIcon class="text-danger" icon="fa-solid fa-heart" />
                </button>
                <a class="btn btn-primary btn-sm ms-3" :href="REPOSITORY_URL" target="_blank">
                    <FontAwesomeIcon icon="fa-brands fa-github" />
                </a>
                <button class="btn btn-primary btn-sm ms-3" data-bs-toggle="modal" data-bs-target="#report-a-bug-modal" @click="mainStore.requestGameCrashLog">
                    <FontAwesomeIcon icon="fa-solid fa-bug" />
                </button>
                <RouterLink :to="{ name: 'settings' }" class="btn btn-primary btn-sm ms-3">
                    <FontAwesomeIcon icon="fa-solid fa-gear" />
                </RouterLink>
                <button class="btn btn-primary btn-sm ms-3" @click="closeWebSocket">
                    <FontAwesomeIcon icon="fa-solid fa-right-from-bracket" />
                </button>
            </div>
        </div>
    </nav>
</template>
