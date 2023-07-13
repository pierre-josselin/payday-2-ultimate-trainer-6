<script>
import "bootstrap";

import Modal from "bootstrap/js/dist/modal";

import { useSettingsStore } from "@/stores/settings";

import SentToast from "@/components/SentToast.vue";

export default {
    components: {
        SentToast
    },
    data() {
        return {
            repositoryNewTag: null
        };
    },
    computed: {
        theme() {
            return this.settingsStore.getSetting("theme") || "darkly";
        }
    },
    created() {
        this.settingsStore = useSettingsStore();

        this.$watch("theme", () => {
            const element = document.getElementById("bootswatch");
            element.href = `/node_modules/bootswatch/dist/${this.theme}/bootstrap.min.css`;
        });
    },
    mounted() {
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
        }
    }
}
</script>

<template>
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

    <RouterView />
    <SentToast />
</template>

<style>
* {
    outline: none;
}

.tooltip-inner {
    color: white !important;
}
</style>
