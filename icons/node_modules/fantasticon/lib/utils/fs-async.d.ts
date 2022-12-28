/// <reference types="node" />
import * as fs from 'fs';
export declare const readFile: typeof fs.readFile.__promisify__;
export declare const writeFile: typeof fs.writeFile.__promisify__;
export declare const stat: typeof fs.stat.__promisify__;
export declare const checkPath: (filepath: string, type?: 'directory' | 'file') => Promise<boolean>;
