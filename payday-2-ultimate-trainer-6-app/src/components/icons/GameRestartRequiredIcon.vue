<script>
export default {}
</script>

<template>
    <span class="popover-hover" data-bs-toggle="popover" :data-bs-title="$t('main.game_restart_required')" :data-bs-content="$t('dialogs.game_restart_required_icon_description')">
        <FontAwesomeIcon icon="fa-solid fa-rotate-right" class="text-info" />
    </span>
</template>
