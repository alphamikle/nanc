/// <reference types="node" />
import ejs from 'ejs';
import { SvgToFontOptions } from './';
/**
 * SVG to SVG font
 */
export declare function createSVG(options?: SvgToFontOptions): Promise<Record<string, string>>;
/**
 * Converts a string to pascal case.
 *
 * @example
 *
 * ```js
 * toPascalCase('some_database_field_name'); // 'SomeDatabaseFieldName'
 * toPascalCase('Some label that needs to be pascalized');
 * // 'SomeLabelThatNeedsToBePascalized'
 * toPascalCase('some-javascript-property'); // 'SomeJavascriptProperty'
 * toPascalCase('some-mixed_string with spaces_underscores-and-hyphens');
 * // 'SomeMixedStringWithSpacesUnderscoresAndHyphens'
 * ```
 */
export declare const toPascalCase: (str: string) => string;
export declare function filterSvgFiles(svgFolderPath: string): string[];
export declare function snakeToUppercase(str: string): string;
export declare type TypescriptOptions = {
    extension?: 'd.ts' | 'ts' | 'tsx';
    enumName?: string;
};
/**
 * Create typescript declarations for icon classnames
 */
export declare function createTypescript(options: Omit<SvgToFontOptions, 'typescript'> & {
    typescript: TypescriptOptions | true;
}): Promise<void>;
/**
 * SVG font to TTF
 */
export declare function createTTF(options?: SvgToFontOptions): Promise<Buffer>;
/**
 * TTF font to EOT
 */
export declare function createEOT(options: SvgToFontOptions, ttf: Buffer): Promise<unknown>;
/**
 * TTF font to WOFF
 */
export declare function createWOFF(options: SvgToFontOptions, ttf: Buffer): Promise<unknown>;
/**
 * TTF font to WOFF2
 */
export declare function createWOFF2(options: SvgToFontOptions, ttf: Buffer): Promise<unknown>;
/**
 * Create SVG Symbol
 */
export declare function createSvgSymbol(options?: SvgToFontOptions): Promise<unknown>;
export declare type CSSOptions = {
    /**
     * Output the css file to the specified directory
     */
    output?: string;
    /**
     * Which files are exported.
     */
    include?: RegExp;
    /**
     * Setting font size.
     */
    fontSize?: string;
    /**
     * Set the path in the css file
     * https://github.com/jaywcjlove/svgtofont/issues/48#issuecomment-739547189
     */
    cssPath?: string;
    /**
     * Set file name
     * https://github.com/jaywcjlove/svgtofont/issues/48#issuecomment-739547189
     */
    fileName?: string;
};
/**
 * Copy template files
 */
export declare function copyTemplate(inDir: string, outDir: string, { _opts, ...vars }: Record<string, any> & {
    _opts: CSSOptions;
}): Promise<unknown>;
/**
 * Create HTML
 */
export declare function createHTML(outPath: string, data: ejs.Data, options?: ejs.Options): Promise<string>;
