<script>
import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";
import { useAddonsStore } from "@/stores/addons";

import NavBar from "@/components/NavBar.vue";

const TYPE_ORDER = {
    "keybind": 1,
    "hook": 2,
    "persist": 3,
};

export default {
    components: {
        NavBar
    },
    computed: {
        sortedAddons() {
            return this.addonsStore.addons.sort((a, b) => {
                if (a.type != b.type) {
                    return TYPE_ORDER[a.type] - TYPE_ORDER[b.type];
                }
                return a.name.localeCompare(b.name);
            });
        }
    },
    created() {
        this.mainStore = useMainStore();
        this.callStore = useCallStore();
        this.addonsStore = useAddonsStore();
    },
    methods: {
        runKeybindAddon(addonId) {
            this.callStore.addCall(["UT:runKeybindAddon", addonId]);
        },
        toggleEnableAddon(addonId) {
            const addon = this.addonsStore.getAddonById(addonId);
            addon.enable = !addon.enable;
        }
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 800px;" class="container my-5">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <span>{{ $t("main.addons") }}<span v-if="addonsStore.addons.length" class="ms-2">({{ addonsStore.addons.length }})</span></span>
                <RouterLink class="btn btn-primary btn-sm" :to="{ name: 'addons.create' }">
                    <FontAwesomeIcon icon="fa-solid fa-plus" />
                </RouterLink>
            </div>
            <div class="card-body p-4">
                <div v-if="!addonsStore.addons.length" class="alert alert-info mb-0">{{ $t("dialogs.no_addons") }}</div>
                <div v-else class="table-responsive">
                    <table class="table align-middle mb-0">
                        <thead>
                            <tr>
                                <th class="bg-transparent">{{ $t("main.name") }}</th>
                                <th class="bg-transparent">{{ $t("main.type") }}</th>
                                <th class="bg-transparent"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="addon in sortedAddons" :key="addon.id">
                                <td class="bg-transparent">
                                    <RouterLink :to="{ name: 'addons.show', params: { addonId: addon.id } }">{{ addon.name }}</RouterLink>
                                </td>
                                <td class="bg-transparent">{{ $t(`main.${addon.type}`) }}</td>
                                <td class="bg-transparent text-end">
                                    <button class="btn btn-primary btn-sm" @click="runKeybindAddon(addon.id)" v-if="addon.type == 'keybind'" :disabled="!addon.enable || mainStore.isOffline">
                                        <FontAwesomeIcon icon="fa-solid fa-play" />
                                    </button>
                                    <button style="width: 32px;" class="btn btn-primary btn-sm text-center ms-3" :class="{ 'btn-success': addon.enable, 'btn-warning': !addon.enable }" @click="toggleEnableAddon(addon.id)">
                                        <FontAwesomeIcon :icon="addon.enable ? 'fa-solid fa-check' : 'fa-solid fa-pause'" />
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>
