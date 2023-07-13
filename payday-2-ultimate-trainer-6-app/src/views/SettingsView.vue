<script>
import { useSettingsStore } from "@/stores/settings";

import NavBar from "@/components/NavBar.vue";
import RestartRequiredIcon from "@/components/icons/RestartRequiredIcon.vue";

export default {
    components: {
        NavBar,
        RestartRequiredIcon
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
            enablePauseStatsPublishing: false
        };
    },
    created() {
        this.settingsStore = useSettingsStore();

        this.locale = this.settingsStore.getSetting("locale") || this.$i18n.locale;
        this.theme = this.settingsStore.getSetting("theme");
        this.enablePauseStatsPublishing = this.settingsStore.getSetting("theme");
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
        setPauseStatsPublishing() {
            this.settingsStore.setSetting("enable-pause-stats-publishing", this.enablePauseStatsPublishing);
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
                <ul id="myTab" class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#application-settings-tab">{{ $t("main.application") }}</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#game-settings-tab">{{ $t("main.game") }}</button>
                    </li>
                </ul>
                <div class="tab-content pt-3">
                    <div id="application-settings-tab" class="tab-pane show active" tabindex="0">
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
                    <div id="game-settings-tab" class="tab-pane" tabindex="0">
                        <div class="form-check form-switch">
                            <input id="enable-pause-stats-publishing" v-model="enablePauseStatsPublishing" class="form-check-input" type="checkbox" @change="setPauseStatsPublishing">
                            <label for="enable-pause-stats-publishing" class="form-check-label">{{ $t("main.pause_stats_publishing_to_steam_epic") }}
                                <RestartRequiredIcon class="ms-3" />
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
