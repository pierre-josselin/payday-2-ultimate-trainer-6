<script>
import { useSettingsStore } from "@/stores/settings";

import NavBar from "@/components/NavBar.vue";

export default {
    components: {
        NavBar
    },
    data() {
        return {
            theme: null,
            themes: [
                "darkly",
                "cyborg",
                "slate",
                "solar",
                "superhero",
                "vapor",
                "cerulean",
                "cosmo",
                "flatly",
                "journal",
                "litera",
                "lumen",
                "lux",
                "materia",
                "minty",
                "morph",
                "pulse",
                "quartz",
                "sandstone",
                "simplex",
                "sketchy",
                "spacelab",
                "united",
                "yeti",
                "zephyr"
            ]
        };
    },
    created() {
        this.settingsStore = useSettingsStore();

        this.theme = this.settingsStore.getSetting("theme");
    },
    methods: {
        setTheme() {
            this.settingsStore.setSetting("theme", this.theme);
            this.settingsStore.saveSettings();
        }
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 800px;" class="container my-5">
        <div class="card">
            <div class="card-header">{{ $t("main.settings") }}</div>
            <div class="card-body p-4">
                <div>
                    <label for="theme" class="form-label">{{ $t("main.app_theme") }}</label>
                    <select id="theme" v-model="theme" class="form-select" @change="setTheme">
                        <option v-for="theme in themes" :key="theme" :value="theme">{{ theme.capitalize() }}</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
</template>
