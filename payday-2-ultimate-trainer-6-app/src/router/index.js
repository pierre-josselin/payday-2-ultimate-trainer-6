import { createRouter, createWebHistory } from "vue-router";

import { webSocketConnected } from "@/web-socket";

import ConnectView from "@/views/ConnectView.vue";
import CareerView from "@/views/CareerView.vue";
import EnvironmentView from "@/views/EnvironmentView.vue";
import CheatsView from "@/views/CheatsView.vue";
import MissionView from "@/views/MissionView.vue";

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: "/",
            name: "home",
            redirect: { name: "career" }
        },
        {
            path: "/connect",
            name: "connect",
            component: ConnectView
        },
        {
            path: "/career",
            name: "career",
            component: CareerView
        },
        {
            path: "/environment",
            name: "environment",
            component: EnvironmentView
        },
        {
            path: "/cheats",
            name: "cheats",
            component: CheatsView
        },
        {
            path: "/mission",
            name: "mission",
            component: MissionView
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
