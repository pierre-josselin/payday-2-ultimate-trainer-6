<script>
import NavBar from "@/components/NavBar.vue";
import AntiCheatDetectedIcon from "@/components/icons/AntiCheatDetectedIcon.vue";

import { useMainStore } from "@/stores/main";
import { useSettingsStore } from "@/stores/settings";
import { useCallStore } from "@/stores/calls";
import { useSpawnStore } from "@/stores/spawn";

import cop1EnemyImagePath from "@/assets/images/enemies/cop-1.jpg";
import cop2EnemyImagePath from "@/assets/images/enemies/cop-2.jpg";
import cop3EnemyImagePath from "@/assets/images/enemies/cop-3.jpg";
import cop4EnemyImagePath from "@/assets/images/enemies/cop-4.jpg";
import fbi1EnemyImagePath from "@/assets/images/enemies/fbi-1.jpg";
import fbi2EnemyImagePath from "@/assets/images/enemies/fbi-2.jpg";
import fbi3EnemyImagePath from "@/assets/images/enemies/fbi-3.jpg";
import fbiHeavyEnemyImagePath from "@/assets/images/enemies/fbi-heavy.jpg";
import fbiSwat1EnemyImagePath from "@/assets/images/enemies/fbi-swat-1.jpg";
import fbiSwat2EnemyImagePath from "@/assets/images/enemies/fbi-swat-2.jpg";
import swatHeavyEnemyImagePath from "@/assets/images/enemies/swat-heavy.jpg";
import shield1EnemyImagePath from "@/assets/images/enemies/shield-1.jpg";
import shield2EnemyImagePath from "@/assets/images/enemies/shield-2.jpg";
import tazerEnemyImagePath from "@/assets/images/enemies/tazer.jpg";
import sniper1EnemyImagePath from "@/assets/images/enemies/sniper-1.jpg";
import sniper2EnemyImagePath from "@/assets/images/enemies/sniper-2.jpg";
import cloackerEnemyImagePath from "@/assets/images/enemies/cloacker.jpg";
import medicEnemyImagePath from "@/assets/images/enemies/medic.jpg";
import bulldozer1EnemyImagePath from "@/assets/images/enemies/bulldozer-1.jpg";
import bulldozer2EnemyImagePath from "@/assets/images/enemies/bulldozer-2.jpg";
import bulldozer3EnemyImagePath from "@/assets/images/enemies/bulldozer-3.jpg";
import bulldozerMedicEnemyImagePath from "@/assets/images/enemies/bulldozer-medic.jpg";
import bulldozerMinigunEnemyImagePath from "@/assets/images/enemies/bulldozer-minigun.jpg";

import greenMantisGagePackageImagePath from "@/assets/images/gage-packages/green-mantis.jpg";
import yellowBullGagePackageImagePath from "@/assets/images/gage-packages/yellow-bull.jpg";
import redSpiderGagePackageImagePath from "@/assets/images/gage-packages/red-spider.jpg";
import blueEagleGagePackageImagePath from "@/assets/images/gage-packages/blue-eagle.jpg";
import purpleSnakeGagePackageImagePath from "@/assets/images/gage-packages/purple-snake.jpg";

import ammoBagEquipmentImagePath from "@/assets/images/equipment/ammo-bag.png";
import doctorBagEquipmentImagePath from "@/assets/images/equipment/doctor-bag.png";
import firstAidKitEquipmentImagePath from "@/assets/images/equipment/first-aid-kit.png";
import ordnanceBagEquipmentImagePath from "@/assets/images/equipment/ordnance-bag.png";
import bodyBagCaseEquipmentImagePath from "@/assets/images/equipment/body-bag-case.png";
import ecmJammerEquipmentImagePath from "@/assets/images/equipment/ecm-jammer.png";
import tripMineEquipmentImagePath from "@/assets/images/equipment/trip-mine.png";
import sentryGunEquipmentImagePath from "@/assets/images/equipment/sentry-gun.png";
import suppressedSentryGunEquipmentImagePath from "@/assets/images/equipment/suppressed-sentry-gun.png";

import fragGrenadeExplosionImagePath from "@/assets/images/explosions/frag-grenade.png";
import viperGrenadeExplosionImagePath from "@/assets/images/explosions/viper-grenade.png";
import molotovCocktailExplosionImagePath from "@/assets/images/explosions/molotov-cocktail.png";
import x1ZapperExplosionImagePath from "@/assets/images/explosions/x1-zapper.png";

