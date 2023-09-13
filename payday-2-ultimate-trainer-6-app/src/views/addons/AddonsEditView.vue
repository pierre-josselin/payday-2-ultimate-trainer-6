<script>
import { useAddonsStore } from "@/stores/addons";

import NavBar from "@/components/NavBar.vue";
import AddonForm from "@/components/forms/AddonForm.vue";

export default {
    components: {
        NavBar,
        AddonForm
    },
    created() {
        this.addonsStore = useAddonsStore();

        const addonId = this.$route.params.addonId;
        this.addon = this.addonsStore.getAddonById(addonId);
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 800px;" class="container my-5">
        <div class="card">
            <div class="card-header">{{ addon.name }}</div>
            <div class="card-body p-4">
                <AddonForm :addon-prop="addon"></AddonForm>
            </div>
        </div>
    </div>
</template>
