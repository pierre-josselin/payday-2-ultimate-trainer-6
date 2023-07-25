<script>
import "bootstrap";

import GithubButton from "vue-github-button";
import Modal from "bootstrap/js/dist/modal";
import Toast from "bootstrap/js/dist/toast";
import VueMarkdown from "vue-markdown-render";

import { useMainStore } from "@/stores/main";
import { useSettingsStore } from "@/stores/settings";

import changeLogPath from "../../CHANGELOG.md";
import creditsPath from "../../credits.md";

import cerulean from "bootswatch/dist/cerulean/bootstrap.min.css?raw";
import cosmo from "bootswatch/dist/cosmo/bootstrap.min.css?raw";
import cyborg from "bootswatch/dist/cyborg/bootstrap.min.css?raw";
import darkly from "bootswatch/dist/darkly/bootstrap.min.css?raw";
import flatly from "bootswatch/dist/flatly/bootstrap.min.css?raw";
import journal from "bootswatch/dist/journal/bootstrap.min.css?raw";
import litera from "bootswatch/dist/litera/bootstrap.min.css?raw";
import lumen from "bootswatch/dist/lumen/bootstrap.min.css?raw";
import lux from "bootswatch/dist/lux/bootstrap.min.css?raw";
import materia from "bootswatch/dist/materia/bootstrap.min.css?raw";
import minty from "bootswatch/dist/minty/bootstrap.min.css?raw";
import morph from "bootswatch/dist/morph/bootstrap.min.css?raw";
import pulse from "bootswatch/dist/pulse/bootstrap.min.css?raw";
import quartz from "bootswatch/dist/quartz/bootstrap.min.css?raw";
import sandstone from "bootswatch/dist/sandstone/bootstrap.min.css?raw";
import simplex from "bootswatch/dist/simplex/bootstrap.min.css?raw";
import sketchy from "bootswatch/dist/sketchy/bootstrap.min.css?raw";
import slate from "bootswatch/dist/slate/bootstrap.min.css?raw";
import solar from "bootswatch/dist/solar/bootstrap.min.css?raw";
import spacelab from "bootswatch/dist/spacelab/bootstrap.min.css?raw";
import superhero from "bootswatch/dist/superhero/bootstrap.min.css?raw";
import united from "bootswatch/dist/united/bootstrap.min.css?raw";
import vapor from "bootswatch/dist/vapor/bootstrap.min.css?raw";
import yeti from "bootswatch/dist/yeti/bootstrap.min.css?raw";
import zephyr from "bootswatch/dist/zephyr/bootstrap.min.css?raw";

const themes = {
    cerulean,
    cosmo,
    cyborg,
    darkly,
    flatly,
    journal,
    litera,
    lumen,
    lux,
    materia,
    minty,
    morph,
    pulse,
    quartz,
    sandstone,
    simplex,
    sketchy,
    slate,
    solar,
    spacelab,
    superhero,
    united,
    vapor,
    yeti,
    zephyr,
};

export default {
    components: {
        GithubButton,
        VueMarkdown
    },
    data() {
        return {
            repositoryNewTag: null,
            sentToastInstance: null,
            bootswatchElement: null,
            firstCallAcknowledgmentIgnored: false,
            changeLog: null,
            credits: null
        };
    },
    computed: {
        theme() {
            return this.settingsStore.getSetting("theme") || "darkly";
        }
    },
    created() {
        this.mainStore = useMainStore();
        this.settingsStore = useSettingsStore();

        this.$watch("theme", (theme) => {
            this.bootswatchElement.innerHTML = themes[theme];
        });

        this.$watch("mainStore.lastCallAcknowledgmentTime", (lastCallAcknowledgmentTime) => {
            if (lastCallAcknowledgmentTime !== null) {
                if (!this.firstCallAcknowledgmentIgnored) {
                    this.firstCallAcknowledgmentIgnored = true;
                    return;
                }
                this.sentToastInstance.show()
            }
        });

        this.fetchChangeLog();
        this.fetchCredits();
    },
    mounted() {
        this.bootswatchElement = document.createElement("style");
        this.bootswatchElement.innerHTML = themes[this.theme];
        document.head.appendChild(this.bootswatchElement);

        const sentToastElement = document.getElementById("sent-toast");
        this.sentToastInstance = Toast.getOrCreateInstance(sentToastElement);

        this.checkForUpdates();
    },
    beforeUnmount() {
        this.bootswatchElement.remove();
    },
    methods: {
        async checkForUpdates() {
            let tags;
            try {
                const response = await fetch(this.GITHUB_API_REPOSITORY_TAGS_URL);
                if (!response.ok) return;
                tags = await response.json();
            } catch (error) {
                return;
            }

            if (tags && Array.isArray(tags) && tags.length) {
                const tag = tags[0];

                if (tag !== null && typeof tag === "object" && tag.name !== this.REPOSITORY_CURRENT_TAG) {
                    this.repositoryNewTag = tag.name;

                    const updateAvailableModalElement = document.getElementById("update-available-modal");
                    const updateAvailableModalInstance = new Modal(updateAvailableModalElement);
                    updateAvailableModalInstance.show();
                }
            }
        },
        async fetchChangeLog() {
            const response = await fetch(changeLogPath);
            this.changeLog = await response.text();
        },
        async fetchCredits() {
            const response = await fetch(creditsPath);
            this.credits = await response.text();
        }
    }
}
</script>

