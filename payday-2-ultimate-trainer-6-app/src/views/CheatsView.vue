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
    data() {
        return {
            enableGodMode: false,
            enableNoFallDamage: false,
            enableInfiniteStamina: false,
            enableCanRunDirectional: false,
            enableCanRunWithAnyBag: false,
            enableInstantMaskOn: false,
            enableNoCarryCooldown: false,
            enableNoFlashbangs: false,
            enableInstantInteraction: false,
            enableInstantDeployment: false,
            enableUnlimitedEquipment: false,
            enableInstantWeaponSwap: false,
            enableInstantWeaponReload: false,
            enableNoWeaponRecoil: false,
            enableNoWeaponSpread: false,
            enableShootThroughWalls: false,
            enableUnlimitedAmmo: false,
            enableNoSlowMotion: false,
            enableMoveSpeedMultiplier: false,
            enableThrowDistanceMultiplier: false,
            enableFireRateMultiplier: false,
            enableDamageMultiplier: false,
            moveSpeedMultiplier: null,
            throwDistanceMultiplier: null,
            fireRateMultiplier: null,
            damageMultiplier: null
        };
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
    created() {
        this.mainStore = useMainStore();
        this.callStore = useCallStore();
        this.settingsStore = useSettingsStore();

        this.enableGodMode = this.settingsStore.getSetting("enable-god-mode");
        this.enableNoFallDamage = this.settingsStore.getSetting("enable-no-fall-damage");
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
        this.enableNoSlowMotion = this.settingsStore.getSetting("enable-no-slow-motion");
        this.enableMoveSpeedMultiplier = this.settingsStore.getSetting("enable-move-speed-multiplier");
        this.enableThrowDistanceMultiplier = this.settingsStore.getSetting("enable-throw-distance-multiplier");
        this.enableFireRateMultiplier = this.settingsStore.getSetting("enable-fire-rate-multiplier");
        this.enableDamageMultiplier = this.settingsStore.getSetting("enable-damage-multiplier");
        this.moveSpeedMultiplier = this.settingsStore.getSetting("move-speed-multiplier") || 2;
        this.throwDistanceMultiplier = this.settingsStore.getSetting("throw-distance-multiplier") || 2;
        this.fireRateMultiplier = this.settingsStore.getSetting("fire-rate-multiplier") || 2;
        this.damageMultiplier = this.settingsStore.getSetting("damage-multiplier") || 2;
    },
    methods: {
        setGodMode(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setGodMode", this.enableGodMode]);
            }
            this.settingsStore.setSetting("enable-god-mode", this.enableGodMode);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setNoFallDamage(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setNoFallDamage", this.enableNoFallDamage]);
            }
            this.settingsStore.setSetting("enable-no-fall-damage", this.enableNoFallDamage);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setInfiniteStamina(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setInfiniteStamina", this.enableInfiniteStamina]);
            }
            this.settingsStore.setSetting("enable-infinite-stamina", this.enableInfiniteStamina);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setCanRunDirectional(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setCanRunDirectional", this.enableCanRunDirectional]);
            }
            this.settingsStore.setSetting("enable-can-run-directional", this.enableCanRunDirectional);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setCanRunWithAnyBag(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setCanRunWithAnyBag", this.enableCanRunWithAnyBag]);
            }
            this.settingsStore.setSetting("enable-can-run-with-any-bag", this.enableCanRunWithAnyBag);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setInstantMaskOn(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setInstantMaskOn", this.enableInstantMaskOn]);
            }
            this.settingsStore.setSetting("enable-instant-mask-on", this.enableInstantMaskOn);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setNoCarryCooldown(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setNoCarryCooldown", this.enableNoCarryCooldown]);
            }
            this.settingsStore.setSetting("enable-no-carry-cooldown", this.enableNoCarryCooldown);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setNoFlashbangs(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setNoFlashbangs", this.enableNoFlashbangs]);
            }
            this.settingsStore.setSetting("enable-no-flashbangs", this.enableNoFlashbangs);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setInstantInteraction(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setInstantInteraction", this.enableInstantInteraction]);
            }
            this.settingsStore.setSetting("enable-instant-interaction", this.enableInstantInteraction);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setInstantDeployment(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setInstantDeployment", this.enableInstantDeployment]);
            }
            this.settingsStore.setSetting("enable-instant-deployment", this.enableInstantDeployment);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setUnlimitedEquipment(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setUnlimitedEquipment", this.enableUnlimitedEquipment]);
            }
            this.settingsStore.setSetting("enable-unlimited-equipment", this.enableUnlimitedEquipment);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setInstantWeaponSwap(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setInstantWeaponSwap", this.enableInstantWeaponSwap]);
            }
            this.settingsStore.setSetting("enable-instant-weapon-swap", this.enableInstantWeaponSwap);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setInstantWeaponReload(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setInstantWeaponReload", this.enableInstantWeaponReload]);
            }
            this.settingsStore.setSetting("enable-instant-weapon-reload", this.enableInstantWeaponReload);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setNoWeaponRecoil(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setNoWeaponRecoil", this.enableNoWeaponRecoil]);
            }
            this.settingsStore.setSetting("enable-no-weapon-recoil", this.enableNoWeaponRecoil);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setNoWeaponSpread(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setNoWeaponSpread", this.enableNoWeaponSpread]);
            }
            this.settingsStore.setSetting("enable-no-weapon-spread", this.enableNoWeaponSpread);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setShootThroughWalls(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setShootThroughWalls", this.enableShootThroughWalls]);
            }
            this.settingsStore.setSetting("enable-shoot-through-walls", this.enableShootThroughWalls);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setUnlimitedAmmo(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setUnlimitedAmmo", this.enableUnlimitedAmmo]);
            }
            this.settingsStore.setSetting("enable-unlimited-ammo", this.enableUnlimitedAmmo);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setNoSlowMotion(saveSettings = true) {
            if (this.mainStore.isInHeist) {
                this.callStore.addCall(["UT:setNoSlowMotion", this.enableNoSlowMotion]);
            }
            this.settingsStore.setSetting("enable-no-slow-motion", this.enableNoSlowMotion);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setMoveSpeedMultiplier(saveSettings = true) {
            if (this.mainStore.isInHeist && ((this.enableMoveSpeedMultiplier && this.moveSpeedMultiplier) || !this.enableMoveSpeedMultiplier)) {
                this.callStore.addCall(["UT:setMoveSpeedMultiplier", this.enableMoveSpeedMultiplier, this.moveSpeedMultiplier]);
            }
            this.settingsStore.setSetting("enable-move-speed-multiplier", this.enableMoveSpeedMultiplier);
            this.settingsStore.setSetting("move-speed-multiplier", this.moveSpeedMultiplier);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setThrowDistanceMultiplier(saveSettings = true) {
            if (this.mainStore.isInHeist && ((this.enableThrowDistanceMultiplier && this.throwDistanceMultiplier) || !this.enableThrowDistanceMultiplier)) {
                this.callStore.addCall(["UT:setThrowDistanceMultiplier", this.enableThrowDistanceMultiplier, this.throwDistanceMultiplier]);
            }
            this.settingsStore.setSetting("enable-throw-distance-multiplier", this.enableThrowDistanceMultiplier);
            this.settingsStore.setSetting("throw-distance-multiplier", this.throwDistanceMultiplier);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setFireRateMultiplier(saveSettings = true) {
            if (this.mainStore.isInHeist && ((this.enableFireRateMultiplier && this.fireRateMultiplier) || !this.enableFireRateMultiplier)) {
                this.callStore.addCall(["UT:setFireRateMultiplier", this.enableFireRateMultiplier, this.fireRateMultiplier]);
            }
            this.settingsStore.setSetting("enable-fire-rate-multiplier", this.enableFireRateMultiplier);
            this.settingsStore.setSetting("fire-rate-multiplier", this.fireRateMultiplier);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        setDamageMultiplier(saveSettings = true) {
            if (this.mainStore.isInHeist && ((this.enableDamageMultiplier && this.damageMultiplier) || !this.enableDamageMultiplier)) {
                this.callStore.addCall(["UT:setDamageMultiplier", this.enableDamageMultiplier, this.damageMultiplier]);
            }
            this.settingsStore.setSetting("enable-damage-multiplier", this.enableDamageMultiplier);
            this.settingsStore.setSetting("damage-multiplier", this.damageMultiplier);
            if (saveSettings) {
                this.settingsStore.saveSettings();
            }
        },
        disableAllCheats() {
            this.enableGodMode = false;
            this.enableNoFallDamage = false;
            this.enableInfiniteStamina = false;
            this.enableCanRunDirectional = false;
            this.enableCanRunWithAnyBag = false;
            this.enableInstantMaskOn = false;
            this.enableNoCarryCooldown = false;
            this.enableNoFlashbangs = false;
            this.enableInstantInteraction = false;
            this.enableInstantDeployment = false;
            this.enableUnlimitedEquipment = false;
            this.enableInstantWeaponSwap = false;
            this.enableInstantWeaponReload = false;
            this.enableNoWeaponRecoil = false;
            this.enableNoWeaponSpread = false;
            this.enableShootThroughWalls = false;
            this.enableUnlimitedAmmo = false;
            this.enableNoSlowMotion = false;
            this.enableMoveSpeedMultiplier = false;
            this.enableThrowDistanceMultiplier = false;
            this.enableFireRateMultiplier = false;
            this.enableDamageMultiplier = false;

            this.setGodMode(false);
            this.setNoFallDamage(false);
            this.setInfiniteStamina(false);
            this.setCanRunDirectional(false);
            this.setCanRunWithAnyBag(false);
            this.setInstantMaskOn(false);
            this.setNoCarryCooldown(false);
            this.setNoFlashbangs(false);
            this.setInstantInteraction(false);
            this.setInstantDeployment(false);
            this.setUnlimitedEquipment(false);
            this.setInstantWeaponSwap(false);
            this.setInstantWeaponReload(false);
            this.setNoWeaponRecoil(false);
            this.setNoWeaponSpread(false);
            this.setShootThroughWalls(false);
            this.setUnlimitedAmmo(false);
            this.setNoSlowMotion(false);
            this.setMoveSpeedMultiplier(false);
            this.setThrowDistanceMultiplier(false);
            this.setFireRateMultiplier(false);
            this.setDamageMultiplier(false);

            this.settingsStore.saveSettings();
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
                            <input id="enable-god-mode" v-model="enableGodMode" class="form-check-input" type="checkbox" @change="setGodMode">
                            <label for="enable-god-mode" class="form-check-label">{{ $t("main.god_mode") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-fall-damage" v-model="enableNoFallDamage" class="form-check-input" type="checkbox" @change="setNoFallDamage">
                            <label for="enable-no-fall-damage" class="form-check-label">{{ $t("main.no_fall_damage") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-infinite-stamina" v-model="enableInfiniteStamina" class="form-check-input" type="checkbox" @change="setInfiniteStamina">
                            <label for="enable-infinite-stamina" class="form-check-label">{{ $t("main.infinite_stamina") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-can-run-directional" v-model="enableCanRunDirectional" class="form-check-input" type="checkbox" @change="setCanRunDirectional">
                            <label for="enable-can-run-directional" class="form-check-label">{{ $t("main.can_run_directional") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-can-run-with-any-bag" v-model="enableCanRunWithAnyBag" class="form-check-input" type="checkbox" @change="setCanRunWithAnyBag">
                            <label for="enable-can-run-with-any-bag" class="form-check-label">{{ $t("main.can_run_with_any_bag") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-mask-on" v-model="enableInstantMaskOn" class="form-check-input" type="checkbox" @change="setInstantMaskOn">
                            <label for="enable-instant-mask-on" class="form-check-label">{{ $t("main.instant_mask_on") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-carry-cooldown" v-model="enableNoCarryCooldown" class="form-check-input" type="checkbox" @change="setNoCarryCooldown">
                            <label for="enable-no-carry-cooldown" class="form-check-label">{{ $t("main.no_carry_cooldown") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-flashbangs" v-model="enableNoFlashbangs" class="form-check-input" type="checkbox" @change="setNoFlashbangs">
                            <label for="enable-no-flashbangs" class="form-check-label">{{ $t("main.no_flashbangs") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-interaction" v-model="enableInstantInteraction" class="form-check-input" type="checkbox" @change="setInstantInteraction">
                            <label for="enable-instant-interaction" class="form-check-label">{{ $t("main.instant_interaction") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-deployment" v-model="enableInstantDeployment" class="form-check-input" type="checkbox" @change="setInstantDeployment">
                            <label for="enable-instant-deployment" class="form-check-label">{{ $t("main.instant_deployment") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-unlimited-equipment" v-model="enableUnlimitedEquipment" class="form-check-input" type="checkbox" @change="setUnlimitedEquipment">
                            <label for="enable-unlimited-equipment" class="form-check-label">{{ $t("main.unlimited_equipment") }}</label>
                            <AntiCheatDetectedIcon class="ms-3" />
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-weapon-swap" v-model="enableInstantWeaponSwap" class="form-check-input" type="checkbox" @change="setInstantWeaponSwap">
                            <label for="enable-instant-weapon-swap" class="form-check-label">{{ $t("main.instant_weapon_swap") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-instant-weapon-reload" v-model="enableInstantWeaponReload" class="form-check-input" type="checkbox" @change="setInstantWeaponReload">
                            <label for="enable-instant-weapon-reload" class="form-check-label">{{ $t("main.instant_weapon_reload") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-weapon-recoil" v-model="enableNoWeaponRecoil" class="form-check-input" type="checkbox" @change="setNoWeaponRecoil">
                            <label for="enable-no-weapon-recoil" class="form-check-label">{{ $t("main.no_weapon_recoil") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-weapon-spread" v-model="enableNoWeaponSpread" class="form-check-input" type="checkbox" @change="setNoWeaponSpread">
                            <label for="enable-no-weapon-spread" class="form-check-label">{{ $t("main.no_weapon_spread") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-shoot-through-walls" v-model="enableShootThroughWalls" class="form-check-input" type="checkbox" @change="setShootThroughWalls">
                            <label for="enable-shoot-through-walls" class="form-check-label">{{ $t("main.shoot_through_walls") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-unlimited-ammo" v-model="enableUnlimitedAmmo" class="form-check-input" type="checkbox" @change="setUnlimitedAmmo">
                            <label for="enable-unlimited-ammo" class="form-check-label">{{ $t("main.unlimited_ammo") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="form-check form-switch">
                            <input id="enable-no-slow-motion" v-model="enableNoSlowMotion" class="form-check-input" type="checkbox" @change="setNoSlowMotion">
                            <label for="enable-no-slow-motion" class="form-check-label">{{ $t("main.no_slow_motion") }}</label>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="row">
                            <div class="col-10">
                                <div class="form-check form-switch">
                                    <input id="enable-move-speed-multiplier" v-model="enableMoveSpeedMultiplier" class="form-check-input" type="checkbox" @change="setMoveSpeedMultiplier">
                                    <label for="enable-move-speed-multiplier" class="form-check-label">{{ $t("main.move_speed_multiplier") }}</label>
                                </div>
                            </div>
                            <div class="col-2">
                                <input v-model="moveSpeedMultiplier" type="number" class="form-control form-control-sm border-0 shadow-none bg-transparent text-reset text-end" min="1" step="1" @change="setMoveSpeedMultiplier">
                            </div>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="row">
                            <div class="col-10">
                                <div class="form-check form-switch">
                                    <input id="enable-throw-distance-multiplier" v-model="enableThrowDistanceMultiplier" class="form-check-input" type="checkbox" @change="setThrowDistanceMultiplier">
                                    <label for="enable-throw-distance-multiplier" class="form-check-label">{{ $t("main.throw_distance_multiplier") }}</label>
                                </div>
                            </div>
                            <div class="col-2">
                                <input v-model="throwDistanceMultiplier" type="number" class="form-control form-control-sm border-0 shadow-none bg-transparent text-reset text-end" min="1" step="1" @change="setThrowDistanceMultiplier">
                            </div>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="row">
                            <div class="col-10">
                                <div class="form-check form-switch">
                                    <input id="enable-fire-rate-multiplier" v-model="enableFireRateMultiplier" class="form-check-input" type="checkbox" @change="setFireRateMultiplier">
                                    <label for="enable-fire-rate-multiplier" class="form-check-label">{{ $t("main.fire_rate_multiplier") }}</label>
                                </div>
                            </div>
                            <div class="col-2">
                                <input v-model="fireRateMultiplier" type="number" class="form-control form-control-sm border-0 shadow-none bg-transparent text-reset text-end" min="1" step="1" @change="setFireRateMultiplier">
                            </div>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="row">
                            <div class="col-10">
                                <div class="form-check form-switch">
                                    <input id="enable-damage-multiplier" v-model="enableDamageMultiplier" class="form-check-input" type="checkbox" @change="setDamageMultiplier">
                                    <label for="enable-damage-multiplier" class="form-check-label">{{ $t("main.damage_multiplier") }}</label>
                                </div>
                            </div>
                            <div class="col-2">
                                <input v-model="damageMultiplier" type="number" class="form-control form-control-sm border-0 shadow-none bg-transparent text-reset text-end" min="1" step="1" @change="setDamageMultiplier">
                            </div>
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary" @click="disableAllCheats">{{ $t("main.disable_all_cheats") }}</button>
            </div>
        </div>
    </div>
</template>
