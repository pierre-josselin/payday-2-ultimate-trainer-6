<script>
import NavBar from "@/components/NavBar.vue";

import { useCallStore } from "@/stores/calls";
import { useSpawnStore } from "@/stores/spawn";

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
                            imagePath: "/src/assets/enemies/cop-1.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_cop_2/ene_cop_2",
                            imagePath: "/src/assets/enemies/cop-2.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_cop_3/ene_cop_3",
                            imagePath: "/src/assets/enemies/cop-3.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_cop_4/ene_cop_4",
                            imagePath: "/src/assets/enemies/cop-4.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_fbi_1/ene_fbi_1",
                            imagePath: "/src/assets/enemies/fbi-1.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_fbi_2/ene_fbi_2",
                            imagePath: "/src/assets/enemies/fbi-2.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_fbi_3/ene_fbi_3",
                            imagePath: "/src/assets/enemies/fbi-3.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
                            imagePath: "/src/assets/enemies/fbi-heavy.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1",
                            imagePath: "/src/assets/enemies/fbi-swat-1.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2",
                            imagePath: "/src/assets/enemies/fbi-swat-2.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1",
                            imagePath: "/src/assets/enemies/swat-heavy.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_shield_1/ene_shield_1",
                            imagePath: "/src/assets/enemies/shield-1.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_shield_2/ene_shield_2",
                            imagePath: "/src/assets/enemies/shield-2.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_tazer_1/ene_tazer_1",
                            imagePath: "/src/assets/enemies/tazer.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_sniper_1/ene_sniper_1",
                            imagePath: "/src/assets/enemies/sniper-1.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_sniper_2/ene_sniper_2",
                            imagePath: "/src/assets/enemies/sniper-2.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_spook_1/ene_spook_1",
                            imagePath: "/src/assets/enemies/cloacker.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_medic_m4/ene_medic_m4",
                            imagePath: "/src/assets/enemies/medic.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1",
                            imagePath: "/src/assets/enemies/bulldozer-1.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2",
                            imagePath: "/src/assets/enemies/bulldozer-2.jpg"
                        },
                        {
                            id: "units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3",
                            imagePath: "/src/assets/enemies/bulldozer-3.jpg"
                        },
                        {
                            id: "units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic",
                            imagePath: "/src/assets/enemies/bulldozer-medic.jpg"
                        },
                        {
                            id: "units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
                            imagePath: "/src/assets/enemies/bulldozer-minigun.jpg"
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
                            imagePath: "/src/assets/gage-packages/green-mantis.jpg"
                        },
                        {
                            id: "units/pd2_dlc_gage_jobs/pickups/gen_pku_gage_yellow/gen_pku_gage_yellow",
                            imagePath: "/src/assets/gage-packages/yellow-bull.jpg"
                        },
                        {
                            id: "units/pd2_dlc_gage_jobs/pickups/gen_pku_gage_red/gen_pku_gage_red",
                            imagePath: "/src/assets/gage-packages/red-spider.jpg"
                        },
                        {
                            id: "units/pd2_dlc_gage_jobs/pickups/gen_pku_gage_blue/gen_pku_gage_blue",
                            imagePath: "/src/assets/gage-packages/blue-eagle.jpg"
                        },
                        {
                            id: "units/pd2_dlc_gage_jobs/pickups/gen_pku_gage_purple/gen_pku_gage_purple",
                            imagePath: "/src/assets/gage-packages/purple-snake.jpg"
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
                            imagePath: "/src/assets/equipment/ammo-bag.png"
                        },
                        {
                            id: "doctor-bag",
                            imagePath: "/src/assets/equipment/doctor-bag.png"
                        },
                        {
                            id: "first-aid-kit",
                            imagePath: "/src/assets/equipment/first-aid-kit.png"
                        },
                        {
                            id: "ordnance-bag",
                            imagePath: "/src/assets/equipment/ordnance-bag.png"
                        },
                        {
                            id: "body-bag-case",
                            imagePath: "/src/assets/equipment/body-bag-case.png"
                        },
                        {
                            id: "ecm-jammer",
                            imagePath: "/src/assets/equipment/ecm-jammer.png"
                        },
                        {
                            id: "trip-mine",
                            imagePath: "/src/assets/equipment/trip-mine.png"
                        },
                        {
                            id: "sentry-gun",
                            imagePath: "/src/assets/equipment/sentry-gun.png"
                        },
                        {
                            id: "suppressed-sentry-gun",
                            imagePath: "/src/assets/equipment/suppressed-sentry-gun.png"
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
                        <input id="position-type-on-crosshair" class="form-check-input" type="radio" name="position-type" value="on-crosshair" v-model="spawnStore.positionType">
                        <label for="position-type-on-crosshair" class="form-check-label">{{ $t("main.on_crosshair") }}</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input id="position-type-on-self" class="form-check-input" type="radio" name="position-type" value="on-self" v-model="spawnStore.positionType">
                        <label for="position-type-on-self" class="form-check-label">{{ $t("main.on_self") }}</label>
                    </div>
                </div>
                <div class="mb-3">
                    <nav>
                        <div class="nav nav-tabs">
                            <button class="nav-link" data-bs-toggle="tab" v-for="category in categories" :key="category.id" :class="{ active: category.id === spawnStore.categoryId }" :data-bs-target="`#${category.elementId}`" @click="setCategoryId(category.id)">{{ $t(category.label) }}</button>
                        </div>
                    </nav>
                    <div class="tab-content">
                        <div class="tab-pane pt-4" v-for="category in categories" :id="category.elementId" :class="{ 'show active': category.id === spawnStore.categoryId }" tabindex="0">
                            <div class="form-check form-switch mb-3" v-if="category.id === 'enemies'">
                                <input id="converted-enemies" class="form-check-input" type="checkbox" v-model="spawnStore.convertedEnemies">
                                <label for="converted-enemies" class="form-check-label">{{ $t("main.converted_enemies") }}</label>
                            </div>
                            <div class="row row-cols-5">
                                <div class="col mb-4" role="button" v-for="(unit, index) in category.units" :key="index" @click="setId(unit.id)">
                                    <div :style="`background-image: url(${unit.imagePath})`" class="ratio ratio-1x1 border border-3 rounded shadow unit-image" :class="{ 'border-dark': unit.id !== spawnStore.id, 'border-success active': unit.id === spawnStore.id, 'equipment-image': category.id === 'equipment' }"></div>
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
