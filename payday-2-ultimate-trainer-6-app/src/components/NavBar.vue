<script>
import { RouterLink } from "vue-router";

import { closeWebSocket } from "@/web-socket";

export default {
    created() {
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
                    <li class="nav-item">
                        <RouterLink :to="{ name: 'player' }" class="nav-link" :class="{ active: $route.name === 'player' }">{{ $t("main.player") }}</RouterLink>
                    </li>
                </ul>
                <button class="btn btn-primary btn-sm" @click="closeWebSocket">
                    <FontAwesomeIcon icon="fa-solid fa-right-from-bracket" />
                </button>
            </div>
        </div>
    </nav>
</template>
