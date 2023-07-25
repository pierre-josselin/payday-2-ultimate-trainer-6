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
            <div class="card-header d-flex justify-content-between align-items-center">
                <span>{{ $t("main.settings") }}</span>
                <a href="#" data-bs-toggle="modal" data-bs-target="#about-modal">{{ $t("main.about") }}</a>
            </div>
            <div class="card-body p-4">
                <div class="mb-3">
                    <label for="locale" class="form-label">{{ $t("main.language") }}</label>
                    <select id="locale" v-model="locale" class="form-select" @change="setLocale">
                        <option value="en">English</option>
                        <option value="de">Deutsch</option>
                        <option value="es">Español</option>
                        <option value="fr">Français</option>
                        <option value="ro">Română</option>
                        <option value="ru">Русский</option>
                        <option value="uk">Українська</option>
                        <option value="zh">中文</option>
                    </select>
                </div>
                <div>
                    <label for="theme" class="form-label">{{ $t("main.app_theme") }}</label>
                    <select id="theme" v-model="theme" class="form-select" @change="setTheme">
                        <option v-for="_theme in themes" :key="_theme" :value="_theme">{{ _theme.capitalize() }}</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
</template>