export default {
    components: {
        NavBar,
        AntiCheatDetectedIcon
    },
    data() {
        return {
            categories: [
                {
                    id: "enemies",
                    elementId: "category-enemies",
                    label: "main.enemies",
                    units: [
                        {
                            id: "units/payday2/characters/ene_cop_1/ene_cop_1",
                            imagePath: cop1EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_cop_2/ene_cop_2",
                            imagePath: cop2EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_cop_3/ene_cop_3",
                            imagePath: cop3EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_cop_4/ene_cop_4",
                            imagePath: cop4EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_fbi_1/ene_fbi_1",
                            imagePath: fbi1EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_fbi_2/ene_fbi_2",
                            imagePath: fbi2EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_fbi_3/ene_fbi_3",
                            imagePath: fbi3EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
                            imagePath: fbiHeavyEnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1",
                            imagePath: fbiSwat1EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2",
                            imagePath: fbiSwat2EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1",
                            imagePath: swatHeavyEnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_shield_1/ene_shield_1",
                            imagePath: shield1EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_shield_2/ene_shield_2",
                            imagePath: shield2EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_tazer_1/ene_tazer_1",
                            imagePath: tazerEnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_sniper_1/ene_sniper_1",
                            imagePath: sniper1EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_sniper_2/ene_sniper_2",
                            imagePath: sniper2EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_spook_1/ene_spook_1",
                            imagePath: cloackerEnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_medic_m4/ene_medic_m4",
                            imagePath: medicEnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1",
                            imagePath: bulldozer1EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2",
                            imagePath: bulldozer2EnemyImagePath
                        },
                        {
                            id: "units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3",
                            imagePath: bulldozer3EnemyImagePath
                        },
                        {
                            id: "units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic",
                            imagePath: bulldozerMedicEnemyImagePath
                        },
                        {
                            id: "units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
                            imagePath: bulldozerMinigunEnemyImagePath
                        }
                    ]
                },
                {
                    id: "gage-packages",
                    elementId: "category-gage-packages",
                    label: "main.gage_packages",
                    units: [
                        {
                            id: "units/pd2_dlc_gage_jobs/pickups/gen_pku_gage_green/gen_pku_gage_green",
                            imagePath: greenMantisGagePackageImagePath
                        },
                        {
                            id: "units/pd2_dlc_gage_jobs/pickups/gen_pku_gage_yellow/gen_pku_gage_yellow",
                            imagePath: yellowBullGagePackageImagePath
                        },
                        {
                            id: "units/pd2_dlc_gage_jobs/pickups/gen_pku_gage_red/gen_pku_gage_red",
                            imagePath: redSpiderGagePackageImagePath
                        },
                        {
                            id: "units/pd2_dlc_gage_jobs/pickups/gen_pku_gage_blue/gen_pku_gage_blue",
                            imagePath: blueEagleGagePackageImagePath
                        },
                        {
                            id: "units/pd2_dlc_gage_jobs/pickups/gen_pku_gage_purple/gen_pku_gage_purple",
                            imagePath: purpleSnakeGagePackageImagePath
                        }
                    ]
                },
                {
                    id: "equipment",
                    elementId: "category-equipment",
                    label: "main.equipment",
                    units: [
                        {
                            id: "ammo-bag",
                            imagePath: ammoBagEquipmentImagePath
                        },
                        {
                            id: "doctor-bag",
                            imagePath: doctorBagEquipmentImagePath
                        },
                        {
                            id: "first-aid-kit",
                            imagePath: firstAidKitEquipmentImagePath
                        },
                        {
                            id: "ordnance-bag",
                            imagePath: ordnanceBagEquipmentImagePath
                        },
                        {
                            id: "body-bag-case",
                            imagePath: bodyBagCaseEquipmentImagePath
                        },
                        {
                            id: "ecm-jammer",
                            imagePath: ecmJammerEquipmentImagePath
                        },
                        {
                            id: "trip-mine",
                            imagePath: tripMineEquipmentImagePath
                        },
                        {
                            id: "sentry-gun",
                            imagePath: sentryGunEquipmentImagePath
                        },
                        {
                            id: "suppressed-sentry-gun",
                            imagePath: suppressedSentryGunEquipmentImagePath
                        }
                    ]
                },
                {
                    id: "explosions",
                    elementId: "category-explosions",
                    label: "main.explosions",
                    units: [
                        {
                            id: "units/payday2/weapons/wpn_frag_grenade/wpn_frag_grenade",
                            imagePath: fragGrenadeExplosionImagePath
                        },
                        {
                            id: "units/pd2_dlc_pxp1/weapons/wpn_fps_poison_gas_grenade/wpn_third_poison_gas_grenade",
                            imagePath: viperGrenadeExplosionImagePath
                        },
                        {
                            id: "units/pd2_dlc_bbq/weapons/molotov_cocktail/wpn_molotov_third",
                            imagePath: molotovCocktailExplosionImagePath
                        },
                        {
                            id: "units/pd2_dlc_sawp/weapons/wpn_launcher_electric/wpn_launcher_electric",
                            imagePath: x1ZapperExplosionImagePath
                        }
                    ]
                }
            ]
        };
    },
    created() {
        this.mainStore = useMainStore();
        this.settingsStore = useSettingsStore();
        this.callStore = useCallStore();
        this.spawnStore = useSpawnStore();

        if (this.spawnStore.categoryId === null) {
            this.spawnStore.categoryId = this.categories[0].id;
        }
        if (this.spawnStore.positionType === null) {
            this.spawnStore.positionType = "on-crosshair";
        }
        if (this.spawnStore.convertedEnemies === null) {
            this.spawnStore.convertedEnemies = false;
        }
    },
    methods: {
        setId(id) {
            this.spawnStore.id = id;
            this.setConfig();
        },
        setCategoryId(categoryId) {
            this.spawnStore.categoryId = categoryId;
            this.spawnStore.id = null;
            this.setConfig();
        },
        setConfig() {
            this.callStore.addCall(["UT.Spawn:setConfig", this.spawnStore.id, this.spawnStore.categoryId, this.spawnStore.positionType, this.spawnStore.convertedEnemies]);
        },
        isSpawnKeybindDefined() {
            if (!this.settingsStore.keybinds.length) {
                return false;
            }
            return this.settingsStore.keybinds.some(keybind => keybind.name === "spawn-spawn");
        }
    }
}
</script>

