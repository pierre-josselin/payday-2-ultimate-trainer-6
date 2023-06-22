<script>
import { useCallStore } from "@/stores/calls";

import NavBar from "@/components/NavBar.vue";

export default {
    components: {
        NavBar
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
    },
    methods: {
        setGodMode() {
            this.callStore.addCall(["UT:setGodMode", this.enableGodMode]);
            console.log(this.enableGodMode)
        },
        setInfiniteStamina() {
            this.callStore.addCall(["UT:setInfiniteStamina", this.enableInfiniteStamina]);
        },
        setCanRunDirectional() {
            this.callStore.addCall(["UT:setCanRunDirectional", this.enableCanRunDirectional]);
        },
        setCanRunWithAnyBag() {
            this.callStore.addCall(["UT:setCanRunWithAnyBag", this.enableCanRunWithAnyBag]);
        },
        setInstantMaskOn() {
            this.callStore.addCall(["UT:setInstantMaskOn", this.enableInstantMaskOn]);
        },
        setNoCarryCooldown() {
            this.callStore.addCall(["UT:setNoCarryCooldown", this.enableNoCarryCooldown]);
        },
        setNoFlashbangs() {
            this.callStore.addCall(["UT:setNoFlashbangs", this.enableNoFlashbangs]);
        },
        setInstantInteraction() {
            this.callStore.addCall(["UT:setInstantInteraction", this.enableInstantInteraction]);
        },
        setInstantDeployment() {
            this.callStore.addCall(["UT:setInstantDeployment", this.enableInstantDeployment]);
        },
        setUnlimitedEquipment() {
            this.callStore.addCall(["UT:setUnlimitedEquipment", this.enableUnlimitedEquipment]);
        },
        setInstantWeaponSwap() {
            this.callStore.addCall(["UT:setInstantWeaponSwap", this.enableInstantWeaponSwap]);
        },
        setInstantWeaponReload() {
            this.callStore.addCall(["UT:setInstantWeaponReload", this.enableInstantWeaponReload]);
        },
        setNoWeaponRecoil() {
            this.callStore.addCall(["UT:setNoWeaponRecoil", this.enableNoWeaponRecoil]);
        },
        setNoWeaponSpread() {
            this.callStore.addCall(["UT:setNoWeaponSpread", this.enableNoWeaponSpread]);
        },
        setShootThroughWalls() {
            this.callStore.addCall(["UT:setShootThroughWalls", this.enableShootThroughWalls]);
        },
        setUnlimitedAmmo() {
            this.callStore.addCall(["UT:setUnlimitedAmmo", this.enableUnlimitedAmmo]);
        },
        setMoveSpeedMultiplier() {
            if (this.moveSpeedMultiplier) {
                this.callStore.addCall(["UT:setMoveSpeedMultiplier", this.enableMoveSpeedMultiplier, this.moveSpeedMultiplier]);
            }
        },
        setThrowDistanceMultiplier() {
            if (this.throwDistanceMultiplier) {
                this.callStore.addCall(["UT:setThrowDistanceMultiplier", this.enableThrowDistanceMultiplier, this.throwDistanceMultiplier]);
            }
        },
        setFireRateMultiplier() {
            if (this.fireRateMultiplier) {
                this.callStore.addCall(["UT:setFireRateMultiplier", this.enableFireRateMultiplier, this.fireRateMultiplier]);
            }
        },
        setDamageMultiplier() {
            if (this.damageMultiplier) {
                this.callStore.addCall(["UT:setDamageMultiplier", this.enableDamageMultiplier, this.damageMultiplier]);
            }
        }
    }
}
</script>

<template>
    <NavBar />

    <div style="max-width: 1000px;" class="container my-5">
        <div class="card p-3">
            <div class="card-body">
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
            </div>
        </div>
    </div>
</template>
