"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.extractColor = exports.parse = void 0;
const utils_1 = require("../utils");
const extractColor = ({ color, opacity = 1 }) => {
    if (!color) {
        return undefined;
    }
    const toFixed = (number, fractionDigits) => parseFloat((number).toFixed(fractionDigits));
    const convert = (figmaColor) => toFixed(figmaColor * 255, 0);
    // eslint-disable-next-line object-curly-newline
    let { r = 0, g = 0, b = 0, a = 1 } = color;
    r = convert(r);
    g = convert(g);
    b = convert(b);
    a = toFixed(opacity * a, 2);
    return {
        r,
        g,
        b,
        a,
        rgba: `rgba(${r}, ${g}, ${b}, ${a})`,
    };
};
exports.extractColor = extractColor;
const extractGradientLinear = (paint) => {
    if (!paint.gradientStops || !paint.gradientHandlePositions) {
        return undefined;
    }
    const getAngle = (figmaGradientHandlePositions) => {
        const [startPoint, endPoint] = figmaGradientHandlePositions;
        const deltaY = (endPoint.y - startPoint.y);
        const deltaX = (endPoint.x - startPoint.x);
        const deg = ((Math.atan2(deltaY, deltaX) * 180) / Math.PI) + 90;
        return `${parseFloat(deg.toFixed(2))}deg`;
    };
    const getGradientStops = (figmaGradientStops, opacity) => {
        const gradientStops = [];
        figmaGradientStops.forEach((stop) => {
            const color = extractColor(Object.assign(Object.assign({}, stop), { opacity }));
            const position = parseFloat((stop.position * 100).toFixed(3));
            if (color) {
                gradientStops.push({ color, position });
            }
        });
        return gradientStops;
    };
    return {
        angle: getAngle(paint.gradientHandlePositions),
        gradientStops: getGradientStops(paint.gradientStops, paint.opacity),
    };
};
const createFillStyles = (fill) => {
    // eslint-disable-next-line default-case
    switch (fill.type) {
        case 'SOLID': {
            const color = extractColor(fill);
            if (color) {
                return {
                    type: 'SOLID',
                    visible: fill.visible !== false,
                    color,
                    value: color.rgba,
                };
            }
            break;
        }
        case 'GRADIENT_LINEAR': {
            const gradient = extractGradientLinear(fill);
            if (gradient) {
                return Object.assign(Object.assign({ type: 'GRADIENT_LINEAR', visible: fill.visible !== false }, gradient), { value: `linear-gradient(${gradient.angle}, ${gradient.gradientStops.map((stop) => {
                        return `${stop.color.rgba} ${stop.position}%`;
                    }).join(', ')})` });
            }
            break;
        }
    }
    return undefined;
};
const parse = (node) => {
    if (node.styleType === 'FILL' && node.type === 'RECTANGLE') {
        return {
            styleType: 'FILL',
            fills: Array.from(node.fills)
                .reverse()
                .map(createFillStyles)
                .filter(utils_1.notEmpty),
        };
    }
    return undefined;
};
exports.parse = parse;
//# sourceMappingURL=paintStyle.js.map