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
exports.renderTemplate = exports.TEMPLATE_HELPERS = void 0;
const handlebars_1 = __importDefault(require("handlebars"));
const path_1 = require("path");
const fs_async_1 = require("./fs-async");
const codepoints_1 = require("./codepoints");
exports.TEMPLATE_HELPERS = {
    codepoint: codepoints_1.getHexCodepoint
};
const renderTemplate = (templatePath, context, options = {}) => __awaiter(void 0, void 0, void 0, function* () {
    const absoluteTemplatePath = (0, path_1.isAbsolute)(templatePath)
        ? templatePath
        : (0, path_1.resolve)(process.cwd(), templatePath);
    const template = yield (0, fs_async_1.readFile)(absoluteTemplatePath, 'utf8');
    return handlebars_1.default.compile(template)(context, Object.assign(Object.assign({}, options), { helpers: Object.assign(Object.assign({}, exports.TEMPLATE_HELPERS), (options.helpers || {})) }));
});
exports.renderTemplate = renderTemplate;
//# sourceMappingURL=template.js.map