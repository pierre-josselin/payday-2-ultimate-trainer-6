<script>
import { useSettingsStore } from "@/stores/settings";
import { useAddonsStore } from "@/stores/addons";

import NavBar from "@/components/NavBar.vue";

import bags from "@/data/bags.json";
import specialEquipment from "@/data/special-equipment.json";

export default {
    components: {
        NavBar
    },
    data() {
        return {
            selectedCategory: "default",
            selectedAction: null,
            selectedArgument: null,
            selectedKey: null,
            setCustomKey: false,
            keys: [
                "applications",
                "backspace",
                "caps lock",
                "delete",
                "down",
                "end",
                "enter",
                "esc",
                "f1",
                "f2",
                "f3",
                "f4",
                "f5",
                "f6",
                "f7",
                "f8",
                "f9",
                "f10",
                "f11",
                "f12",
                "home",
                "insert",
                "left",
                "left alt",
                "left ctrl",
                "left shift",
                "left windows",
                "num *",
                "num +",
                "num -",
                "num .",
                "num /",
                "num 0",
                "num 1",
                "num 2",
                "num 3",
                "num 4",
                "num 5",
                "num 6",
                "num 7",
                "num 8",
                "num 9",
                "num enter",
                "num lock",
                "page down",
                "page up",
                "pause",
                "right",
                "right alt",
                "right ctrl",
                "right shift",
                "right windows",
                "scroll lock",
                "space",
                "sys rq",
                "tab",
                "up",
                "'",
                ",",
                "-",
                ".",
                "/",
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                ";",
                "=",
                "[",
                "\\",
                "]",
                "`",
                "a",
                "b",
                "c",
                "d",
                "e",
                "f",
                "g",
                "h",
                "i",
                "j",
                "k",
                "l",
                "m",
                "n",
                "o",
                "p",
                "q",
                "r",
                "s",
                "t",
                "u",
                "v",
                "w",
                "x",
                "y",
                "z",
                "mouse wheel up",
                "mouse wheel down",
                "mouse 0",
                "mouse 1",
                "mouse 2",
                "mouse 3",
                "mouse 4"
            ],
            actions: {
                default: [
                    "teleport-to-crosshair"
                ],
                environment: [
                    "set-initial-environment",
                    "set-environment-early-morning",
                    "set-environment-morning",
                    "set-environment-mid-day",
                    "set-environment-afternoon",
                    "set-environment-bright-day",
                    "set-environment-cloudy-day",
                    "set-environment-night",
                    "set-environment-misty-night",
                    "set-environment-foggy-night"
                ],
                cheats: [
                    "toggle-god-mode",
                    "toggle-no-fall-damage",
                    "toggle-infinite-stamina",
                    "toggle-can-run-directional",
                    "toggle-can-run-with-any-bag",
                    "toggle-instant-mask-on",
                    "toggle-no-carry-cooldown",
                    "toggle-no-flashbangs",
                    "toggle-instant-interaction",
                    "toggle-instant-deployment",
                    "toggle-unlimited-equipment",
                    "toggle-instant-weapon-swap",
                    "toggle-instant-weapon-reload",
                    "toggle-no-weapon-recoil",
                    "toggle-no-weapon-spread",
                    "toggle-shoot-through-walls",
                    "toggle-unlimited-ammo",
                    "toggle-no-slow-motion",
                    "toggle-move-speed-multiplier",
                    "toggle-throw-distance-multiplier",
                    "toggle-fire-rate-multiplier",
                    "toggle-damage-multiplier"
                ],
                mission: [
                    "start-the-heist",
                    "restart-the-heist",
                    "finish-the-heist",
                    "leave-the-heist",
                    "access-cameras",
                    "trigger-the-alarm",
                    "remove-invisible-walls",
                    "kill-all-enemies",
                    "kill-all-civilians",
                    "tie-all-civilians",
                    "convert-all-enemies",
                    "get-out-of-custody",
                    "set-player-state-civilian",
                    "set-player-state-mask-off",
                    "set-player-state-standard",
                    "teleport-to-player-1",
                    "teleport-to-player-2",
                    "teleport-to-player-3",
                    "replenish-health",
                    "replenish-ammo",
                    "replenish-equipment",
                    "replenish-cable-ties",
                    "replenish-throwables",
                    "replenish-body-bags",
                    "toggle-x-ray",
                    "toggle-prevent-alarm-triggering",
                    "toggle-invisible-player",
                    "toggle-no-clip",
                    "toggle-disable-ai",
                    "toggle-remove-team-ai",
                    "toggle-suspend-point-of-no-return-timer",
                    "toggle-unlimited-pagers",
                    "toggle-instant-drilling",
                    "toggle-carry-stacker",
                    "toggle-no-civilian-kill-penalty",
                    "open-doors",
                    "open-windows",
                    "open-deposit-boxes",
                    "cut-fences",
                    "open-containers",
                    "hack-computers",
                    "place-drills",
                    "pick-up-packages",
                    "open-crates",
                    "barricade-windows",
                    "use-keycards",
                    "open-atms",
                    "place-shaped-charges",
                    "throw-bag",
                    "add-special-equipment"
                ],
                driving: [
                    "spawn-and-drive-vehicle",
                    "remove-spawned-vehicles"
                ],
                spawn: [
                    "spawn-spawn"
                ],
                build: [
                    "build-pick",
                    "build-spawn",
                    "build-delete"
                ],
                addons: [
                    "run-keybind-addon"
                ]
            },
            locales: {
                "teleport-to-crosshair": this.$t("main.teleport_to_crosshair"),
                "set-initial-environment": this.$t("main.default"),
                "set-environment-early-morning": this.$t("main.early_morning"),
                "set-environment-morning": this.$t("main.morning"),
                "set-environment-mid-day": this.$t("main.mid_day"),
                "set-environment-afternoon": this.$t("main.afternoon"),
                "set-environment-bright-day": this.$t("main.bright_day"),
                "set-environment-cloudy-day": this.$t("main.cloudy_day"),
                "set-environment-night": this.$t("main.night"),
                "set-environment-misty-night": this.$t("main.misty_night"),
                "set-environment-foggy-night": this.$t("main.foggy_night"),
                "toggle-god-mode": this.$t("main.god_mode"),
                "toggle-no-fall-damage": this.$t("main.no_fall_damage"),
                "toggle-infinite-stamina": this.$t("main.infinite_stamina"),
                "toggle-can-run-directional": this.$t("main.can_run_directional"),
                "toggle-can-run-with-any-bag": this.$t("main.can_run_with_any_bag"),
                "toggle-instant-mask-on": this.$t("main.instant_mask_on"),
                "toggle-no-carry-cooldown": this.$t("main.no_carry_cooldown"),
                "toggle-no-flashbangs": this.$t("main.no_flashbangs"),
                "toggle-instant-interaction": this.$t("main.instant_interaction"),
                "toggle-instant-deployment": this.$t("main.instant_deployment"),
                "toggle-unlimited-equipment": this.$t("main.unlimited_equipment"),
                "toggle-instant-weapon-swap": this.$t("main.instant_weapon_swap"),
                "toggle-instant-weapon-reload": this.$t("main.instant_weapon_reload"),
                "toggle-no-weapon-recoil": this.$t("main.no_weapon_recoil"),
                "toggle-no-weapon-spread": this.$t("main.no_weapon_spread"),
                "toggle-shoot-through-walls": this.$t("main.shoot_through_walls"),
                "toggle-unlimited-ammo": this.$t("main.unlimited_ammo"),
                "toggle-no-slow-motion": this.$t("main.no_slow_motion"),
                "toggle-move-speed-multiplier": this.$t("main.move_speed_multiplier"),
                "toggle-throw-distance-multiplier": this.$t("main.throw_distance_multiplier"),
                "toggle-fire-rate-multiplier": this.$t("main.fire_rate_multiplier"),
                "toggle-damage-multiplier": this.$t("main.damage_multiplier"),
                "start-the-heist": this.$t("main.start_the_heist"),
                "restart-the-heist": this.$t("main.restart_the_heist"),
                "finish-the-heist": this.$t("main.finish_the_heist"),
                "leave-the-heist": this.$t("main.leave_the_heist"),
                "access-cameras": this.$t("main.access_cameras"),
                "trigger-the-alarm": this.$t("main.trigger_the_alarm"),
                "remove-invisible-walls": this.$t("main.remove_invisible_walls"),
                "kill-all-enemies": `${this.$t("main.kill_all")} - ${this.$t("main.enemies")}`,
                "kill-all-civilians": `${this.$t("main.kill_all")} - ${this.$t("main.civilians")}`,
                "tie-all-civilians": this.$t("main.tie_all_civilians"),
                "convert-all-enemies": this.$t("main.convert_all_enemies"),
                "get-out-of-custody": this.$t("main.get_out_of_custody"),
                "set-player-state-civilian": `${this.$t("main.set_player_state")} - ${this.$t("main.civilian")}`,
                "set-player-state-mask-off": `${this.$t("main.set_player_state")} - ${this.$t("main.mask_off")}`,
                "set-player-state-standard": `${this.$t("main.set_player_state")} - ${this.$t("main.standard")}`,
                "teleport-to-player-1": `${this.$t("main.teleport_to_player")} - 1`,
                "teleport-to-player-2": `${this.$t("main.teleport_to_player")} - 2`,
                "teleport-to-player-3": `${this.$t("main.teleport_to_player")} - 3`,
                "replenish-health": this.$t("main.replenish_health"),
                "replenish-ammo": this.$t("main.replenish_ammo"),
                "replenish-equipment": `${this.$t("main.replenish")} - ${this.$t("main.equipment")}`,
                "replenish-cable-ties": `${this.$t("main.replenish")} - ${this.$t("main.cable_ties")}`,
                "replenish-throwables": `${this.$t("main.replenish")} - ${this.$t("main.throwables")}`,
                "replenish-body-bags": `${this.$t("main.replenish")} - ${this.$t("main.body_bags")}`,
                "toggle-x-ray": this.$t("main.x_ray"),
                "toggle-prevent-alarm-triggering": this.$t("main.prevent_alarm_triggering"),
                "toggle-invisible-player": this.$t("main.invisible_player"),
                "toggle-no-clip": this.$t("main.no_clip"),
                "toggle-disable-ai": this.$t("main.disable_ai"),
                "toggle-remove-team-ai": this.$t("main.remove_team_ai"),
                "toggle-suspend-point-of-no-return-timer": this.$t("main.suspend_point_of_no_return_timer"),
                "toggle-unlimited-pagers": this.$t("main.unlimited_pagers"),
                "toggle-instant-drilling": this.$t("main.instant_drilling"),
                "toggle-carry-stacker": this.$t("main.carry_multiple_bags"),
                "toggle-no-civilian-kill-penalty": this.$t("main.no_civilian_kill_penalty"),
                "open-doors": this.$t("main.open_doors"),
                "open-windows": this.$t("main.open_windows"),
                "open-deposit-boxes": this.$t("main.open_deposit_boxes"),
                "cut-fences": this.$t("main.cut_fences"),
                "open-containers": this.$t("main.open_containers"),
                "hack-computers": this.$t("main.hack_computers"),
                "place-drills": this.$t("main.place_drills"),
                "pick-up-packages": this.$t("main.pick_up_packages"),
                "open-crates": this.$t("main.open_crates"),
                "barricade-windows": this.$t("main.barricade_windows"),
                "use-keycards": this.$t("main.use_keycards"),
                "open-atms": this.$t("main.open_atms"),
                "place-shaped-charges": this.$t("main.place_shaped_charges"),
                "set-slow-motion": this.$t("main.set_slow_motion"),
                "throw-bag": this.$t("main.throw_bag"),
                "add-special-equipment": this.$t("main.add_special_equipment"),
                "spawn-and-drive-vehicle": this.$t("main.drive"),
                "remove-spawned-vehicles": this.$t("main.delete_all_spawned_vehicles"),
                "spawn-spawn": this.$t("main.spawn"),
                "build-pick": this.$t("main.pick"),
                "build-spawn": this.$t("main.spawn"),
                "build-delete": this.$t("main.delete"),
                "run-keybind-addon": this.$t("main.run_addon")
            },
            vehicles: [
                {
                    id: "sport-car",
                    name: "main.sport_car"
                },
                {
                    id: "muscle-car",
                    name: "main.muscle_car"
                },
                {
                    id: "bike",
                    name: "main.bike"
                },
                {
                    id: "truck",
                    name: "main.truck"
                },
                {
                    id: "forklift",
                    name: "main.forklift"
                },
                {
                    id: "golf-cart",
                    name: "main.golf_cart"
                },
                {
                    id: "boat",
                    name: "main.boat"
                }
            ]
        };
    },
    computed: {
        addons() {
            const addons = [];
            this.addonsStore.addons.forEach(addon => {
                if (addon.type == "keybind") {
                    addons.push(addon);
                }
            });
            return addons;
        },
        categories() {
            return Object.keys(this.actions);
        }
    },
    watch: {
        selectedCategory() {
            this.selectedAction = null;
            this.selectedArgument = null;
        },
        selectedAction() {
            this.selectedArgument = null;
        },
        setCustomKey(setCustomKey) {
            if (!setCustomKey) {
                this.selectedKey = null;
            }
        }
    },
    created() {
        this.settingsStore = useSettingsStore();
        this.addonsStore = useAddonsStore();

        this.bags = [...bags].sort();
        this.specialEquipment = [...specialEquipment].sort();
    },
    methods: {
        addKeybind() {
            const keybind = {
                name: this.selectedAction,
                key: this.selectedKey.toLowerCase()
            };
            if (this.selectedArgument) {
                keybind.argument = this.selectedArgument;
            }
            this.settingsStore.keybinds.push(keybind);

            this.selectedCategory = "default";
            this.selectedAction = null;
            this.selectedArgument = null;
            this.selectedKey = null;
            this.setCustomKey = false;

            document.documentElement.querySelector("#close-add-keybind-modal").click();
        },
        removeKeybind(index) {
            this.settingsStore.keybinds.splice(index, 1);
        },
        getKeybindAddonName(addonId) {
            const addon = this.addonsStore.getAddonById(addonId);
            return addon && addon.type == "keybind" ? addon.name : this.$t("main.not_found").toLowerCase();
        }
    }
}
</script>

