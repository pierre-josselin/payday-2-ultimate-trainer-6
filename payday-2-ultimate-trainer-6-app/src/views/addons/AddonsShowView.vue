<script>
import hljs from "highlight.js";
import CodeEditor from "simple-code-editor";

import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";
import { useSettingsStore } from "@/stores/settings";
import { useAddonsStore } from "@/stores/addons";

import NavBar from "@/components/NavBar.vue";
import GameRestartRequiredIcon from "@/components/icons/GameRestartRequiredIcon.vue";

export default {
    components: {
        NavBar,
        CodeEditor,
        GameRestartRequiredIcon
    },
    data() {
        return {
            code: null,
            codeSaved: true
        };
    },
    watch: {
        code(newCode, oldCode) {
            if (oldCode !== null) {
                this.codeSaved = false;
            }
        }
    },
    created() {
        this.mainStore = useMainStore();
        this.callStore = useCallStore();
        this.settingsStore = useSettingsStore();
        this.addonsStore = useAddonsStore();

        const addonId = this.$route.params.addonId;
        this.addon = this.addonsStore.getAddonById(addonId);
        this.code = this.addon.code ?? "-- Enter your code here";
    },
    beforeRouteLeave() {
        if (!this.codeSaved) {
            if (!window.confirm(this.$t("dialogs.code_not_saved_confirm"))) {
                return false;
            }
        }
    },
    methods: {
        saveCode() {
            this.addon.code = this.code;
            this.codeSaved = true;
        },
        deleteAddon() {
            if (window.confirm(this.$t("dialogs.delete_addon_confirm"))) {
                this.addonsStore.deleteAddon(this.addon);
                this.$router.push({ name: "addons.index" });
            }
        },
        runKeybindAddon(addonId) {
            this.callStore.addCall(["UT:runKeybindAddon", addonId]);
        }
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 1800px;" class="container-fluid my-5">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <span>
                    <FontAwesomeIcon :icon="addon.enable ? 'fa-solid fa-check' : 'fa-solid fa-pause'" class="me-3" :class="{ 'text-success': addon.enable, 'text-warning': !addon.enable }" />
                    <span>{{ addon.name }}</span>
                    <span class="ms-3 fw-bold">{{ $t(`main.${addon.type}`) }}</span>
                </span>
                <span>
                    <button class="btn btn-primary btn-sm" @click="runKeybindAddon(addon.id)" v-if="addon.type == 'keybind'" :disabled="!addon.enable || mainStore.isOffline">
                        <FontAwesomeIcon icon="fa-solid fa-play" />
                    </button>
                    <RouterLink class="btn btn-primary btn-sm ms-3" :to="{ name: 'addons.edit', params: { addonId: addon.id } }">
                        <FontAwesomeIcon icon="fa-solid fa-pen-to-square" />
                    </RouterLink>
                    <button class="btn btn-danger btn-sm ms-3" @click="deleteAddon">
                        <FontAwesomeIcon icon="fa-solid fa-trash-alt" />
                    </button>
                </span>
            </div>
            <div class="card-body p-4">
                <div class="font-monospace mb-3" v-if="addon.type == 'hook'">{{ addon.hookId }}</div>
                <CodeEditor class="w-100 mb-3" :theme="settingsStore.codeEditorTheme" :autofocus="true" :line-nums="true" :tab-spaces="4" :languages="[['lua', 'LUA']]" border-radius="var(--bs-border-radius)" v-model="code"></CodeEditor>
                <button class="btn" :class="{ 'btn-success': codeSaved, 'btn-warning': !codeSaved }" @click="saveCode" :disabled="codeSaved">
                    <FontAwesomeIcon icon="fa-solid fa-floppy-disk" />
                    <span class="ms-2">{{ codeSaved ? $t("main.applied") : $t("main.apply") }}</span>
                    <GameRestartRequiredIcon class="ms-3" v-if="addon.type == 'hook'"></GameRestartRequiredIcon>
                </button>
                <RouterLink class="btn btn-secondary ms-3" :to="{ name: 'addons.index' }">{{ $t("main.exit") }}</RouterLink>
            </div>
        </div>
    </div>
</template>

<style scoped>
.code-editor {
    max-height: 75vh;
    overflow-y: scroll;
}
</style>
