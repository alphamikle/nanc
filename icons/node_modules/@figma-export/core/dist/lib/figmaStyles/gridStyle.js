"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.parse = void 0;
const parse = (node) => {
    if (node.styleType === 'GRID' && node.type === 'FRAME') {
        return {
            styleType: 'GRID',
        };
    }
    return undefined;
};
exports.parse = parse;
//# sourceMappingURL=gridStyle.js.map