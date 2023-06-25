import { createRouter, createWebHistory } from "vue-router";

import { webSocketConnected } from "@/web-socket";

import ConnectView from "@/views/ConnectView.vue";
import CareerView from "@/views/CareerView.vue";
import EnvironmentView from "@/views/EnvironmentView.vue";
import CheatsView from "@/views/CheatsView.vue";
import MissionView from "@/views/MissionView.vue";
import DrivingView from "@/views/DrivingView.vue";
import SettingsView from "@/views/SettingsView.vue";

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
            path: "/settings",
            name: "settings",
            component: SettingsView
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
        },
        {
            path: "/driving",
            name: "driving",
            component: DrivingView
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
