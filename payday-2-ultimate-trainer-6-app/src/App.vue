<script>
import "bootstrap";

import { useSettingsStore } from "@/stores/settings";

import SentToast from "@/components/SentToast.vue";

export default {
    components: {
        SentToast
    },
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
    <SentToast />
</template>

<style>
* {
    outline: none;
}

.tooltip-inner {
    color: white !important;
}
</style>
