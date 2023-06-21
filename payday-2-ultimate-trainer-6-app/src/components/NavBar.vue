<script>
import { RouterLink } from "vue-router";

import { closeWebSocket } from "@/web-socket";

export default {
    data() {
        return {
            navItems: [
                "player"
            ]
        };
    },
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
                    <li v-for="(navItem, index) in navItems" :key="index" class="nav-item">
                        <RouterLink :to="{ name: navItem }" class="nav-link" :class="{ active: $route.name === navItem }">{{ $t(`main.${navItem}`) }}</RouterLink>
                    </li>
                </ul>
                <button class="btn btn-primary btn-sm" @click="closeWebSocket">
                    <FontAwesomeIcon icon="fa-solid fa-right-from-bracket" />
                </button>
            </div>
        </div>
    </nav>
</template>
