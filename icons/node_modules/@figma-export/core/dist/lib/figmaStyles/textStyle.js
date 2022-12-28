"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.parse = void 0;
const translateTextTransform = (figmaTextCase) => {
    const map = {
        undefined: 'none',
        UPPER: 'uppercase',
        LOWER: 'lowercase',
        TITLE: 'capitalize',
    };
    // eslint-disable-next-line @typescript-eslint/no-non-null-assertion
    return map[figmaTextCase] || map.undefined;
};
const translateFontVariant = (figmaTextCase) => {
    const map = {
        undefined: 'normal',
        SMALL_CAPS: 'small-caps',
        SMALL_CAPS_FORCED: 'all-small-caps',
    };
    // eslint-disable-next-line @typescript-eslint/no-non-null-assertion
    return map[figmaTextCase] || map.undefined;
};
const translateTextDecoration = (figmaTextDecoration) => {
    const map = {
        undefined: 'none',
        STRIKETHROUGH: 'line-through',
        UNDERLINE: 'underline',
    };
    // eslint-disable-next-line @typescript-eslint/no-non-null-assertion
    return map[figmaTextDecoration] || map.undefined;
};
const translateTextAlign = (figmaTextAlignHorizontal) => {
    const map = {
        LEFT: 'left',
        RIGHT: 'right',
        CENTER: 'center',
        JUSTIFIED: 'justify',
    };
    return map[figmaTextAlignHorizontal];
};
const translateVerticalAlign = (figmaTextAlignVertical) => {
    const map = {
        TOP: 'top',
        CENTER: 'middle',
        BOTTOM: 'bottom',
    };
    return map[figmaTextAlignVertical];
};
const createTextStyle = (textNode) => {
    const { fontFamily, fontWeight, fontSize, lineHeightPx, letterSpacing, italic, textCase, textDecoration, textAlignHorizontal, textAlignVertical, } = textNode.style;
    return {
        fontFamily,
        fontWeight,
        fontSize,
        letterSpacing,
        lineHeight: lineHeightPx,
        fontStyle: italic ? 'italic' : 'normal',
        fontVariant: translateFontVariant(textCase),
        textTransform: translateTextTransform(textCase),
        textDecoration: translateTextDecoration(textDecoration),
        textAlign: translateTextAlign(textAlignHorizontal),
        verticalAlign: translateVerticalAlign(textAlignVertical),
    };
};
const parse = (node) => {
    if (node.styleType === 'TEXT' && node.type === 'TEXT') {
        return {
            styleType: 'TEXT',
            style: createTextStyle(node),
        };
    }
    return undefined;
};
exports.parse = parse;
//# sourceMappingURL=textStyle.js.map