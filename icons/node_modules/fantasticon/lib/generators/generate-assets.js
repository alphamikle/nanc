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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.generateAssets = void 0;
const asset_types_1 = __importDefault(require("./asset-types"));
const generateAssets = (options) => __awaiter(void 0, void 0, void 0, function* () {
    const generated = {};
    const generateTypes = [...options.fontTypes, ...options.assetTypes];
    const generateAsset = (type) => __awaiter(void 0, void 0, void 0, function* () {
        if (generated[type]) {
            return generated[type];
        }
        const generator = asset_types_1.default[type];
        const dependsOn = 'dependsOn' in generator && generator.dependsOn;
        if (dependsOn && !generated[dependsOn]) {
            generated[dependsOn] = yield generateAsset(dependsOn);
        }
        return (generated[type] = yield generator.generate(options, dependsOn ? generated[dependsOn] : null));
    });
    for (const type of generateTypes) {
        yield generateAsset(type);
    }
    return generateTypes.reduce((out, type) => (Object.assign(Object.assign({}, out), { [type]: generated[type] })), {});
});
exports.generateAssets = generateAssets;
//# sourceMappingURL=generate-assets.js.map