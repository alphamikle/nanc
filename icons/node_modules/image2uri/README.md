Image To URI
---

[![NPM Downloads](https://img.shields.io/npm/dm/image2uri.svg?style=flat)](https://www.npmjs.com/package/image2uri)
[![Build & Test](https://github.com/jaywcjlove/image2uri/actions/workflows/ci.yml/badge.svg)](https://github.com/jaywcjlove/image2uri/actions/workflows/ci.yml)
[![npm version](https://img.shields.io/npm/v/image2uri.svg)](https://www.npmjs.com/package/image2uri)
[![Coverage Status](https://jaywcjlove.github.io/image2uri/badges.svg)](https://jaywcjlove.github.io/image2uri/lcov-report/)

Convert image file to data URI. Support `.png`,`.gif`,`.jpg`,`.jpeg`,`.bm`,`.bmp`,`.webp`,`.ico`,`.svg`.

### Install

```bash
npm i image2uri
```

### Basic Usage

```js
import image2uri from "image2uri";

console.log(image2uri('./example.bmp'));
// data:image/bmp;base64,Qk0YCAAAAAAAADYAAAAoAAAAGAAAABwAAAABABgAAAAAAOIHAAA....
console.log(image2uri('./example.jpg'));
// data:image/jpeg;base64,Qk0YCAAAAAAAADYAAAAoAAAAGAAAABwAAAABABgAAAAAAOIHAAA....
```

### Development

```bash
npm run watch # Listen compile .ts files.
npm run build # compile .ts files.

npm run start
```