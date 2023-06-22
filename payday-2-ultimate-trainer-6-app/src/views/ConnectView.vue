<script>
import Swal from "sweetalert2";

import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";
import { useSettingsStore } from "@/stores/settings";

import { createWebSocket } from "@/web-socket";

export default {
    data() {
        return {
            connecting: false,
            host: "localhost",
            port: 1138
        };
    },
    created() {
        this.callStore = useCallStore();
        this.mainStore = useMainStore();
        this.settingsStore = useSettingsStore();
    },
    methods: {
        connect() {
            this.connecting = true;

            createWebSocket({
                host: this.host,
                port: this.port,
                router: this.$router,
                mainStore: this.mainStore,
                callStore: this.callStore,
                settingsStore: this.settingsStore,
                connectionErrorCallback: () => {
                    this.connecting = false;
                    Swal.fire({
                        icon: "error",
                        title: this.$t("main.connection_failed")
                    });
                }
            });
        }
    }
}
</script>

<template>
    <div class="d-flex align-items-center justify-content-center h-100">
        <div style="min-width: 450px;" class="card">
            <div class="card-header">PAYDAY 2 - Ultimate Trainer 6</div>
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
                    <button type="submit" class="btn btn-primary w-100" :disabled="connecting">
                        <span v-if="connecting" class="spinner-border spinner-border-sm" />
                        <template v-else>{{ $t("main.connect") }}</template>
                    </button>
                </form>
            </div>
        </div>
    </div>
</template>

<style>
html,
body,
#app {
    height: 100%;
}
</style>
