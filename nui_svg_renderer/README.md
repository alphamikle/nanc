# NUI SVG renderer

This package will allow you to use the `<svg>` tag in your Nui code to render SVG images.

## Installation

Install package as usual, then, if you want to configure Nanc CMS - go [here](https://nanc.io/docs/cms_configuration#custom-renderers). And if you enough with only Nui in the mobile app - go [here](https://nanc.io/docs/app_configuring#renderers).

## Example of use

```html
<safeArea>
  <column>
    <svg ref="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/6.x/svgs/solid/0.svg" color="green" height="50" width="50"/>
    <svg ref="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/6.x/svgs/solid/1.svg" size="50">
      <prop:header name="Cache-Control" value="public"/>
      <prop:header name="ETag" value="737060cd8c284d8af7ad3082f209582d"/>
      <prop:colorFilter color="yellow" mode="color"/>
    </svg>
    <for from="2" to="10">
      <svg ref="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/6.x/svgs/solid/{{ cycle.value }}.svg" size="50"/>
    </for>
  </column>
</safeArea>
```

Currently, the only way to view all renderer's documentation, including this one, is to use Nanc and its [interactive documentation](https://nanc.io/docs/built_in_help), or the source code of the renderer itself.

**To learn more about Nanc visit [https://nanc.io](https://nanc.io).**

**And to learn more about Nui visit [https://nanc.io/docs/nui/server_driven_ui](https://nanc.io/docs/nui/server_driven_ui).**