<template>
    <NavBar />

    <div class="container my-5">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                {{ $t("main.spawn") }}
                <button type="button" class="btn btn-link btn-sm popover-focus" data-bs-toggle="popover" :data-bs-title="$t('main.help')" :data-bs-content="$t('dialogs.spawn_help')">
                    <FontAwesomeIcon icon="fa-solid fa-question" />
                </button>
            </div>
            <fieldset class="card-body p-4" :class="{ disabled: !mainStore.isPlaying || !mainStore.isServer }" :disabled="!mainStore.isPlaying || !mainStore.isServer">
                <div class="alert alert-info" v-if="!isSpawnKeybindDefined()">{{ $t("dialogs.set_spawn_keybind") }}</div>
                <div class="mb-3">
                    <label class="form-label me-4">{{ $t("main.position") }}</label>
                    <div class="form-check form-check-inline">
                        <input id="position-type-on-crosshair" v-model="spawnStore.positionType" class="form-check-input" type="radio" name="position-type" value="on-crosshair" @change="setConfig">
                        <label for="position-type-on-crosshair" class="form-check-label">{{ $t("main.on_crosshair") }}</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input id="position-type-on-self" v-model="spawnStore.positionType" class="form-check-input" type="radio" name="position-type" value="on-self" @change="setConfig">
                        <label for="position-type-on-self" class="form-check-label">{{ $t("main.on_self") }}</label>
                    </div>
                </div>
                <nav>
                    <div class="nav nav-tabs">
                        <button v-for="category in categories" :key="category.id" class="nav-link" data-bs-toggle="tab" :class="{ active: category.id === spawnStore.categoryId }" :data-bs-target="`#${category.elementId}`" @click="setCategoryId(category.id)">
                            {{ $t(category.label) }}
                            <AntiCheatDetectedIcon v-if="category.id === 'equipment'" class="ms-3" />
                        </button>
                    </div>
                </nav>
                <div class="tab-content">
                    <div v-for="category in categories" :id="category.elementId" :key="category.id" class="tab-pane" :class="{ 'show active': category.id === spawnStore.categoryId }" tabindex="0">
                        <div v-if="category.id === 'enemies'" class="form-check form-switch mt-3">
                            <input id="converted-enemies" v-model="spawnStore.convertedEnemies" class="form-check-input" type="checkbox" @change="setConfig">
                            <label for="converted-enemies" class="form-check-label">{{ $t("main.converted_enemies") }}</label>
                        </div>
                        <div class="row row-cols-2  row-cols-sm-3  row-cols-md-4 row-cols-lg-5">
                            <div v-for="(unit, index) in category.units" :key="index" class="col mt-3" role="button" @click="setId(unit.id)">
                                <div :style="`background-image: url(${unit.imagePath})`" class="ratio ratio-1x1 border border-3 rounded shadow unit-image" :class="{ 'border-dark': unit.id !== spawnStore.id, 'border-success active': unit.id === spawnStore.id, 'equipment-image': category.id === 'equipment', 'explosion-image': category.id === 'explosions' }" />
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</template>

<style scoped>
.unit-image {
    -webkit-filter: grayscale(0.75);
    filter: grayscale(0.75);
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

.unit-image:hover,
.unit-image.active {
    -webkit-filter: grayscale(0);
    filter: none;
}

.equipment-image,
.explosion-image {
    background-color: #2d3436;
}

.equipment-image {
    background-size: 75%;
}

.explosion-image {
    background-size: 100%;
}
</style>
