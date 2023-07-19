<script>
export default {}
</script>

<template>
    <span class="popover-hover" data-bs-toggle="popover" :data-bs-title="$t('main.anti_cheat_detected')" :data-bs-content="$t('dialogs.anti_cheat_detected_icon_description')">
        <FontAwesomeIcon icon="fa-solid fa-triangle-exclamation" class="text-warning" />
    </span>
</template>
