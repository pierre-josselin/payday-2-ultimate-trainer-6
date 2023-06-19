/* eslint-env node */
module.exports = {
    root: true,
    extends: [
        "plugin:vue/vue3-essential",
        "plugin:vue/vue3-recommended",
        "plugin:vue/vue3-strongly-recommended",
        "eslint:recommended"
    ],
    parserOptions: {
        ecmaVersion: "latest"
    },
    rules: {
        "vue/html-indent": "off",
        "vue/max-attributes-per-line": "off",
        "vue/require-default-prop": "off",
        "vue/singleline-html-element-content-newline": "off",
        "no-unused-vars": "off"
    }
}
