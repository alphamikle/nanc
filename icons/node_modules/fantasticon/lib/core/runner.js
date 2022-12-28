"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.generateFonts = exports.sanitiseOptions = void 0;
const constants_1 = require("../constants");
const assets_1 = require("../utils/assets");
const generator_options_1 = require("../generators/generator-options");
const config_parser_1 = require("./config-parser");
const generators_1 = require("../generators");
const sanitiseOptions = (userOptions) => (0, config_parser_1.parseConfig)(Object.assign(Object.assign({}, constants_1.DEFAULT_OPTIONS), userOptions));
exports.sanitiseOptions = sanitiseOptions;
const generateFonts = (userOptions, mustWrite = false) => __awaiter(void 0, void 0, void 0, function* () {
    const options = yield (0, exports.sanitiseOptions)(userOptions);
    const { outputDir, inputDir } = options;
    if (!inputDir) {
        throw new Error('You must specify an input directory');
    }
    if (mustWrite && !outputDir) {
        throw new Error('You must specify an output directory');
    }
    const assetsIn = yield (0, assets_1.loadAssets)(options);
    const generatorOptions = (0, generator_options_1.getGeneratorOptions)(options, assetsIn);
    const assetsOut = yield (0, generators_1.generateAssets)(generatorOptions);
    const writeResults = outputDir ? yield (0, assets_1.writeAssets)(assetsOut, options) : [];
    const { codepoints } = generatorOptions;
    return {
        options,
        assetsIn,
        assetsOut,
        writeResults,
        codepoints
    };
});
exports.generateFonts = generateFonts;
//# sourceMappingURL=runner.js.map