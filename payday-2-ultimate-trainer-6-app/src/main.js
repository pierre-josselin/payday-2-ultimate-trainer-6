import { createApp } from "vue";
import { createPinia } from "pinia";

import { library } from "@fortawesome/fontawesome-svg-core";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { faRightFromBracket, faTriangleExclamation, faBug, faPlay, faRotateRight, faFlag, faPersonRunning, faKey, faGear, faQuestion } from "@fortawesome/free-solid-svg-icons";
import { faGithub } from "@fortawesome/free-brands-svg-icons";

import App from "@/App.vue";
import i18n from "@/i18n";
import router from "@/router";

library.add(faRightFromBracket, faTriangleExclamation, faBug, faPlay, faRotateRight, faFlag, faPersonRunning, faKey, faGear, faQuestion, faGithub);

Object.defineProperty(String.prototype, "capitalize", {
    value: function () {
        return this.charAt(0).toUpperCase() + this.slice(1);
    },
    enumerable: false
});

const app = createApp(App);
const pinia = createPinia();

app.use(pinia);
app.use(i18n);
app.use(router);

app.component("FontAwesomeIcon", FontAwesomeIcon);

app.mount("#app");
