<script>
import { useSettingsStore } from "@/stores/settings";

import NavBar from "@/components/NavBar.vue";

export default {
    components: {
        NavBar
    },
    data() {
        return {
            locale: null,
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

        this.locale = this.settingsStore.getSetting("locale") || this.$i18n.locale;
        this.theme = this.settingsStore.getSetting("theme");
    },
    methods: {
        setLocale() {
            this.$i18n.locale = this.locale;
            this.settingsStore.setSetting("locale", this.locale);
            this.settingsStore.saveSettings();
        },
        setTheme() {
            this.settingsStore.setSetting("theme", this.theme);
            this.settingsStore.saveSettings();
        }
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 600px;" class="container my-5">
        <div class="card">
            <div class="card-header">{{ $t("main.settings") }}</div>
            <div class="card-body p-4">
                <div class="mb-3">
                    <label for="locale" class="form-label">{{ $t("main.language") }}</label>
                    <select id="locale" v-model="locale" class="form-select" @change="setLocale">
                        <option value="en">English</option>
                    </select>
                </div>
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
