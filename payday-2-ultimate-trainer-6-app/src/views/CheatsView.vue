<script>
import { useMainStore } from "@/stores/main";
import { useCallStore } from "@/stores/calls";
import { useSettingsStore } from "@/stores/settings";

import NavBar from "@/components/NavBar.vue";
import AntiCheatDetectedIcon from "@/components/icons/AntiCheatDetectedIcon.vue";

export default {
    components: {
        NavBar,
        AntiCheatDetectedIcon
    },
    created() {
        this.mainStore = useMainStore();
        this.callStore = useCallStore();
        this.settingsStore = useSettingsStore();

        this.$watch("settingsStore.moveSpeedMultiplier", (moveSpeedMultiplier) => {
            if (!moveSpeedMultiplier) {
                this.settingsStore.moveSpeedMultiplier = null;
            }
        });

        this.$watch("settingsStore.throwDistanceMultiplier", (throwDistanceMultiplier) => {
            if (!throwDistanceMultiplier) {
                this.settingsStore.throwDistanceMultiplier = null;
            }
        });

        this.$watch("settingsStore.fireRateMultiplier", (fireRateMultiplier) => {
            if (!fireRateMultiplier) {
                this.settingsStore.fireRateMultiplier = null;
            }
        });

        this.$watch("settingsStore.damageMultiplier", (damageMultiplier) => {
            if (!damageMultiplier) {
                this.settingsStore.damageMultiplier = null;
            }
        });
    },
    methods: {
        setGodMode() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setGodMode", this.settingsStore.enableGodMode]);
            }
        },
        setNoFallDamage() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setNoFallDamage", this.settingsStore.enableNoFallDamage]);
            }
        },
        setInfiniteStamina() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setInfiniteStamina", this.settingsStore.enableInfiniteStamina]);
            }
        },
        setCanRunDirectional() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setCanRunDirectional", this.settingsStore.enableCanRunDirectional]);
            }
        },
        setCanRunWithAnyBag() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setCanRunWithAnyBag", this.settingsStore.enableCanRunWithAnyBag]);
            }
        },
        setInstantMaskOn() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setInstantMaskOn", this.settingsStore.enableInstantMaskOn]);
            }
        },
        setNoCarryCooldown() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setNoCarryCooldown", this.settingsStore.enableNoCarryCooldown]);
            }
        },
        setNoFlashbangs() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setNoFlashbangs", this.settingsStore.enableNoFlashbangs]);
            }
        },
        setInstantInteraction() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setInstantInteraction", this.settingsStore.enableInstantInteraction]);
            }
        },
        setInstantDeployment() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setInstantDeployment", this.settingsStore.enableInstantDeployment]);
            }
        },
        setUnlimitedEquipment() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setUnlimitedEquipment", this.settingsStore.enableUnlimitedEquipment]);
            }
        },
        setInstantWeaponSwap() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setInstantWeaponSwap", this.settingsStore.enableInstantWeaponSwap]);
            }
        },
        setInstantWeaponReload() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setInstantWeaponReload", this.settingsStore.enableInstantWeaponReload]);
            }
        },
        setNoWeaponRecoil() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setNoWeaponRecoil", this.settingsStore.enableNoWeaponRecoil]);
            }
        },
        setNoWeaponSpread() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setNoWeaponSpread", this.settingsStore.enableNoWeaponSpread]);
            }
        },
        setShootThroughWalls() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setShootThroughWalls", this.settingsStore.enableShootThroughWalls]);
            }
        },
        setUnlimitedAmmo() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setUnlimitedAmmo", this.settingsStore.enableUnlimitedAmmo]);
            }
        },
        setNoSlowMotion() {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setNoSlowMotion", this.settingsStore.enableNoSlowMotion]);
            }
        },
        setMoveSpeedMultiplier() {
            if (this.mainStore.isInHeist && ((this.settingsStore.enableMoveSpeedMultiplier && this.settingsStore.moveSpeedMultiplier) || !this.settingsStore.enableMoveSpeedMultiplier)) {
                this.callStore.addCall(["UT:setMoveSpeedMultiplier", this.settingsStore.enableMoveSpeedMultiplier, this.settingsStore.moveSpeedMultiplier]);
            }
        },
        setThrowDistanceMultiplier() {
            if (this.mainStore.isInHeist && ((this.settingsStore.enableThrowDistanceMultiplier && this.settingsStore.throwDistanceMultiplier) || !this.settingsStore.enableThrowDistanceMultiplier)) {
                this.callStore.addCall(["UT:setThrowDistanceMultiplier", this.settingsStore.enableThrowDistanceMultiplier, this.settingsStore.throwDistanceMultiplier]);
            }
        },
        setFireRateMultiplier() {
            if (this.mainStore.isInHeist && ((this.settingsStore.enableFireRateMultiplier && this.settingsStore.fireRateMultiplier) || !this.settingsStore.enableFireRateMultiplier)) {
                this.callStore.addCall(["UT:setFireRateMultiplier", this.settingsStore.enableFireRateMultiplier, this.settingsStore.fireRateMultiplier]);
            }
        },
        setDamageMultiplier() {
            if (this.mainStore.isInHeist && ((this.settingsStore.enableDamageMultiplier && this.settingsStore.damageMultiplier) || !this.settingsStore.enableDamageMultiplier)) {
                this.callStore.addCall(["UT:setDamageMultiplier", this.settingsStore.enableDamageMultiplier, this.settingsStore.damageMultiplier]);
            }
        },
        disableAllCheats() {
            this.settingsStore.enableGodMode = false;
            this.settingsStore.enableNoFallDamage = false;
            this.settingsStore.enableInfiniteStamina = false;
            this.settingsStore.enableCanRunDirectional = false;
            this.settingsStore.enableCanRunWithAnyBag = false;
            this.settingsStore.enableInstantMaskOn = false;
            this.settingsStore.enableNoCarryCooldown = false;
            this.settingsStore.enableNoFlashbangs = false;
            this.settingsStore.enableInstantInteraction = false;
            this.settingsStore.enableInstantDeployment = false;
            this.settingsStore.enableUnlimitedEquipment = false;
            this.settingsStore.enableInstantWeaponSwap = false;
            this.settingsStore.enableInstantWeaponReload = false;
            this.settingsStore.enableNoWeaponRecoil = false;
            this.settingsStore.enableNoWeaponSpread = false;
            this.settingsStore.enableShootThroughWalls = false;
            this.settingsStore.enableUnlimitedAmmo = false;
            this.settingsStore.enableNoSlowMotion = false;
            this.settingsStore.enableMoveSpeedMultiplier = false;
            this.settingsStore.enableThrowDistanceMultiplier = false;
            this.settingsStore.enableFireRateMultiplier = false;
            this.settingsStore.enableDamageMultiplier = false;

            this.setGodMode();
            this.setNoFallDamage();
            this.setInfiniteStamina();
            this.setCanRunDirectional();
            this.setCanRunWithAnyBag();
            this.setInstantMaskOn();
            this.setNoCarryCooldown();
            this.setNoFlashbangs();
            this.setInstantInteraction();
            this.setInstantDeployment();
            this.setUnlimitedEquipment();
            this.setInstantWeaponSwap();
            this.setInstantWeaponReload();
            this.setNoWeaponRecoil();
            this.setNoWeaponSpread();
            this.setShootThroughWalls();
            this.setUnlimitedAmmo();
            this.setNoSlowMotion();
            this.setMoveSpeedMultiplier();
            this.setThrowDistanceMultiplier();
            this.setFireRateMultiplier();
            this.setDamageMultiplier();
        }
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 1000px;" class="container my-5">
        <div class="card">
            <div class="card-header">{{ $t("main.persistent_cheats") }}</div>
            <div class="card-body p-4">
                <div class="row row-cols-1 row-cols-sm-2">
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-god-mode" v-model="settingsStore.enableGodMode" class="form-check-input" type="checkbox" @change="setGodMode">
                            <label for="enable-god-mode" class="form-check-label">{{ $t("main.god_mode") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-fall-damage" v-model="settingsStore.enableNoFallDamage" class="form-check-input" type="checkbox" @change="setNoFallDamage">
                            <label for="enable-no-fall-damage" class="form-check-label">{{ $t("main.no_fall_damage") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-infinite-stamina" v-model="settingsStore.enableInfiniteStamina" class="form-check-input" type="checkbox" @change="setInfiniteStamina">
                            <label for="enable-infinite-stamina" class="form-check-label">{{ $t("main.infinite_stamina") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-can-run-directional" v-model="settingsStore.enableCanRunDirectional" class="form-check-input" type="checkbox" @change="setCanRunDirectional">
                            <label for="enable-can-run-directional" class="form-check-label">{{ $t("main.can_run_directional") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-can-run-with-any-bag" v-model="settingsStore.enableCanRunWithAnyBag" class="form-check-input" type="checkbox" @change="setCanRunWithAnyBag">
                            <label for="enable-can-run-with-any-bag" class="form-check-label">{{ $t("main.can_run_with_any_bag") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-mask-on" v-model="settingsStore.enableInstantMaskOn" class="form-check-input" type="checkbox" @change="setInstantMaskOn">
                            <label for="enable-instant-mask-on" class="form-check-label">{{ $t("main.instant_mask_on") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-carry-cooldown" v-model="settingsStore.enableNoCarryCooldown" class="form-check-input" type="checkbox" @change="setNoCarryCooldown">
                            <label for="enable-no-carry-cooldown" class="form-check-label">{{ $t("main.no_carry_cooldown") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-flashbangs" v-model="settingsStore.enableNoFlashbangs" class="form-check-input" type="checkbox" @change="setNoFlashbangs">
                            <label for="enable-no-flashbangs" class="form-check-label">{{ $t("main.no_flashbangs") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-interaction" v-model="settingsStore.enableInstantInteraction" class="form-check-input" type="checkbox" @change="setInstantInteraction">
                            <label for="enable-instant-interaction" class="form-check-label">{{ $t("main.instant_interaction") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-deployment" v-model="settingsStore.enableInstantDeployment" class="form-check-input" type="checkbox" @change="setInstantDeployment">
                            <label for="enable-instant-deployment" class="form-check-label">{{ $t("main.instant_deployment") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-unlimited-equipment" v-model="settingsStore.enableUnlimitedEquipment" class="form-check-input" type="checkbox" @change="setUnlimitedEquipment">
                            <label for="enable-unlimited-equipment" class="form-check-label">{{ $t("main.unlimited_equipment") }}</label>
                            <AntiCheatDetectedIcon class="ms-3" />
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-weapon-swap" v-model="settingsStore.enableInstantWeaponSwap" class="form-check-input" type="checkbox" @change="setInstantWeaponSwap">
                            <label for="enable-instant-weapon-swap" class="form-check-label">{{ $t("main.instant_weapon_swap") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-weapon-reload" v-model="settingsStore.enableInstantWeaponReload" class="form-check-input" type="checkbox" @change="setInstantWeaponReload">
                            <label for="enable-instant-weapon-reload" class="form-check-label">{{ $t("main.instant_weapon_reload") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-weapon-recoil" v-model="settingsStore.enableNoWeaponRecoil" class="form-check-input" type="checkbox" @change="setNoWeaponRecoil">
                            <label for="enable-no-weapon-recoil" class="form-check-label">{{ $t("main.no_weapon_recoil") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-weapon-spread" v-model="settingsStore.enableNoWeaponSpread" class="form-check-input" type="checkbox" @change="setNoWeaponSpread">
                            <label for="enable-no-weapon-spread" class="form-check-label">{{ $t("main.no_weapon_spread") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-shoot-through-walls" v-model="settingsStore.enableShootThroughWalls" class="form-check-input" type="checkbox" @change="setShootThroughWalls">
                            <label for="enable-shoot-through-walls" class="form-check-label">{{ $t("main.shoot_through_walls") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-unlimited-ammo" v-model="settingsStore.enableUnlimitedAmmo" class="form-check-input" type="checkbox" @change="setUnlimitedAmmo">
                            <label for="enable-unlimited-ammo" class="form-check-label">{{ $t("main.unlimited_ammo") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-slow-motion" v-model="settingsStore.enableNoSlowMotion" class="form-check-input" type="checkbox" @change="setNoSlowMotion">
                            <label for="enable-no-slow-motion" class="form-check-label">{{ $t("main.no_slow_motion") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="row">
                            <div class="col-10">
                                <div class="form-check form-switch">
                                    <input id="enable-move-speed-multiplier" v-model="settingsStore.enableMoveSpeedMultiplier" class="form-check-input" type="checkbox" @change="setMoveSpeedMultiplier">
                                    <label for="enable-move-speed-multiplier" class="form-check-label">{{ $t("main.move_speed_multiplier") }}</label>
                                </div>
                            </div>
                            <div class="col-2">
                                <input v-model="settingsStore.moveSpeedMultiplier" type="number" class="form-control form-control-sm border-0 shadow-none bg-transparent text-reset text-end" min="1" step="1" @change="setMoveSpeedMultiplier">
                            </div>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="row">
                            <div class="col-10">
                                <div class="form-check form-switch">
                                    <input id="enable-throw-distance-multiplier" v-model="settingsStore.enableThrowDistanceMultiplier" class="form-check-input" type="checkbox" @change="setThrowDistanceMultiplier">
                                    <label for="enable-throw-distance-multiplier" class="form-check-label">{{ $t("main.throw_distance_multiplier") }}</label>
                                </div>
                            </div>
                            <div class="col-2">
                                <input v-model="settingsStore.throwDistanceMultiplier" type="number" class="form-control form-control-sm border-0 shadow-none bg-transparent text-reset text-end" min="1" step="1" @change="setThrowDistanceMultiplier">
                            </div>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="row">
                            <div class="col-10">
                                <div class="form-check form-switch">
                                    <input id="enable-fire-rate-multiplier" v-model="settingsStore.enableFireRateMultiplier" class="form-check-input" type="checkbox" @change="setFireRateMultiplier">
                                    <label for="enable-fire-rate-multiplier" class="form-check-label">{{ $t("main.fire_rate_multiplier") }}</label>
                                </div>
                            </div>
                            <div class="col-2">
                                <input v-model="settingsStore.fireRateMultiplier" type="number" class="form-control form-control-sm border-0 shadow-none bg-transparent text-reset text-end" min="1" step="1" @change="setFireRateMultiplier">
                            </div>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="row">
                            <div class="col-10">
                                <div class="form-check form-switch">
                                    <input id="enable-damage-multiplier" v-model="settingsStore.enableDamageMultiplier" class="form-check-input" type="checkbox" @change="setDamageMultiplier">
                                    <label for="enable-damage-multiplier" class="form-check-label">{{ $t("main.damage_multiplier") }}</label>
                                </div>
                            </div>
                            <div class="col-2">
                                <input v-model="settingsStore.damageMultiplier" type="number" class="form-control form-control-sm border-0 shadow-none bg-transparent text-reset text-end" min="1" step="1" @change="setDamageMultiplier">
                            </div>
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary" @click="disableAllCheats">{{ $t("main.disable_all_cheats") }}</button>
            </div>
        </div>
    </div>
</template>
