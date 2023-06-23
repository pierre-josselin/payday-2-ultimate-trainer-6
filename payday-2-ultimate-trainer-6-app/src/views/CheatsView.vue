<script>
import { useCallStore } from "@/stores/calls";
import { useSettingsStore } from "@/stores/settings";

import NavBar from "@/components/NavBar.vue";
import AntiCheatDetectedIcon from "@/components/icons/AntiCheatDetectedIcon.vue";

export default {
    components: {
        NavBar,
        AntiCheatDetectedIcon
    },
    data() {
        return {
            enableGodMode: false,
            enableInfiniteStamina: false,
            enableCanRunDirectional: false,
            enableCanRunWithAnyBag: false,
            enableInstantMaskOn: false,
            enableNoCarryCooldown: false,
            enableNoFlashbangs: false,
            enableInstantWeaponSwap: false,
            enableInstantWeaponReload: false,
            enableNoWeaponRecoil: false,
            enableNoWeaponSpread: false,
            enableShootThroughWalls: false,
            enableUnlimitedAmmo: false,
            enableInstantInteraction: false,
            enableInstantDeployment: false,
            enableUnlimitedEquipment: false,
            enableMoveSpeedMultiplier: false,
            enableThrowDistanceMultiplier: false,
            enableFireRateMultiplier: false,
            enableDamageMultiplier: false,
            moveSpeedMultiplier: 1,
            throwDistanceMultiplier: 1,
            fireRateMultiplier: 1,
            damageMultiplier: 1
        };
    },
    created() {
        this.callStore = useCallStore();
        this.settingsStore = useSettingsStore();

        this.enableGodMode = this.settingsStore.getSetting("enable-god-mode");
        this.enableInfiniteStamina = this.settingsStore.getSetting("enable-infinite-stamina");
        this.enableCanRunDirectional = this.settingsStore.getSetting("enable-can-run-directional");
        this.enableCanRunWithAnyBag = this.settingsStore.getSetting("enable-can-run-with-any-bag");
        this.enableInstantMaskOn = this.settingsStore.getSetting("enable-instant-mask-on");
        this.enableNoCarryCooldown = this.settingsStore.getSetting("enable-no-carry-cooldown");
        this.enableNoFlashbangs = this.settingsStore.getSetting("enable-no-flashbangs");
        this.enableInstantInteraction = this.settingsStore.getSetting("enable-instant-interaction");
        this.enableInstantDeployment = this.settingsStore.getSetting("enable-instant-deployment");
        this.enableUnlimitedEquipment = this.settingsStore.getSetting("enable-unlimited-equipment");
        this.enableInstantWeaponSwap = this.settingsStore.getSetting("enable-instant-weapon-swap");
        this.enableInstantWeaponReload = this.settingsStore.getSetting("enable-instant-weapon-reload");
        this.enableNoWeaponRecoil = this.settingsStore.getSetting("enable-no-weapon-recoil");
        this.enableNoWeaponSpread = this.settingsStore.getSetting("enable-no-weapon-spread");
        this.enableShootThroughWalls = this.settingsStore.getSetting("enable-shoot-through-walls");
        this.enableUnlimitedAmmo = this.settingsStore.getSetting("enable-unlimited-ammo");
        this.enableMoveSpeedMultiplier = this.settingsStore.getSetting("enable-move-speed-multiplier");
        this.enableThrowDistanceMultiplier = this.settingsStore.getSetting("enable-throw-distance-multiplier");
        this.enableFireRateMultiplier = this.settingsStore.getSetting("enable-fire-rate-multiplier");
        this.enableDamageMultiplier = this.settingsStore.getSetting("enable-damage-multiplier");
        this.moveSpeedMultiplier = this.settingsStore.getSetting("move-speed-multiplier");
        this.throwDistanceMultiplier = this.settingsStore.getSetting("throw-distance-multiplier");
        this.fireRateMultiplier = this.settingsStore.getSetting("fire-rate-multiplier");
        this.damageMultiplier = this.settingsStore.getSetting("damage-multiplier");
    },
    watch: {
        moveSpeedMultiplier(moveSpeedMultiplier) {
            if (moveSpeedMultiplier === "") {
                this.moveSpeedMultiplier = null;
            }
        },
        throwDistanceMultiplier(throwDistanceMultiplier) {
            if (throwDistanceMultiplier === "") {
                this.throwDistanceMultiplier = null;
            }
        },
        fireRateMultiplier(fireRateMultiplier) {
            if (fireRateMultiplier === "") {
                this.fireRateMultiplier = null;
            }
        },
        damageMultiplier(damageMultiplier) {
            if (damageMultiplier === "") {
                this.damageMultiplier = null;
            }
        }
    },
    methods: {
        setGodMode() {
            this.callStore.addCall(["UT:setGodMode", this.enableGodMode]);
            this.settingsStore.setSetting("enable-god-mode", this.enableGodMode);
            this.settingsStore.saveSettings();
        },
        setInfiniteStamina() {
            this.callStore.addCall(["UT:setInfiniteStamina", this.enableInfiniteStamina]);
            this.settingsStore.setSetting("enable-infinite-stamina", this.enableInfiniteStamina);
            this.settingsStore.saveSettings();
        },
        setCanRunDirectional() {
            this.callStore.addCall(["UT:setCanRunDirectional", this.enableCanRunDirectional]);
            this.settingsStore.setSetting("enable-can-run-directional", this.enableCanRunDirectional);
            this.settingsStore.saveSettings();
        },
        setCanRunWithAnyBag() {
            this.callStore.addCall(["UT:setCanRunWithAnyBag", this.enableCanRunWithAnyBag]);
            this.settingsStore.setSetting("enable-can-run-with-any-bag", this.enableCanRunWithAnyBag);
            this.settingsStore.saveSettings();
        },
        setInstantMaskOn() {
            this.callStore.addCall(["UT:setInstantMaskOn", this.enableInstantMaskOn]);
            this.settingsStore.setSetting("enable-instant-mask-on", this.enableInstantMaskOn);
            this.settingsStore.saveSettings();
        },
        setNoCarryCooldown() {
            this.callStore.addCall(["UT:setNoCarryCooldown", this.enableNoCarryCooldown]);
            this.settingsStore.setSetting("enable-no-carry-cooldown", this.enableNoCarryCooldown);
            this.settingsStore.saveSettings();
        },
        setNoFlashbangs() {
            this.callStore.addCall(["UT:setNoFlashbangs", this.enableNoFlashbangs]);
            this.settingsStore.setSetting("enable-no-flashbangs", this.enableNoFlashbangs);
            this.settingsStore.saveSettings();
        },
        setInstantInteraction() {
            this.callStore.addCall(["UT:setInstantInteraction", this.enableInstantInteraction]);
            this.settingsStore.setSetting("enable-instant-interaction", this.enableInstantInteraction);
            this.settingsStore.saveSettings();
        },
        setInstantDeployment() {
            this.callStore.addCall(["UT:setInstantDeployment", this.enableInstantDeployment]);
            this.settingsStore.setSetting("enable-instant-deployment", this.enableInstantDeployment);
            this.settingsStore.saveSettings();
        },
        setUnlimitedEquipment() {
            this.callStore.addCall(["UT:setUnlimitedEquipment", this.enableUnlimitedEquipment]);
            this.settingsStore.setSetting("enable-unlimited-equipment", this.enableUnlimitedEquipment);
            this.settingsStore.saveSettings();
        },
        setInstantWeaponSwap() {
            this.callStore.addCall(["UT:setInstantWeaponSwap", this.enableInstantWeaponSwap]);
            this.settingsStore.setSetting("enable-instant-weapon-swap", this.enableInstantWeaponSwap);
            this.settingsStore.saveSettings();
        },
        setInstantWeaponReload() {
            this.callStore.addCall(["UT:setInstantWeaponReload", this.enableInstantWeaponReload]);
            this.settingsStore.setSetting("enable-instant-weapon-reload", this.enableInstantWeaponReload);
            this.settingsStore.saveSettings();
        },
        setNoWeaponRecoil() {
            this.callStore.addCall(["UT:setNoWeaponRecoil", this.enableNoWeaponRecoil]);
            this.settingsStore.setSetting("enable-no-weapon-recoil", this.enableNoWeaponRecoil);
            this.settingsStore.saveSettings();
        },
        setNoWeaponSpread() {
            this.callStore.addCall(["UT:setNoWeaponSpread", this.enableNoWeaponSpread]);
            this.settingsStore.setSetting("enable-no-weapon-spread", this.enableNoWeaponSpread);
            this.settingsStore.saveSettings();
        },
        setShootThroughWalls() {
            this.callStore.addCall(["UT:setShootThroughWalls", this.enableShootThroughWalls]);
            this.settingsStore.setSetting("enable-shoot-through-walls", this.enableShootThroughWalls);
            this.settingsStore.saveSettings();
        },
        setUnlimitedAmmo() {
            this.callStore.addCall(["UT:setUnlimitedAmmo", this.enableUnlimitedAmmo]);
            this.settingsStore.setSetting("enable-unlimited-ammo", this.enableUnlimitedAmmo);
            this.settingsStore.saveSettings();
        },
        setMoveSpeedMultiplier() {
            if (this.enableMoveSpeedMultiplier && this.moveSpeedMultiplier || !this.enableMoveSpeedMultiplier) {
                this.callStore.addCall(["UT:setMoveSpeedMultiplier", this.enableMoveSpeedMultiplier, this.moveSpeedMultiplier]);
            }
            this.settingsStore.setSetting("enable-move-speed-multiplier", this.enableMoveSpeedMultiplier);
            this.settingsStore.setSetting("move-speed-multiplier", this.moveSpeedMultiplier);
            this.settingsStore.saveSettings();
        },
        setThrowDistanceMultiplier() {
            if (this.enableThrowDistanceMultiplier && this.throwDistanceMultiplier || !this.enableThrowDistanceMultiplier) {
                this.callStore.addCall(["UT:setThrowDistanceMultiplier", this.enableThrowDistanceMultiplier, this.throwDistanceMultiplier]);
            }
            this.settingsStore.setSetting("enable-throw-distance-multiplier", this.enableThrowDistanceMultiplier);
            this.settingsStore.setSetting("throw-distance-multiplier", this.throwDistanceMultiplier);
            this.settingsStore.saveSettings();
        },
        setFireRateMultiplier() {
            if (this.enableFireRateMultiplier && this.fireRateMultiplier || !this.enableFireRateMultiplier) {
                this.callStore.addCall(["UT:setFireRateMultiplier", this.enableFireRateMultiplier, this.fireRateMultiplier]);
            }
            this.settingsStore.setSetting("enable-fire-rate-multiplier", this.enableFireRateMultiplier);
            this.settingsStore.setSetting("fire-rate-multiplier", this.fireRateMultiplier);
            this.settingsStore.saveSettings();
        },
        setDamageMultiplier() {
            if (this.enableDamageMultiplier && this.damageMultiplier || !this.enableDamageMultiplier) {
                this.callStore.addCall(["UT:setDamageMultiplier", this.enableDamageMultiplier, this.damageMultiplier]);
            }
            this.settingsStore.setSetting("enable-damage-multiplier", this.enableDamageMultiplier);
            this.settingsStore.setSetting("damage-multiplier", this.damageMultiplier);
            this.settingsStore.saveSettings();
        },
        disableAllCheats() {
            this.settingsStore.setSetting("enable-god-mode", this.enableGodMode = false);
            this.settingsStore.setSetting("enable-infinite-stamina", this.enableInfiniteStamina = false);
            this.settingsStore.setSetting("enable-can-run-directional", this.enableCanRunDirectional = false);
            this.settingsStore.setSetting("enable-can-run-with-any-bag", this.enableCanRunWithAnyBag = false);
            this.settingsStore.setSetting("enable-instant-mask-on", this.enableInstantMaskOn = false);
            this.settingsStore.setSetting("enable-no-carry-cooldown", this.enableNoCarryCooldown = false);
            this.settingsStore.setSetting("enable-no-flashbangs", this.enableNoFlashbangs = false);
            this.settingsStore.setSetting("enable-instant-interaction", this.enableInstantInteraction = false);
            this.settingsStore.setSetting("enable-instant-deployment", this.enableInstantDeployment = false);
            this.settingsStore.setSetting("enable-unlimited-equipment", this.enableUnlimitedEquipment = false);
            this.settingsStore.setSetting("enable-instant-weapon-swap", this.enableInstantWeaponSwap = false);
            this.settingsStore.setSetting("enable-instant-weapon-reload", this.enableInstantWeaponReload = false);
            this.settingsStore.setSetting("enable-no-weapon-recoil", this.enableNoWeaponRecoil = false);
            this.settingsStore.setSetting("enable-no-weapon-spread", this.enableNoWeaponSpread = false);
            this.settingsStore.setSetting("enable-shoot-through-walls", this.enableShootThroughWalls = false);
            this.settingsStore.setSetting("enable-unlimited-ammo", this.enableUnlimitedAmmo = false);
            this.settingsStore.setSetting("enable-move-speed-multiplier", this.enableMoveSpeedMultiplier = false);
            this.settingsStore.setSetting("enable-throw-distance-multiplier", this.enableThrowDistanceMultiplier = false);
            this.settingsStore.setSetting("enable-fire-rate-multiplier", this.enableFireRateMultiplier = false);
            this.settingsStore.setSetting("enable-damage-multiplier", this.enableDamageMultiplier = false);
            this.settingsStore.saveSettings();
        }
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 1000px;" class="container my-5">
        <div class="card">
            <div class="card-header">{{ $t("main.cheats") }}</div>
            <div class="card-body p-4">
                <div class="row row-cols-2">
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-god-mode" class="form-check-input" type="checkbox" v-model="enableGodMode" @change="setGodMode">
                            <label for="enable-god-mode" class="form-check-label">{{ $t("cheats.god_mode") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-infinite-stamina" class="form-check-input" type="checkbox" v-model="enableInfiniteStamina" @change="setInfiniteStamina">
                            <label for="enable-infinite-stamina" class="form-check-label">{{ $t("cheats.infinite_stamina") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-can-run-directional" class="form-check-input" type="checkbox" v-model="enableCanRunDirectional" @change="setCanRunDirectional">
                            <label for="enable-can-run-directional" class="form-check-label">{{ $t("cheats.can_run_directional") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-can-run-with-any-bag" class="form-check-input" type="checkbox" v-model="enableCanRunWithAnyBag" @change="setCanRunWithAnyBag">
                            <label for="enable-can-run-with-any-bag" class="form-check-label">{{ $t("cheats.can_run_with_any_bag") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-mask-on" class="form-check-input" type="checkbox" v-model="enableInstantMaskOn" @change="setInstantMaskOn">
                            <label for="enable-instant-mask-on" class="form-check-label">{{ $t("cheats.instant_mask_on") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-carry-cooldown" class="form-check-input" type="checkbox" v-model="enableNoCarryCooldown" @change="setNoCarryCooldown">
                            <label for="enable-no-carry-cooldown" class="form-check-label">{{ $t("cheats.no_carry_cooldown") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-flashbangs" class="form-check-input" type="checkbox" v-model="enableNoFlashbangs" @change="setNoFlashbangs">
                            <label for="enable-no-flashbangs" class="form-check-label">{{ $t("cheats.no_flashbangs") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-interaction" class="form-check-input" type="checkbox" v-model="enableInstantInteraction" @change="setInstantInteraction">
                            <label for="enable-instant-interaction" class="form-check-label">{{ $t("cheats.instant_interaction") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-deployment" class="form-check-input" type="checkbox" v-model="enableInstantDeployment" @change="setInstantDeployment">
                            <label for="enable-instant-deployment" class="form-check-label">{{ $t("cheats.instant_deployment") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-unlimited-equipment" class="form-check-input" type="checkbox" v-model="enableUnlimitedEquipment" @change="setUnlimitedEquipment">
                            <label for="enable-unlimited-equipment" class="form-check-label">{{ $t("cheats.unlimited_equipment") }}</label>
                            <AntiCheatDetectedIcon class="ms-3" />
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-weapon-swap" class="form-check-input" type="checkbox" v-model="enableInstantWeaponSwap" @change="setInstantWeaponSwap">
                            <label for="enable-instant-weapon-swap" class="form-check-label">{{ $t("cheats.instant_weapon_swap") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-weapon-reload" class="form-check-input" type="checkbox" v-model="enableInstantWeaponReload" @change="setInstantWeaponReload">
                            <label for="enable-instant-weapon-reload" class="form-check-label">{{ $t("cheats.instant_weapon_reload") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-weapon-recoil" class="form-check-input" type="checkbox" v-model="enableNoWeaponRecoil" @change="setNoWeaponRecoil">
                            <label for="enable-no-weapon-recoil" class="form-check-label">{{ $t("cheats.no_weapon_recoil") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-weapon-spread" class="form-check-input" type="checkbox" v-model="enableNoWeaponSpread" @change="setNoWeaponSpread">
                            <label for="enable-no-weapon-spread" class="form-check-label">{{ $t("cheats.no_weapon_spread") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-shoot-through-walls" class="form-check-input" type="checkbox" v-model="enableShootThroughWalls" @change="setShootThroughWalls">
                            <label for="enable-shoot-through-walls" class="form-check-label">{{ $t("cheats.shoot_through_walls") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-unlimited-ammo" class="form-check-input" type="checkbox" v-model="enableUnlimitedAmmo" @change="setUnlimitedAmmo">
                            <label for="enable-unlimited-ammo" class="form-check-label">{{ $t("cheats.unlimited_ammo") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="row">
                            <div class="col-8">
                                <div class="form-check form-switch">
                                    <input id="enable-move-speed-multiplier" class="form-check-input" type="checkbox" v-model="enableMoveSpeedMultiplier" @change="setMoveSpeedMultiplier">
                                    <label for="enable-move-speed-multiplier" class="form-check-label">{{ $t("cheats.move_speed_multiplier") }}</label>
                                </div>
                            </div>
                            <div class="col-4">
                                <input type="number" class="form-control form-control-sm" min="1" step="1" v-model="moveSpeedMultiplier" @change="setMoveSpeedMultiplier">
                            </div>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="row">
                            <div class="col-8">
                                <div class="form-check form-switch">
                                    <input id="enable-throw-distance-multiplier" class="form-check-input" type="checkbox" v-model="enableThrowDistanceMultiplier" @change="setThrowDistanceMultiplier">
                                    <label for="enable-throw-distance-multiplier" class="form-check-label">{{ $t("cheats.throw_distance_multiplier") }}</label>
                                </div>
                            </div>
                            <div class="col-4">
                                <input type="number" class="form-control form-control-sm" min="1" step="1" v-model="throwDistanceMultiplier" @change="setThrowDistanceMultiplier">
                            </div>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="row">
                            <div class="col-8">
                                <div class="form-check form-switch">
                                    <input id="enable-fire-rate-multiplier" class="form-check-input" type="checkbox" v-model="enableFireRateMultiplier" @change="setFireRateMultiplier">
                                    <label for="enable-fire-rate-multiplier" class="form-check-label">{{ $t("cheats.fire_rate_multiplier") }}</label>
                                </div>
                            </div>
                            <div class="col-4">
                                <input type="number" class="form-control form-control-sm" min="1" step="1" v-model="fireRateMultiplier" @change="setFireRateMultiplier">
                            </div>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="row">
                            <div class="col-8">
                                <div class="form-check form-switch">
                                    <input id="enable-damage-multiplier" class="form-check-input" type="checkbox" v-model="enableDamageMultiplier" @change="setDamageMultiplier">
                                    <label for="enable-damage-multiplier" class="form-check-label">{{ $t("cheats.damage_multiplier") }}</label>
                                </div>
                            </div>
                            <div class="col-4">
                                <input type="number" class="form-control form-control-sm" min="1" step="1" v-model="damageMultiplier" @change="setDamageMultiplier">
                            </div>
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary" @click="disableAllCheats">{{ $t("main.disable_all_cheats") }}</button>
            </div>
        </div>
    </div>
</template>
