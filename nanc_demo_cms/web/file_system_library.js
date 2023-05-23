// noinspection JSUnusedGlobalSymbols,DuplicatedCode,JSUnresolvedFunction,JSDeprecatedSymbols

/**
 * @description This file is the original source code of the web logic implementation
 * To use it - copy-paste if to the cms/web
 */

'use strict';

/**
 * @type {FileSystemFileHandle | null}
 */
let fileSystemHandle;

/**
 * @returns {Promise<string | null>}
 */
async function syncWithFileJS() {
  if (fileSystemHandle) {
    return _readFile(fileSystemHandle);
  }
  fileSystemHandle = await _getFileHandle();
  if (fileSystemHandle) {
    return _readFile(fileSystemHandle);
  }
  return null;
}

async function closeFileSystemHandleJS() {
  fileSystemHandle = null;
}

/**
 * @return {Promise<FileSystemFileHandle>}
 */
function _getFileHandle() {
  // For Chrome 86 and later...
  if ('showOpenFilePicker' in window) {
    return window.showOpenFilePicker().then((handles) => handles[0]);
  }
  // For Chrome 85 and earlier...
  return window.chooseFileSystemEntries();
}

/**
 * @param {FileSystemFileHandle} fileSystemHandle
 * @return {Promise<string>}
 */
async function _readFile(fileSystemHandle) {
  const file = await fileSystemHandle.getFile();
  if (file.text) {
    const content = await file.text();
    return content;
  }
  return _readFileLegacy(file);
}

/**
 * @param {File} file
 * @return {Promise<string>}
 */
function _readFileLegacy(file) {
  return new Promise((resolve) => {
    const reader = new FileReader();
    reader.addEventListener('loadend', (e) => {
      const text = e.srcElement.result;
      resolve(text);
    });
    reader.readAsText(file);
  });
}