<template>
    <div id="about-modal" class="modal fade" tabindex="-1">
        <div class="modal-dialog modal-dialog-scrollable modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">{{ $t("main.about") }}</h1>
                    <button class="btn-close" data-bs-dismiss="modal" />
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#summary-tab">{{ $t("main.summary") }}</button>
                        </li>
                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#change-log-tab">{{ $t("main.change_log") }}</button>
                        </li>
                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#credits-tab">{{ $t("main.credits") }}</button>
                        </li>
                    </ul>
                    <div class="tab-content pt-4">
                        <div id="summary-tab" class="tab-pane show active" tabindex="0">
                            <h1 class="fs-4">Ultimate Trainer</h1>
                            <small>{{ REPOSITORY_CURRENT_TAG }}</small>
                            <div class="mt-4">Copyright (C) 2023 Pierre Josselin</div>
                        </div>
                        <div id="change-log-tab" class="tab-pane" tabindex="0">
                            <VueMarkdown :source="changeLog || ''" class="markdown" />
                        </div>
                        <div id="credits-tab" class="tab-pane" tabindex="0">
                            <VueMarkdown :source="credits || ''" class="markdown" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">{{ $t("main.close") }}</button>
                </div>
            </div>
        </div>
    </div>

    <div id="update-available-modal" class="modal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        <FontAwesomeIcon icon="fa-solid fa-circle-info" class="text-info me-2" />
                        <span>{{ $t("main.update_available") }}</span>
                    </h5>
                    <button class="btn-close" data-bs-dismiss="modal" />
                </div>
                <div class="modal-body">
                    <div class="mb-3"><s class="me-3">{{ REPOSITORY_CURRENT_TAG }}</s><b>{{ repositoryNewTag }}</b></div>
                    <p>{{ $t("dialogs.update_available") }}</p>
                    <a :href="REPOSITORY_URL" target="_blank">{{ $t("main.download") }}</a>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">{{ $t("main.close") }}</button>
                </div>
            </div>
        </div>
    </div>

    <div id="support-us-modal" class="modal fade" tabindex="-1">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">{{ $t("main.support_us") }}</h1>
                    <button class="btn-close" data-bs-dismiss="modal" />
                </div>
                <div class="modal-body">
                    <p class="mb-4" v-html="$t('dialogs.support_us')" />
                    <GithubButton class="mb-4" href="https://github.com/pierre-josselin/payday-2-ultimate-trainer-6" data-icon="octicon-star" data-size="large" data-show-count="true">{{ $t("main.support_us") }}</GithubButton>
                    <div class="fs-1 text-uppercase">
                        {{ $t("main.thank_you") }}
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
                        <a class="btn btn-link me-2" href="https://github.com/pierre-josselin/payday-2-ultimate-trainer-6/issues/new" target="_blank">GitHub ({{ $t("main.faster_answer").toLowerCase() }})</a>
                        <a class="btn btn-link" href="https://www.unknowncheats.me/forum/payday-2-a/588542-payday-2-ultimate-trainer-6-a.html" target="_blank">UnknownCheats</a>
                    </div>
                    <p class="fs-5">
                        {{ $t("main.game_crash_log") }}
                        <button class="btn btn-link btn-sm ms-2" @click="mainStore.requestGameCrashLog">
                            <FontAwesomeIcon icon="fa-solid fa-arrows-rotate" />
                        </button>
                    </p>
                    <div v-if="mainStore.gameCrashLog === false" class="alert alert-danger mb-0">{{ $t("dialogs.game_crash_log_recovery_failed") }}</div>
                    <div v-else-if="!mainStore.gameCrashLog" class="d-flex justify-content-center my-4">
                        <div class="spinner-border" />
                    </div>
                    <textarea v-else v-model="mainStore.gameCrashLog" class="form-control" rows="20" readonly />
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">{{ $t("main.close") }}</button>
                </div>
            </div>
        </div>
    </div>

    <div class="toast-container position-fixed bottom-0 start-0 p-3">
        <div id="sent-toast" class="toast bg-success" data-bs-delay="1500">
            <div class="toast-body">
                <FontAwesomeIcon icon="fa-solid fa-circle-check" />
                <span class="ms-2">{{ $t("main.sent") }}</span>
            </div>
        </div>
    </div>

    <RouterView />
</template>

<style>
* {
    outline: none;
}

.tooltip-inner {
    color: white !important;
}

.toast {
    --bs-toast-max-width: unset;
}

.popover {
    --bs-popover-max-width: 300px;
}

.disabled {
    pointer-events: none;
}

.markdown h1 {
    font-size: 2rem;
}

.markdown h2 {
    font-size: 1.5rem;
}

.markdown h3 {
    font-size: 1.25rem;
}

.markdown h4 {
    font-size: 1rem;
}

.markdown h5 {
    font-size: 0.75rem;
}

.markdown h6 {
    font-size: 0.5rem;
}
</style>
