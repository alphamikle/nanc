export declare type TextTransform = 'none' | 'uppercase' | 'lowercase' | 'capitalize';
export declare type TextDecoration = 'none' | 'line-through' | 'underline';
export declare type FontVariant = 'normal' | 'small-caps' | 'all-small-caps';
export declare type FontStyle = 'normal' | 'italic';
export declare type TextAlign = 'left' | 'right' | 'center' | 'justify';
export declare type VerticalAlign = 'top' | 'middle' | 'bottom';
export declare type TextStyle = {
    /** Font family of text (standard name) */
    fontFamily: string;
    /** Numeric font weight */
    fontWeight: 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900;
    /** Font size in px */
    fontSize: number;
    /** Line height in px */
    lineHeight: number;
    /** Space between characters in px */
    letterSpacing: number;
    /** text-transform property, default is none */
    textTransform: TextTransform;
    /** font-variant property, default is none */
    fontVariant: FontVariant;
    /** text-decoration property, default is none */
    textDecoration: TextDecoration;
    /** font-style property, default is normal */
    fontStyle: FontStyle;
    /** text-align property */
    textAlign: TextAlign;
    /** text-align property */
    verticalAlign: VerticalAlign;
};
export declare type StyleTypeText = {
    styleType: 'TEXT';
    style: TextStyle;
};
//# sourceMappingURL=TextStyle.d.ts.map