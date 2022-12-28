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
exports.loadConfig = exports.DEFAULT_FILEPATHS = void 0;
const path_1 = require("path");
const fs_async_1 = require("../utils/fs-async");
exports.DEFAULT_FILEPATHS = [
    '.fantasticonrc',
    'fantasticonrc',
    '.fantasticonrc.json',
    'fantasticonrc.json',
    '.fantasticonrc.js',
    'fantasticonrc.js'
];
const attemptLoading = (filepath) => __awaiter(void 0, void 0, void 0, function* () {
    if (yield (0, fs_async_1.checkPath)(filepath, 'file')) {
        try {
            return require((0, path_1.join)(process.cwd(), filepath));
        }
        catch (err) { }
        try {
            return JSON.parse(yield (0, fs_async_1.readFile)(filepath, 'utf8'));
        }
        catch (err) { }
        throw new Error(`Failed parsing configuration at '${filepath}'`);
    }
});
const loadConfig = (filepath) => __awaiter(void 0, void 0, void 0, function* () {
    let loadedConfigPath = null;
    let loadedConfig = {};
    if (filepath) {
        loadedConfig = yield attemptLoading(filepath);
        loadedConfigPath = filepath;
    }
    else {
        for (const path of exports.DEFAULT_FILEPATHS) {
            loadedConfig = yield attemptLoading(path);
            if (loadedConfig) {
                loadedConfigPath = path;
                break;
            }
        }
    }
    return { loadedConfig, loadedConfigPath };
});
exports.loadConfig = loadConfig;
//# sourceMappingURL=config-loader.js.map