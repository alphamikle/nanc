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
exports.parseConfig = void 0;
const constants_1 = require("../constants");
const validation_1 = require("../utils/validation");
const misc_1 = require("../types/misc");
const CONFIG_VALIDATORS = {
    inputDir: [(0, validation_1.optional)(validation_1.parseString), (0, validation_1.optional)(validation_1.parseDir)],
    outputDir: [(0, validation_1.optional)(validation_1.parseString), (0, validation_1.optional)(validation_1.parseDir)],
    name: [(0, validation_1.optional)(validation_1.parseString)],
    fontTypes: [(0, validation_1.listMembersParser)(Object.values(misc_1.FontAssetType))],
    assetTypes: [(0, validation_1.listMembersParser)(Object.values(misc_1.OtherAssetType))],
    formatOptions: [],
    pathOptions: [],
    templates: [],
    codepoints: [],
    fontHeight: [(0, validation_1.optional)(validation_1.parseNumeric)],
    descent: [(0, validation_1.optional)(validation_1.parseNumeric)],
    normalize: [(0, validation_1.optional)(validation_1.parseBoolean)],
    round: [(0, validation_1.optional)(validation_1.parseNumeric)],
    selector: [(0, validation_1.nullable)(validation_1.parseString)],
    tag: [validation_1.parseString],
    prefix: [validation_1.parseString],
    fontsUrl: [(0, validation_1.optional)(validation_1.parseString)],
    getIconId: [(0, validation_1.optional)(validation_1.parseFunction)]
};
const parseConfig = (input = {}) => __awaiter(void 0, void 0, void 0, function* () {
    const options = Object.assign(Object.assign({}, constants_1.DEFAULT_OPTIONS), input);
    const out = {};
    const allkeys = [
        ...new Set([...Object.keys(options), ...Object.keys(CONFIG_VALIDATORS)])
    ];
    for (const key of allkeys) {
        const validators = CONFIG_VALIDATORS[key];
        if (!validators) {
            throw new Error(`The option '${key}' is not recognised`);
        }
        let val = options[key];
        try {
            for (const fn of validators) {
                val = yield fn(val, val);
            }
        }
        catch (err) {
            throw new Error(`Invalid option ${key}: ${err.message}`);
        }
        out[key] = val;
    }
    return out;
});
exports.parseConfig = parseConfig;
//# sourceMappingURL=config-parser.js.map