<script>
import { v4 as uuidv4 } from "uuid";
import { toRaw } from "vue";

import { useAddonsStore } from "@/stores/addons";

import GameRestartRequiredIcon from "@/components/icons/GameRestartRequiredIcon.vue";

export default {
    components: {
        GameRestartRequiredIcon
    },
    props: {
        addonProp: {
            type: Object,
            default: null
        }
    },
    data() {
        return {
            addon: {
                id: null,
                name: null,
                type: "keybind",
                hookId: null,
                enable: true,
                code: null
            }
        };
    },
    watch: {
        "addon.type"(type) {
            if (type != "hook") {
                this.addon.hookId = null;
            }
        }
    },
    created() {
        this.addonsStore = useAddonsStore();

        if (this.addonProp) {
            Object.assign(this.addon, this.addonProp);
        } else {
            this.addon.id = uuidv4();
        }
    },
    methods: {
        createAddon() {
            this.addonsStore.createAddon(this.deepClone(toRaw(this.addon)));
            this.$router.push({ name: "addons.show", params: { addonId: this.addon.id } });
        },
        updateAddon() {
            this.addonsStore.updateAddon(this.deepClone(toRaw(this.addon)));
            this.$router.push({ name: "addons.show", params: { addonId: this.addon.id } });
        }
    }
}
</script>

<template>
    <form @submit.prevent="addonProp ? updateAddon() : createAddon()">
        <div class="mb-3">
            <label for="name" class="form-label">{{ $t("main.name") }}</label>
            <input id="name" type="text" class="form-control" v-model="addon.name" required>
        </div>
        <div class="mb-3">
            <label for="type" class="form-label">{{ $t("main.type") }}</label>
            <select id="type" class="form-select" v-model="addon.type" required>
                <option value="keybind">{{ $t("main.keybind") }}</option>
                <option value="hook">{{ $t("main.hook") }}</option>
                <option value="persist">{{ $t("main.persist") }}</option>
            </select>
        </div>
        <div class="mb-3" v-if="addon.type == 'hook'">
            <label for="hook-id" class="form-label">{{ $t("main.hook_id") }}</label>
            <input id="hook-id" type="text" class="form-control" pattern="[a-z0-9_\-\/]+" :title="$t('dialogs.hook_id_allowed_characters')" v-model="addon.hookId" required>
        </div>
        <div class="form-check mb-3">
            <input id="enable" type="checkbox" class="form-check-input" v-model="addon.enable">
            <label for="enable" class="form-check-label">{{ $t("main.enable") }}</label>
        </div>
        <button type="submit" class="btn btn-primary">
            <span>{{ addonProp ? $t("main.update") : $t("main.create") }}</span>
            <GameRestartRequiredIcon class="ms-3" v-if="addon.type == 'hook'"></GameRestartRequiredIcon>
        </button>
        <RouterLink class="btn btn-secondary ms-3" :to="addonProp ? { name: 'addons.show', params: { addonId: addon.id } } : { name: 'addons.index' }">{{ $t("main.cancel") }}</RouterLink>
    </form>
</template>
