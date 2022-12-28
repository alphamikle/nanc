"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ASSET_TYPES = exports.ASSET_TYPES_WITH_TEMPLATE = exports.OtherAssetType = exports.FontAssetType = void 0;
var FontAssetType;
(function (FontAssetType) {
    FontAssetType["EOT"] = "eot";
    FontAssetType["WOFF2"] = "woff2";
    FontAssetType["WOFF"] = "woff";
    FontAssetType["TTF"] = "ttf";
    FontAssetType["SVG"] = "svg";
})(FontAssetType = exports.FontAssetType || (exports.FontAssetType = {}));
var OtherAssetType;
(function (OtherAssetType) {
    OtherAssetType["CSS"] = "css";
    OtherAssetType["SCSS"] = "scss";
    OtherAssetType["SASS"] = "sass";
    OtherAssetType["HTML"] = "html";
    OtherAssetType["JSON"] = "json";
    OtherAssetType["TS"] = "ts";
})(OtherAssetType = exports.OtherAssetType || (exports.OtherAssetType = {}));
exports.ASSET_TYPES_WITH_TEMPLATE = [
    OtherAssetType.CSS,
    OtherAssetType.HTML,
    OtherAssetType.SCSS,
    OtherAssetType.SASS
];
exports.ASSET_TYPES = Object.assign(Object.assign({}, FontAssetType), OtherAssetType);
//# sourceMappingURL=misc.js.map