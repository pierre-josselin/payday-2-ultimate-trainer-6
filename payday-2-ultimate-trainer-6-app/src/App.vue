<script>
import "bootstrap";

import { useSettingsStore } from "@/stores/settings";

export default {
    created() {
        this.settingsStore = useSettingsStore();

        this.$watch("theme", () => {
            const element = document.getElementById("bootswatch");
            element.href = `/node_modules/bootswatch/dist/${this.theme}/bootstrap.min.css`;
        });
    },
    computed: {
        theme() {
            return this.settingsStore.getSetting("theme") || "darkly";
        }
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
