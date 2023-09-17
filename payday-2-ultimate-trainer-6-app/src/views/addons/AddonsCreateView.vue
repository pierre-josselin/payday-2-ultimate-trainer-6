<script>
import NavBar from "@/components/NavBar.vue";
import AddonForm from "@/components/forms/AddonForm.vue";

export default {
    components: {
        NavBar,
        AddonForm
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 800px;" class="container my-5">
        <div class="card">
            <div class="card-header">{{ $t("main.create_an_addon") }}</div>
            <div class="card-body p-4">
                <AddonForm></AddonForm>
            </div>
        </div>
    </div>
</template>
