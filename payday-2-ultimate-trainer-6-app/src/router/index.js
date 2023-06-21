import { createRouter, createWebHistory } from "vue-router";

import { webSocketConnected } from "@/web-socket";

import ConnectView from "@/views/ConnectView.vue";
import PlayerView from "@/views/PlayerView.vue";
import EnvironmentView from "@/views/EnvironmentView.vue";

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: "/",
            name: "home",
            redirect: { name: "player" }
        },
        {
            path: "/connect",
            name: "connect",
            component: ConnectView
        },
        {
            path: "/player",
            name: "player",
            component: PlayerView
        },
        {
            path: "/environment",
            name: "environment",
            component: EnvironmentView
        }
    ]
});

router.beforeEach((to, from, next) => {
    if (!webSocketConnected() && to.name !== "connect") {
        router.push({ name: "connect" });
        return;
    }

    next();
})

export default router;
