"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.generateReactIcons = exports.generateIconsSource = void 0;
const fs_extra_1 = __importDefault(require("fs-extra"));
const path_1 = __importDefault(require("path"));
const svgo_1 = require("svgo");
const utils_1 = require("./utils");
/**
 * Generate Icon SVG Path Source
 * <font-name>.json
 */
async function generateIconsSource(options = {}) {
    const ICONS_PATH = (0, utils_1.filterSvgFiles)(options.src);
    const data = await buildPathsObject(ICONS_PATH, options);
    const outPath = path_1.default.join(options.dist, `${options.fontName}.json`);
    await fs_extra_1.default.outputFile(outPath, `{${data}\n}`);
    return outPath;
}
exports.generateIconsSource = generateIconsSource;
/**
 * Loads SVG file for each icon, extracts path strings `d="path-string"`,
 * and constructs map of icon name to array of path strings.
 * @param {array} files
 */
async function buildPathsObject(files, options = {}) {
    const svgoOptions = options.svgoOptions || {};
    return Promise.all(files.map(async (filepath) => {
        const name = path_1.default.basename(filepath, '.svg');
        const svg = fs_extra_1.default.readFileSync(filepath, 'utf-8');
        const pathStrings = (0, svgo_1.optimize)(svg, Object.assign(Object.assign({ path: filepath }, options), { plugins: [
                'convertTransform',
                ...(svgoOptions.plugins || [])
                // 'convertShapeToPath'
            ] }));
        const str = (pathStrings.data.match(/ d="[^"]+"/g) || []).map(s => s.slice(3));
        return `\n"${name}": [${str.join(',\n')}]`;
    }));
}
const reactSource = (name, size, fontName, source) => `import React from 'react';
export const ${name} = props => (
  <svg viewBox="0 0 20 20" width="${size}" height="${size}" {...props} className={\`${fontName} \${props.className ? props.className : ''}\`}>${source}</svg>
);
`;
const reactTypeSource = (name) => `import React from 'react';
export declare const ${name}: (props: React.SVGProps<SVGSVGElement>) => JSX.Element;
`;
/**
 * Generate React Icon
 * <font-name>.json
 */
async function generateReactIcons(options = {}) {
    const ICONS_PATH = (0, utils_1.filterSvgFiles)(options.src);
    const data = await outputReactFile(ICONS_PATH, options);
    const outPath = path_1.default.join(options.dist, 'react', 'index.js');
    fs_extra_1.default.outputFileSync(outPath, data.join('\n'));
    fs_extra_1.default.outputFileSync(outPath.replace(/\.js$/, '.d.ts'), data.join('\n'));
    return outPath;
}
exports.generateReactIcons = generateReactIcons;
async function outputReactFile(files, options = {}) {
    const svgoOptions = options.svgoOptions || {};
    const fontSize = options.css && typeof options.css !== 'boolean' && options.css.fontSize ? options.css.fontSize : '16px';
    const fontName = options.classNamePrefix || options.fontName;
    return Promise.all(files.map(async (filepath) => {
        let name = (0, utils_1.toPascalCase)(path_1.default.basename(filepath, '.svg'));
        if (/^[rR]eact$/.test(name)) {
            name = name + (0, utils_1.toPascalCase)(fontName);
        }
        const svg = fs_extra_1.default.readFileSync(filepath, 'utf-8');
        const pathData = (0, svgo_1.optimize)(svg, Object.assign(Object.assign({ path: filepath }, svgoOptions), { plugins: [
                'removeXMLNS',
                'removeEmptyAttrs',
                'convertTransform',
                // 'convertShapeToPath',
                // 'removeViewBox'
                ...(svgoOptions.plugins || [])
            ] }));
        const str = (pathData.data.match(/ d="[^"]+"/g) || []).map(s => s.slice(3));
        const outDistPath = path_1.default.join(options.dist, 'react', `${name}.js`);
        const pathStrings = str.map((d, i) => `<path d=${d} fillRule="evenodd" />`);
        const comName = isNaN(Number(name.charAt(0))) ? name : (0, utils_1.toPascalCase)(fontName) + name;
        fs_extra_1.default.outputFileSync(outDistPath, reactSource(comName, fontSize, fontName, pathStrings.join(',\n')));
        fs_extra_1.default.outputFileSync(outDistPath.replace(/\.js$/, '.d.ts'), reactTypeSource(comName));
        return `export * from './${name}';`;
    }));
}
//# sourceMappingURL=generate.js.map