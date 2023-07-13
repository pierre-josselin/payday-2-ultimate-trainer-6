<script>
import Modal from "bootstrap/js/dist/modal";
import VueMarkdown from "vue-markdown-render";

import { createWebSocket } from "@/web-socket";

import enTermsOfUsePath from "@/assets/terms-of-use/en.txt";
import creditsPath from "@/assets/credits.txt";

export default {
    components: {
        VueMarkdown
    },
    data() {
        return {
            connecting: false,
            connectionFailedModalInstance: null,
            host: "127.0.0.1",
            port: 1138,
            termsOfUse: "",
            termsOfUsePaths: {
                en: enTermsOfUsePath
            },
            credits: ""
        };
    },
    created() {
        this.host = window.location.hostname;
        this.fetchTermsOfUse();
        this.fetchCredits();
    },
    mounted() {
        document.documentElement.style.height = "100%";
        document.body.style.height = "100%";
        document.getElementById("app").style.height = "100%";

        const connectionFailedModalElement = document.getElementById("connection-failed-modal");
        this.connectionFailedModalInstance = new Modal(connectionFailedModalElement)
    },
    beforeUnmount() {
        document.documentElement.style.height = null;
        document.body.style.height = null;
        document.getElementById("app").style.height = null;
    },
    methods: {
        connect() {
            this.connecting = true;

            createWebSocket({
                host: this.host,
                port: this.port,
                router: this.$router,
                connectionErrorCallback: () => {
                    this.connecting = false;
                    this.connectionFailedModalInstance.show();
                }
            });
        },
        async fetchTermsOfUse() {
            const url = this.termsOfUsePaths[this.$i18n.locale];
            if (!url) return;
            const response = await fetch(url);
            this.termsOfUse = await response.text();
        },
        async fetchCredits() {
            const response = await fetch(creditsPath);
            this.credits = await response.text();
        }
    }
}
</script>

<template>
    <div id="connection-failed-modal" class="modal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        <FontAwesomeIcon icon="fa-solid fa-circle-xmark" class="text-danger me-2" />
                        <span>{{ $t("main.connection_failed") }}</span>
                    </h5>
                    <button class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">{{ $t("dialogs.connection_failed") }}</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">{{ $t("main.close") }}</button>
                </div>
            </div>
        </div>
    </div>

    <div id="terms-of-use-modal" class="modal fade" tabindex="-1">
        <div style="max-width: 600px;" class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">{{ $t("main.terms_of_use") }}</h1>
                    <button class="btn-close" data-bs-dismiss="modal" />
                </div>
                <div class="modal-body">
                    <VueMarkdown :source="termsOfUse" />
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">{{ $t("main.close") }}</button>
                </div>
            </div>
        </div>
    </div>

    <div id="credits-modal" class="modal fade" tabindex="-1">
        <div style="max-width: 600px;" class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">{{ $t("main.credits") }}</h1>
                    <button class="btn-close" data-bs-dismiss="modal" />
                </div>
                <div class="modal-body">
                    <VueMarkdown :source="credits" />
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">{{ $t("main.close") }}</button>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex align-items-center justify-content-center h-100">
        <div style="min-width: 450px;" class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <span>PAYDAY 2 - Ultimate Trainer 6</span>
                <a href="#" data-bs-toggle="modal" data-bs-target="#credits-modal">{{ $t("main.credits") }}</a>
            </div>
            <div class="card-body">
                <h5 class="card-title">{{ $t("main.server_connection") }}</h5>
                <form @submit.prevent="connect">
                    <div class="mb-3">
                        <label for="host" class="form-label">{{ $t("main.host") }}</label>
                        <input id="host" v-model="host" type="text" maxlength="255" class="form-control" :disabled="connecting" required>
                    </div>
                    <div class="mb-3">
                        <label for="port" class="form-label">{{ $t("main.port") }}</label>
                        <input id="port" v-model="port" type="number" min="0" max="65535" step="1" class="form-control" :disabled="connecting" required>
                    </div>
                    <div class="mb-3">
                        <div class="form-check">
                            <input id="terms-of-use" class="form-check-input" type="checkbox" checked required>
                            <label for="terms-of-use" class="form-check-label">{{ $t("main.i_accept_the") }} <a href="#" data-bs-toggle="modal" data-bs-target="#terms-of-use-modal">{{ $t("main.terms_of_use").toLowerCase() }}</a></label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary w-100" :disabled="connecting">
                        <span v-if="connecting" class="spinner-border spinner-border-sm" />
                        <template v-else>{{ $t("main.connect") }}</template>
                    </button>
                </form>
            </div>
        </div>
    </div>
</template>
