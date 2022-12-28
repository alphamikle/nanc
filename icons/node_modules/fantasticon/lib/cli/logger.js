"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getLogger = void 0;
const cli_color_1 = __importDefault(require("cli-color"));
const string_1 = require("../utils/string");
const getLogger = (debug = false, silent = false) => ({
    error(error) {
        const message = (error instanceof Error && error.message) || error;
        console.log(cli_color_1.default.red(message));
        debug && error instanceof Error && console.log(error.stack);
    },
    log(...values) {
        !silent && console.log(...values);
    },
    start(loadedConfigPath = null) {
        this.log(cli_color_1.default.yellow(`Generating font kit...`));
        if (loadedConfigPath) {
            this.log(cli_color_1.default.green(`✔ Using configuration file: ${cli_color_1.default.green.bold(loadedConfigPath)}`));
        }
    },
    results({ assetsIn, writeResults, options: { inputDir } }) {
        const iconsCount = Object.values(assetsIn).length;
        this.log(cli_color_1.default.white(`✔ ${iconsCount} ${(0, string_1.pluralize)('SVG', iconsCount)} found in ${inputDir}`));
        for (const { writePath } of writeResults) {
            this.log(cli_color_1.default.blue(`✔ Generated`, cli_color_1.default.blueBright(writePath)));
        }
        this.log(cli_color_1.default.green.bold('Done'));
    }
});
exports.getLogger = getLogger;
//# sourceMappingURL=logger.js.map