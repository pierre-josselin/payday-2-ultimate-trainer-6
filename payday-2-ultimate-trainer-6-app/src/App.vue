<script>
import "bootstrap";

import { useSettingsStore } from "@/stores/settings";

export default {
    computed: {
        theme() {
            return this.settingsStore.getSetting("theme") || "darkly";
        }
    },
    created() {
        this.settingsStore = useSettingsStore();

        this.$watch("theme", () => {
            const element = document.getElementById("bootswatch");
            element.href = `/node_modules/bootswatch/dist/${this.theme}/bootstrap.min.css`;
        });
    }
}
</script>

<template>
    <RouterView />
</template>

<style>
* {
    outline: none;
}
</style>
