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
const ttf2woff2_1 = __importDefault(require("ttf2woff2"));
const misc_1 = require("../../types/misc");
const generator = {
    dependsOn: misc_1.FontAssetType.TTF,
    generate(_options, ttf) {
        return __awaiter(this, void 0, void 0, function* () {
            const font = (0, ttf2woff2_1.default)(ttf);
            return Buffer.from(font.buffer);
        });
    }
};
exports.default = generator;
//# sourceMappingURL=woff2.js.map