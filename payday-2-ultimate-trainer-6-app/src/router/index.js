import Popover from "bootstrap/js/dist/popover";
import Tooltip from "bootstrap/js/dist/tooltip";

import { nextTick } from "vue";
import { createRouter, createWebHistory } from "vue-router";

import { webSocketConnected } from "@/web-socket";

import ConnectView from "@/views/ConnectView.vue";
import CareerView from "@/views/CareerView.vue";
import EnvironmentView from "@/views/EnvironmentView.vue";
import CheatsView from "@/views/CheatsView.vue";
import MissionView from "@/views/MissionView.vue";
import DrivingView from "@/views/DrivingView.vue";
import SpawnView from "@/views/SpawnView.vue";
import GameView from "@/views/GameView.vue";
import KeybindsView from "@/views/KeybindsView.vue";
import SettingsView from "@/views/SettingsView.vue";

import AddonsIndexView from "@/views/addons/AddonsIndexView.vue";
import AddonsCreateView from "@/views/addons/AddonsCreateView.vue";
import AddonsShowView from "@/views/addons/AddonsShowView.vue";
import AddonsEditView from "@/views/addons/AddonsEditView.vue";

const router = createRouter({
    linkActiveClass: "active",
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
        },
        {
            path: "/spawn",
            name: "spawn",
            component: SpawnView
        },
        {
            path: "/game",
            name: "game",
            component: GameView
        },
        {
            path: "/keybinds",
            name: "keybinds",
            component: KeybindsView
        },
        {
            path: "/addons",
            name: "addons.index",
            component: AddonsIndexView
        },
        {
            path: "/addons/create",
            name: "addons.create",
            component: AddonsCreateView
        },
        {
            path: "/addons/:addonId",
            name: "addons.show",
            component: AddonsShowView
        },
        {
            path: "/addons/:addonId/edit",
            name: "addons.edit",
            component: AddonsEditView
        }
    ]
});

router.beforeEach((to, from, next) => {
    if (!webSocketConnected() && to.name !== "connect") {
        router.push({ name: "connect" });
        return;
    }

    next();
});

router.afterEach(() => {
    nextTick(() => {
        document.querySelectorAll('[data-bs-toggle="tooltip"]').forEach(element => new Tooltip(element));
        document.querySelectorAll('.popover-focus').forEach(element => new Popover(element, { trigger: "focus" }));
        document.querySelectorAll('.popover-hover').forEach(element => new Popover(element, { trigger: "hover" }));
    });
});

export default router;
