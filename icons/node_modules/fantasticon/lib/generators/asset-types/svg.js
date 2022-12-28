"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const fs_1 = require("fs");
const svgicons2svgfont_1 = __importDefault(require("svgicons2svgfont"));
const generator = {
    generate: ({ name: fontName, fontHeight, descent, normalize, assets, codepoints, formatOptions: { svg } = {} }) => new Promise(resolve => {
        let font = Buffer.alloc(0);
        const fontStream = new svgicons2svgfont_1.default(Object.assign({ fontName,
            fontHeight,
            descent,
            normalize, log: () => null }, svg))
            .on('data', data => (font = Buffer.concat([font, data])))
            .on('end', () => resolve(font.toString()));
        for (const { id, absolutePath } of Object.values(assets)) {
            const glyph = (0, fs_1.createReadStream)(absolutePath);
            const unicode = String.fromCharCode(codepoints[id]);
            glyph.metadata = { name: id, unicode: [unicode] };
            fontStream.write(glyph);
        }
        fontStream.end();
    })
};
exports.default = generator;
//# sourceMappingURL=svg.js.map