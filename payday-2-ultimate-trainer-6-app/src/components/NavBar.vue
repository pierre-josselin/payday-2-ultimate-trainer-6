<script>
import { RouterLink } from "vue-router";

import { useMainStore } from "@/stores/main";

import { closeWebSocket } from "@/web-socket";

import AntiCheatDetectedIcon from "@/components/icons/AntiCheatDetectedIcon.vue";
import BugIcon from "@/components/icons/BugIcon.vue";
import ClientIcon from "@/components/icons/ClientIcon.vue";
import RestartRequiredIcon from "@/components/icons/RestartRequiredIcon.vue";

export default {
    components: {
        AntiCheatDetectedIcon,
        BugIcon,
        ClientIcon,
        RestartRequiredIcon
    },
    data() {
        return {
            navItems: [
                "career",
                "environment",
                "cheats",
                "mission",
                "driving",
                "spawn"
            ]
        };
    },
    created() {
        this.mainStore = useMainStore();

        this.closeWebSocket = closeWebSocket;
    }
}
</script>

<template>
    <div id="help-modal" class="modal fade" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">{{ $t("main.help") }}</h1>
                    <button class="btn-close" data-bs-dismiss="modal" />
                </div>
                <div class="modal-body">
                    <table class="table table-bordered mb-0">
                        <thead>
                            <tr>
                                <th style="width: 60px;" class="bg-transparent">{{ $t("main.icon") }}</th>
                                <th class="bg-transparent">{{ $t("main.name") }}</th>
                                <th class="bg-transparent">{{ $t("main.description") }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="bg-transparent text-center">
                                    <AntiCheatDetectedIcon />
                                </td>
                                <td class="bg-transparent text-nowrap">{{ $t("main.anti_cheat_detected") }}</td>
                                <td class="bg-transparent">{{ $t("dialogs.anti_cheat_detected_icon_description") }}</td>
                            </tr>
                            <tr>
                                <td class="bg-transparent text-center">
                                    <BugIcon />
                                </td>
                                <td class="bg-transparent text-nowrap">{{ $t("main.bug") }}</td>
                                <td class="bg-transparent">{{ $t("dialogs.bug_icon_description") }}</td>
                            </tr>
                            <tr>
                                <td class="bg-transparent text-center">
                                    <RestartRequiredIcon />
                                </td>
                                <td class="bg-transparent text-nowrap">{{ $t("main.restart_required") }}</td>
                                <td class="bg-transparent">{{ $t("dialogs.restart_required_icon_description") }}</td>
                            </tr>
                            <tr>
                                <td class="bg-transparent text-center">
                                    <ClientIcon />
                                </td>
                                <td class="bg-transparent text-nowrap">{{ $t("main.client") }}</td>
                                <td class="bg-transparent">{{ $t("dialogs.client_icon_description") }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">{{ $t("main.close") }}</button>
                </div>
            </div>
        </div>
    </div>

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
                <span>
                    <template v-if="mainStore.isOffline">{{ $t("main.offline") }}</template>
                    <template v-else-if="mainStore.isInBootup">{{ $t("main.bootup") }}</template>
                    <template v-else-if="mainStore.isInMainMenu">{{ $t("main.main_menu") }}</template>
                    <template v-else-if="mainStore.isInHeist">{{ $t("main.in_heist") }}</template>
                    <template v-else-if="mainStore.isInGame">{{ $t("main.in_game") }}</template>
                    <template v-else-if="mainStore.isAtEndGame">{{ $t("main.end_game") }}</template>
                </span>
                <ClientIcon v-if="mainStore.isInGame && !mainStore.isServer" class="ms-2" />
                <button class="btn btn-primary btn-sm mx-3" data-bs-toggle="modal" data-bs-target="#help-modal">
                    <FontAwesomeIcon icon="fa-solid fa-question" />
                </button>
                <a class="btn btn-primary btn-sm me-3" :href="REPOSITORY_URL" target="_blank">
                    <FontAwesomeIcon icon="fa-brands fa-github" />
                </a>
                <RouterLink :to="{ name: 'settings' }" class="btn btn-primary btn-sm me-3" :class="{ active: $route.name === 'settings' }">
                    <FontAwesomeIcon icon="fa-solid fa-gear" />
                </RouterLink>
                <button class="btn btn-primary btn-sm" @click="closeWebSocket">
                    <FontAwesomeIcon icon="fa-solid fa-right-from-bracket" />
                </button>
            </div>
        </div>
    </nav>
</template>
