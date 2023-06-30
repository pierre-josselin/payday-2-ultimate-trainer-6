<script>
import { createWebSocket } from "@/web-socket";

export default {
    data() {
        return {
            connecting: false,
            host: "127.0.0.1",
            port: 1138
        };
    },
    created() {
        this.host = window.location.hostname;
    },
    mounted() {
        document.documentElement.style.height = "100%";
        document.body.style.height = "100%";
        document.getElementById("app").style.height = "100%";
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
                    alert(this.$t("main.connection_failed"));
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
