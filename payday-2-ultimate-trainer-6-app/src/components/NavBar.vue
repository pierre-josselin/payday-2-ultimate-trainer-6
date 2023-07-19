<script>
import GithubButton from "vue-github-button";

import { RouterLink } from "vue-router";

import { useMainStore } from "@/stores/main";

import { closeWebSocket } from "@/web-socket";

import AntiCheatDetectedIcon from "@/components/icons/AntiCheatDetectedIcon.vue";
import BugIcon from "@/components/icons/BugIcon.vue";
import ClientIcon from "@/components/icons/ClientIcon.vue";
import GameRestartRequiredIcon from "@/components/icons/GameRestartRequiredIcon.vue";

export default {
    components: {
        AntiCheatDetectedIcon,
        BugIcon,
        ClientIcon,
        GameRestartRequiredIcon,
        GithubButton
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
    <div id="support-us-modal" class="modal fade" tabindex="-1">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">{{ $t("main.support_us") }}</h1>
                    <button class="btn-close" data-bs-dismiss="modal" />
                </div>
                <div class="modal-body">
                    <p class="mb-4" v-html="$t('dialogs.support_us')"></p>
                    <GithubButton class="mb-4" href="https://github.com/pierre-josselin/payday-2-ultimate-trainer-6" data-icon="octicon-star" data-size="large" data-show-count="true">{{ $t("main.support_us") }}</GithubButton>
                    <div class="fs-1 text-uppercase">{{ $t("main.thank_you") }}
                        <FontAwesomeIcon class="text-danger ms-3" icon="fa-solid fa-heart" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">{{ $t("main.close") }}</button>
                </div>
            </div>
        </div>
    </div>

    <div id="report-a-bug-modal" class="modal fade" tabindex="-1">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">{{ $t("main.report_a_bug") }}</h1>
                    <button class="btn-close" data-bs-dismiss="modal" />
                </div>
                <div class="modal-body">
                    <p>{{ $t("dialogs.report_a_bug") }}</p>
                    <div class="mb-3">
                        <a class="btn btn-link me-2" href="https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues" target="_blank">GitHub ({{ $t("main.faster_answer").toLowerCase() }})</a>
                        <a class="btn btn-link" href="https://www.unknowncheats.me/forum/payday-2-a/588542-payday-2-ultimate-trainer-6-a.html" target="_blank">UnknownCheats</a>
                    </div>
                    <p class="fs-5">{{ $t("main.game_crash_log") }}
                        <button class="btn btn-link btn-sm ms-2" @click="mainStore.requestGameCrashLog">
                            <FontAwesomeIcon icon="fa-solid fa-arrows-rotate" />
                        </button>
                    </p>
                    <div class="alert alert-danger mb-0" v-if="mainStore.gameCrashLog === false">{{ $t("dialogs.game_crash_log_recovery_failed") }}</div>
                    <div class="d-flex justify-content-center my-4" v-else-if="!mainStore.gameCrashLog">
                        <div class="spinner-border"></div>
                    </div>
                    <textarea class="form-control" rows="20" readonly v-else>{{ mainStore.gameCrashLog }}</textarea>
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
                    <li v-for="( navItem, index ) in  navItems " :key="index" class="nav-item">
                        <RouterLink :to="{ name: navItem }" class="nav-link" :class="{ active: $route.name === navItem }">{{ $t(`main.${navItem}`) }}</RouterLink>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link popover-focus" role="button" data-bs-toggle="popover" :data-bs-title="$t('main.help')" :data-bs-content="$t('dialogs.editor_help')">{{ $t("main.editor") }}</button>
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
                <button class="btn btn-primary btn-sm ms-3" data-bs-toggle="modal" data-bs-target="#support-us-modal">
                    <FontAwesomeIcon class="text-danger" icon="fa-solid fa-heart" />
                </button>
                <a class="btn btn-primary btn-sm ms-3" :href="REPOSITORY_URL" target="_blank">
                    <FontAwesomeIcon icon="fa-brands fa-github" />
                </a>
                <button class="btn btn-primary btn-sm ms-3" data-bs-toggle="modal" data-bs-target="#report-a-bug-modal" @click="mainStore.requestGameCrashLog">
                    <FontAwesomeIcon icon="fa-solid fa-bug" />
                </button>
                <RouterLink :to="{ name: 'settings' }" class="btn btn-primary btn-sm ms-3" :class="{ active: $route.name === 'settings' }">
                    <FontAwesomeIcon icon="fa-solid fa-gear" />
                </RouterLink>
                <button class="btn btn-primary btn-sm ms-3" @click="closeWebSocket">
                    <FontAwesomeIcon icon="fa-solid fa-right-from-bracket" />
                </button>
            </div>
        </div>
    </nav>
</template>
