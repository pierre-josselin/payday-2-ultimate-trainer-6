import { createApp } from "vue";
import { createPinia } from "pinia";

import { library } from "@fortawesome/fontawesome-svg-core";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { faRightFromBracket, faTriangleExclamation, faBug, faPlay, faRotateRight, faFlag, faPersonRunning } from "@fortawesome/free-solid-svg-icons";
import { faGithub } from "@fortawesome/free-brands-svg-icons";

import App from "@/App.vue";
import i18n from "@/i18n";
import router from "@/router";

library.add(faRightFromBracket, faTriangleExclamation, faBug, faPlay, faRotateRight, faFlag, faPersonRunning, faGithub);

const app = createApp(App);
const pinia = createPinia();

app.use(pinia);
app.use(i18n);
app.use(router);

app.component("FontAwesomeIcon", FontAwesomeIcon);

app.mount("#app");
