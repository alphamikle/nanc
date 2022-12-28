module.exports = {
  multipass: true,
  js2svg: {
    indent: 2,
    pretty: true,
  },
  plugins: [
    'preset-default',
    // 'removeXMLNS',
    'prefixIds',
    'convertStyleToAttrs',
    'reusePaths',
  ],
};