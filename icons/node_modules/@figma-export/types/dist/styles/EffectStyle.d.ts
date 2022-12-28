import * as Figma from 'figma-js';
import { Color } from './PaintStyle';
export declare type EffectStyleShadow = {
    type: 'DROP_SHADOW' | 'INNER_SHADOW';
    color: Color;
    inset: boolean;
    offset: Figma.Vector2;
    blurRadius: number;
    spreadRadius: number;
};
export declare type EffectStyleLayerBlur = {
    type: 'LAYER_BLUR';
    blurRadius: number;
};
export declare type EffectStyle = {
    visible: boolean;
    value: string;
} & (EffectStyleShadow | EffectStyleLayerBlur);
export declare type StyleTypeEffect = {
    styleType: 'EFFECT';
    effects: EffectStyle[];
};
//# sourceMappingURL=EffectStyle.d.ts.map