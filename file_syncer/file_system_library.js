// noinspection JSUnusedGlobalSymbols,DuplicatedCode,JSUnresolvedFunction,JSDeprecatedSymbols

/**
 * @description This file is the original source code of the web logic implementation
 * To use it - copy-paste if to the cms/web
 */

'use strict';

console.log('!!! FILE SYSTEM LIBRARY WAS LOADED !!!');

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
    console.log('GET FILE HANDLE: NEW API');
    return window.showOpenFilePicker().then((handles) => handles[0]);
  }
  // For Chrome 85 and earlier...
  console.log('GET FILE HANDLE: OLD API');
  return window.chooseFileSystemEntries();
}

/**
 * @param {FileSystemFileHandle} fileSystemHandle
 * @return {Promise<string>}
 */
async function _readFile(fileSystemHandle) {
  const file = await fileSystemHandle.getFile();
  console.log('READ FILE');
  if (file.text) {
    const content = await file.text();
    console.log(`READ FILE CONTENT: ${content}`);
    return content;
  }
  return _readFileLegacy(file);
}

/**
 * @param {File} file
 * @return {Promise<string>}
 */
function _readFileLegacy(file) {
  console.log('READ FILE LEGACY');
  return new Promise((resolve) => {
    const reader = new FileReader();
    reader.addEventListener('loadend', (e) => {
      const text = e.srcElement.result;
      console.log(`READ FILE LEGACY CONTENT: ${text}`);
      resolve(text);
    });
    reader.readAsText(file);
  });
}