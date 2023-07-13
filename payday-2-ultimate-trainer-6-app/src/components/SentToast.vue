<script>
import Toast from "bootstrap/js/dist/toast";

import { useMainStore } from "@/stores/main";

export default {
    data() {
        return {
            sentToastInstance: null,
            firstCallAcknowledgmentIgnored: false
        };
    },
    created() {
        this.mainStore = useMainStore();

        this.$watch("mainStore.lastCallAcknowledgmentTime", (lastCallAcknowledgmentTime) => {
            if (lastCallAcknowledgmentTime !== null) {
                if (!this.firstCallAcknowledgmentIgnored) {
                    this.firstCallAcknowledgmentIgnored = true;
                    return;
                }
                this.sentToastInstance.show()
            }
        });
    },
    mounted() {
        const sentToastElement = document.getElementById("sent-toast");
        this.sentToastInstance = Toast.getOrCreateInstance(sentToastElement);
    }
}
</script>

<template>
    <div class="toast-container position-fixed bottom-0 start-0 p-3">
        <div id="sent-toast" class="toast bg-success" data-bs-delay="1500">
            <div class="toast-body">
                <FontAwesomeIcon icon="fa-solid fa-circle-check" />
                <span class="ms-2">{{ $t("main.sent") }}</span>
            </div>
        </div>
    </div>
</template>

<style scoped>
.toast {
    --bs-toast-max-width: unset;
}
</style>
