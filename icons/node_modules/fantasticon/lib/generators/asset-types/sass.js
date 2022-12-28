"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const misc_1 = require("../../types/misc");
const template_1 = require("../../utils/template");
const css_1 = require("../../utils/css");
const generator = {
    dependsOn: misc_1.FontAssetType.SVG,
    generate: (options, svg) => (0, template_1.renderTemplate)(options.templates.sass, Object.assign(Object.assign({}, options), { fontSrc: (0, css_1.renderSrcAttribute)(options, svg) }))
};
exports.default = generator;
//# sourceMappingURL=sass.js.map