export declare class Log {
    _disabled?: boolean;
    constructor(disabled?: boolean);
    get disabled(): boolean;
    set disabled(val: boolean);
    log: (message?: any, ...optionalParams: any[]) => void | (() => void);
    error: (message?: any, ...optionalParams: any[]) => void | (() => void);
    logger: (message?: string) => void;
}
export declare const log: Log;
