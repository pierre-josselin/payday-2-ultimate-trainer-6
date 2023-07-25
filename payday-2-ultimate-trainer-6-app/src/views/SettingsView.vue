<script>
import { useSettingsStore } from "@/stores/settings";

import NavBar from "@/components/NavBar.vue";
import GameRestartRequiredIcon from "@/components/icons/GameRestartRequiredIcon.vue";

export default {
    components: {
        NavBar,
        GameRestartRequiredIcon
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
            ],
            enableHideUltimateTrainerButton: false
        };
    },
    created() {
        this.settingsStore = useSettingsStore();

        this.locale = this.settingsStore.getSetting("locale") || this.$i18n.locale;
        this.theme = this.settingsStore.getSetting("theme");
        this.enableHideUltimateTrainerButton = this.settingsStore.getSetting("enable-hide-ultimate-trainer-button");
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
        },
        setHideUltimateTrainerButton() {
            this.settingsStore.setSetting("enable-hide-ultimate-trainer-button", this.enableHideUltimateTrainerButton);
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
                        <option value="ko">한국어</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="theme" class="form-label">{{ $t("main.app_theme") }}</label>
                    <select id="theme" v-model="theme" class="form-select" @change="setTheme">
                        <option v-for="_theme in themes" :key="_theme" :value="_theme">{{ _theme.capitalize() }}</option>
                    </select>
                </div>
                <div class="form-check form-switch">
                    <input id="enable-hide-ultimate-trainer-button" v-model="enableHideUltimateTrainerButton" class="form-check-input" type="checkbox" @change="setHideUltimateTrainerButton">
                    <label for="enable-hide-ultimate-trainer-button" class="form-check-label">{{ $t("main.hide_ultimate_trainer_button_from_menu") }}
                        <GameRestartRequiredIcon class="ms-3" />
                    </label>
                </div>
            </div>
        </div>
    </div>
</template>
