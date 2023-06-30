<script>
import NavBar from "@/components/NavBar.vue";

import { useCallStore } from "@/stores/calls";
import { useSpawnStore } from "@/stores/spawn";

import cop1EnemyImagePath from "@/assets/enemies/cop-1.jpg";
import cop2EnemyImagePath from "@/assets/enemies/cop-2.jpg";
import cop3EnemyImagePath from "@/assets/enemies/cop-3.jpg";
import cop4EnemyImagePath from "@/assets/enemies/cop-4.jpg";
import fbi1EnemyImagePath from "@/assets/enemies/fbi-1.jpg";
import fbi2EnemyImagePath from "@/assets/enemies/fbi-2.jpg";
import fbi3EnemyImagePath from "@/assets/enemies/fbi-3.jpg";
import fbiHeavyEnemyImagePath from "@/assets/enemies/fbi-heavy.jpg";
import fbiSwat1EnemyImagePath from "@/assets/enemies/fbi-swat-1.jpg";
import fbiSwat2EnemyImagePath from "@/assets/enemies/fbi-swat-2.jpg";
import swatHeavyEnemyImagePath from "@/assets/enemies/swat-heavy.jpg";
import shield1EnemyImagePath from "@/assets/enemies/shield-1.jpg";
import shield2EnemyImagePath from "@/assets/enemies/shield-2.jpg";
import tazerEnemyImagePath from "@/assets/enemies/tazer.jpg";
import sniper1EnemyImagePath from "@/assets/enemies/sniper-1.jpg";
import sniper2EnemyImagePath from "@/assets/enemies/sniper-2.jpg";
import cloackerEnemyImagePath from "@/assets/enemies/cloacker.jpg";
import medicEnemyImagePath from "@/assets/enemies/medic.jpg";
import bulldozer1EnemyImagePath from "@/assets/enemies/bulldozer-1.jpg";
import bulldozer2EnemyImagePath from "@/assets/enemies/bulldozer-2.jpg";
import bulldozer3EnemyImagePath from "@/assets/enemies/bulldozer-3.jpg";
import bulldozerMedicEnemyImagePath from "@/assets/enemies/bulldozer-medic.jpg";
import bulldozerMinigunEnemyImagePath from "@/assets/enemies/bulldozer-minigun.jpg";

import greenMantisGagePackageImagePath from "@/assets/gage-packages/green-mantis.jpg";
import yellowBullGagePackageImagePath from "@/assets/gage-packages/yellow-bull.jpg";
import redSpiderGagePackageImagePath from "@/assets/gage-packages/red-spider.jpg";
import blueEagleGagePackageImagePath from "@/assets/gage-packages/blue-eagle.jpg";
import purpleSnakeGagePackageImagePath from "@/assets/gage-packages/purple-snake.jpg";

import ammoBagEquipmentImagePath from "@/assets/equipment/ammo-bag.png";
import doctorBagEnemyImagePath from "@/assets/equipment/doctor-bag.png";
import firstAidKitEnemyImagePath from "@/assets/equipment/first-aid-kit.png";
import ordnanceBagEnemyImagePath from "@/assets/equipment/ordnance-bag.png";
import bodyBagCaseEnemyImagePath from "@/assets/equipment/body-bag-case.png";
import ecmJammerEnemyImagePath from "@/assets/equipment/ecm-jammer.png";
import tripMineEnemyImagePath from "@/assets/equipment/trip-mine.png";
import sentryGunEnemyImagePath from "@/assets/equipment/sentry-gun.png";
import suppressedSentryGunEnemyImagePath from "@/assets/equipment/suppressed-sentry-gun.png";

export default {
    components: {
        NavBar
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
                            imagePath: doctorBagEnemyImagePath
                        },
                        {
                            id: "first-aid-kit",
                            imagePath: firstAidKitEnemyImagePath
                        },
                        {
                            id: "ordnance-bag",
                            imagePath: ordnanceBagEnemyImagePath
                        },
                        {
                            id: "body-bag-case",
                            imagePath: bodyBagCaseEnemyImagePath
                        },
                        {
                            id: "ecm-jammer",
                            imagePath: ecmJammerEnemyImagePath
                        },
                        {
                            id: "trip-mine",
                            imagePath: tripMineEnemyImagePath
                        },
                        {
                            id: "sentry-gun",
                            imagePath: sentryGunEnemyImagePath
                        },
                        {
                            id: "suppressed-sentry-gun",
                            imagePath: suppressedSentryGunEnemyImagePath
                        }
                    ]
                }
            ]
        };
    },
    created() {
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

        this.$watch("spawnStore.id", this.setConfig);
        this.$watch("spawnStore.categoryId", this.setConfig);
        this.$watch("spawnStore.positionType", this.setConfig);
        this.$watch("spawnStore.convertedEnemies", this.setConfig);
    },
    methods: {
        setId(id) {
            this.spawnStore.id = id;
        },
        setCategoryId(categoryId) {
            this.spawnStore.categoryId = categoryId;
        },
        setPositionType(positionType) {
            this.spawnStore.positionType = positionType;
        },
        setConfig() {
            this.callStore.addCall(["UT.Spawn:setConfig", this.spawnStore.id, this.spawnStore.categoryId, this.spawnStore.positionType, this.spawnStore.convertedEnemies]);
        }
    }
}
</script>

<template>
    <NavBar />

    <div class="container my-5">
        <div class="card">
            <div class="card-header">{{ $t("main.spawn") }}</div>
            <div class="card-body p-4">
                <div class="mb-3">
                    <label class="form-label me-4">{{ $t("main.position") }}</label>
                    <div class="form-check form-check-inline">
                        <input id="position-type-on-crosshair" v-model="spawnStore.positionType" class="form-check-input" type="radio" name="position-type" value="on-crosshair">
                        <label for="position-type-on-crosshair" class="form-check-label">{{ $t("main.on_crosshair") }}</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input id="position-type-on-self" v-model="spawnStore.positionType" class="form-check-input" type="radio" name="position-type" value="on-self">
                        <label for="position-type-on-self" class="form-check-label">{{ $t("main.on_self") }}</label>
                    </div>
                </div>
                <div class="mb-3">
                    <nav>
                        <div class="nav nav-tabs">
                            <button v-for="category in categories" :key="category.id" class="nav-link" data-bs-toggle="tab" :class="{ active: category.id === spawnStore.categoryId }" :data-bs-target="`#${category.elementId}`" @click="setCategoryId(category.id)">{{ $t(category.label) }}</button>
                        </div>
                    </nav>
                    <div class="tab-content">
                        <div v-for="category in categories" :id="category.elementId" class="tab-pane pt-4" :class="{ 'show active': category.id === spawnStore.categoryId }" tabindex="0">
                            <div v-if="category.id === 'enemies'" class="form-check form-switch mb-3">
                                <input id="converted-enemies" v-model="spawnStore.convertedEnemies" class="form-check-input" type="checkbox">
                                <label for="converted-enemies" class="form-check-label">{{ $t("main.converted_enemies") }}</label>
                            </div>
                            <div class="row row-cols-5">
                                <div v-for="(unit, index) in category.units" :key="index" class="col mb-4" role="button" @click="setId(unit.id)">
                                    <div :style="`background-image: url(${unit.imagePath})`" class="ratio ratio-1x1 border border-3 rounded shadow unit-image" :class="{ 'border-dark': unit.id !== spawnStore.id, 'border-success active': unit.id === spawnStore.id, 'equipment-image': category.id === 'equipment' }" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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

.equipment-image {
    background-color: #2d3436;
    background-size: 75%;
}
</style>
