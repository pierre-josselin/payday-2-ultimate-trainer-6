<script>
import "bootstrap";

import Modal from "bootstrap/js/dist/modal";
import Toast from "bootstrap/js/dist/toast";
import VueMarkdown from "vue-markdown-render";

import { useMainStore } from "@/stores/main";
import { useSettingsStore } from "@/stores/settings";

import changeLogPath from "../../changelog.md";
import creditsPath from "../../credits.md";

export default {
    components: {
        VueMarkdown
    },
    data() {
        return {
            repositoryNewTag: null,
            sentToastInstance: null,
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

        this.$watch("theme", () => {
            const element = document.getElementById("bootswatch");
            element.href = `/node_modules/bootswatch/dist/${this.theme}/bootstrap.min.css`;
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
        const sentToastElement = document.getElementById("sent-toast");
        this.sentToastInstance = Toast.getOrCreateInstance(sentToastElement);

        this.checkForUpdates();
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
                    <button class="btn-close" data-bs-dismiss="modal"></button>
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