<template>
    <NavBar />

    <div id="add-keybind-modal" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <form class="modal-content" @submit.prevent="addKeybind">
                <div class="modal-header">
                    <h5 class="modal-title">{{ $t("main.add_a_keybind") }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" />
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="category" class="form-label">{{ $t("main.category") }}</label>
                        <select id="category" v-model="selectedCategory" class="form-select" required>
                            <option v-for="category in categories" :key="category" :value="category">{{ $t(`main.${category}`) }}</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="action" class="form-label">{{ $t("main.action") }}</label>
                        <select id="action" v-model="selectedAction" class="form-select" required>
                            <option v-for="action in actions[selectedCategory]" :key="action" :value="action">{{ locales[action] }}</option>
                        </select>
                    </div>
                    <div v-if="selectedAction === 'throw-bag'" class="mb-3">
                        <label for="bag-argument" class="form-label">{{ $t("main.type") }}</label>
                        <select id="bag-argument" v-model="selectedArgument" class="form-select" required>
                            <option v-for="bag in bags" :key="bag" :value="bag">{{ $t(`bags.${bag}`) }} ({{ bag }})</option>
                        </select>
                    </div>
                    <div v-else-if="selectedAction === 'add-special-equipment'" class="mb-3">
                        <label for="special-equipment-argument" class="form-label">{{ $t("main.type") }}</label>
                        <select id="special-equipment-argument" v-model="selectedArgument" class="form-select" required>
                            <option v-for="_specialEquipment in specialEquipment" :key="_specialEquipment" :value="_specialEquipment">{{ $t(`special_equipment.${_specialEquipment}`) }} ({{ _specialEquipment }})</option>
                        </select>
                    </div>
                    <div v-else-if="selectedAction === 'spawn-and-drive-vehicle'" class="mb-3">
                        <label for="vehicle-argument" class="form-label">{{ $t("main.type") }}</label>
                        <select id="vehicle-argument" v-model="selectedArgument" class="form-select" required>
                            <option v-for="vehicle in vehicles" :key="vehicle.id" :value="vehicle.id">{{ $t(vehicle.name) }}</option>
                        </select>
                    </div>
                    <div v-else-if="selectedAction === 'run-keybind-addon'" class="mb-3">
                        <label for="addon-argument" class="form-label">{{ $t("main.addon") }}</label>
                        <select id="addon-argument" v-model="selectedArgument" class="form-select" required>
                            <option v-for="addon in addons" :key="addon.id" :value="addon.id">{{ $t(addon.name) }}</option>
                        </select>
                    </div>
                    <div class="mb-3" v-if="setCustomKey">
                        <label for="key" class="form-label">{{ $t("main.key") }}</label>
                        <input id="key" type="text" v-model="selectedKey" class="form-control text-uppercase" required>
                        <div class="form-text">{{ $t("dialogs.keys_info") }}</div>
                        <div class="alert alert-info mt-3">{{ $t("dialogs.custom_keys_info") }}</div>
                    </div>
                    <div class="mb-3" v-else>
                        <label for="key" class="form-label">{{ $t("main.key") }}</label>
                        <select id="key" v-model="selectedKey" class="form-select" required>
                            <option v-for="key in keys" :value="key">{{ key.toUpperCase() }}</option>
                        </select>
                        <div class="form-text">{{ $t("dialogs.keys_info") }}</div>
                    </div>
                    <div class="form-check">
                        <input id="set-custom-key" type="checkbox" class="form-check-input" v-model="setCustomKey">
                        <label for="set-custom-key" class="form-check-label">{{ $t("main.custom_key") }}</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="close-add-keybind-modal" type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{ $t("main.close") }}</button>
                    <button type="submit" class="btn btn-primary">{{ $t("main.add") }}</button>
                </div>
            </form>
        </div>
    </div>

    <div style="max-width: 800px;" class="container my-5">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <span>{{ $t("main.keybinds") }}<span v-if="settingsStore.keybinds.length" class="ms-2">({{ settingsStore.keybinds.length }})</span></span>
                <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#add-keybind-modal">
                    <FontAwesomeIcon icon="fa-solid fa-plus" />
                </button>
            </div>
            <div class="card-body p-4">
                <div v-if="!settingsStore.keybinds.length" class="alert alert-info mb-0">{{ $t("dialogs.no_keybinds") }}</div>
                <div v-else class="table-responsive">
                    <table class="table align-middle mb-0">
                        <thead>
                            <tr>
                                <th class="bg-transparent">{{ $t("main.name") }}</th>
                                <th class="bg-transparent">{{ $t("main.key") }}</th>
                                <th class="bg-transparent" />
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(keybind, index) in settingsStore.keybinds">
                                <td class="bg-transparent">
                                    <span>{{ locales[keybind.name] }}</span>
                                    <span v-if="keybind.argument" class="ms-2">({{ keybind.name == "run-keybind-addon" ? getKeybindAddonName(keybind.argument) : keybind.argument }})</span>
                                </td>
                                <td class="bg-transparent text-uppercase">{{ keybind.key }}</td>
                                <td class="bg-transparent text-end">
                                    <button class="btn btn-danger btn-sm" @click="removeKeybind(index)">
                                        <FontAwesomeIcon icon="fa-solid fa-trash-alt" />
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
tr .btn {
    visibility: hidden;
}

tr:hover .btn {
    visibility: visible;
}
</style>
