/// html
String defaultPageScreen() => '''
<data id="gap" x0="8" x1="16" x2="24"/>

<template id="h1">
  <padding left="{{ data(gap).x1 }}" right="{{ data(gap).x1 }}">
    <text textAlign="center">
      <prop:textStyle font="Rubik Glitch" size="80"/>
      {{ template.text }}.
    </text>
  </padding>
</template>

<template id="p">
  <padding left="{{ data(gap).x1 }}" right="{{ data(gap).x1 }}">
    <text size="{{ template.size }}" softWrap="true" color="{{ template.color }}">
      {{ template.text }}
    </text>
  </padding>
</template>

<template id="br">
  <sizedBox height="{{ template.height }}">
  </sizedBox>
</template>

<template id="img">
  <padding all="{{ data(gap).x1 }}">
    <clipRRect all="{{ data(gap).x1 }}">
      <image ref="{{ template.ref }}"/>
    </clipRRect>
  </padding>
</template>

<template id="bigButton">
  <padding all="{{ data(gap).x1 }}">
    <stack>
      <container>
        <prop:decoration color="{{ template.background }}">
          <prop:borderRadius all="{{ data(gap).x0 }}"/>
        </prop:decoration>

        <padding all="{{ data(gap).x1 }}">
          <center>
            <text size="22" color="{{ template.textColor }}">
              <prop:textStyle font="Roboto Slab"/>

              {{ template.text }}
            </text>
          </center>
        </padding>
      </container>
      <positioned all="0">
        <material type="transparency">
          <prop:borderRadius all="{{ data(gap).x0 }}"/>

          <inkWell onPressed="{{ template.onPressed }}">
            <prop:borderRadius all="{{ data(gap).x0 }}"/>
          </inkWell>
        </material>
      </positioned>
    </stack>
  </padding>
</template>

<template id="adminButton">
  <component id="bigButton" background="{{ page.admin_panel_link_button.0.background }}" textColor="{{ page.admin_panel_link_button.0.text_color }}"
             text="{{ page.admin_panel_link_button.0.title }}" onPressed="{{ page.admin_panel_link_button.0.link }}"/>
</template>

<template id="storeButton">
  <stack>
    <image ref="{{ template.image }}"/>
    <positioned all="0">
      <material type="transparency">
        <prop:borderRadius all="6"/>
        <inkWell onPressed="{{ template.link }}">
          <prop:borderRadius all="6"/>
        </inkWell>
      </material>
    </positioned>
  </stack>
</template>

<component id="h1" text="{{ page.header }}"/>

<component id="p" text="{{ page.p1 }}"/>
<component id="br" height="8"/>

<container color="#36FF66">
  <padding top="{{ data(gap).x0 }}" bottom="{{ data(gap).x0 }}">
    <component id="p" text="{{ page.p2 }}"/>
  </padding>
</container>

<component id="br" height="{{ data(gap).x0 }}"/>

<component id="p" text="{{ page.p3 }}"/>
<component id="br" height="{{ data(gap).x1 }}"/>

<container color="#F7CE5B">
  <padding top="{{ data(gap).x0 }}" bottom="{{ data(gap).x0 }}">
    <component id="p" text="{{ page.p4 }}"/>
  </padding>
</container>

<component id="img" ref="{{ page.nanc_screenshot_with_fields }}"/>

<component id="p" text="{{ page.p5 }}"/>
<component id="br" height="{{ data(gap).x1 }}"/>

<component id="adminButton"/>

<component id="bigButton"
  background="{{ page.admin_panel_link_button.0.background }}"
  textColor="{{ page.admin_panel_link_button.0.text_color }}"
  text="Send message to the host"
  onPressed="messageToHost"
/>

<padding top="{{ data(gap).x1 }}" bottom="{{ data(gap).x1 }}">
  <component id="p" text="{{ page.p6 }}"/>
</padding>

<component id="img" ref="{{ page.screenshot_with_app_preview }}"/>

<component id="p" text="{{ page.p7 }}"/>
<component id="br" height="{{ data(gap).x1 }}"/>

<component id="adminButton"/>

<component id="br" height="{{ data(gap).x1 }}"/>
<container color="#81667A">
  <padding top="{{ data(gap).x1 }}" bottom="{{ data(gap).x1 }}">
    <component id="p" text="{{ page.p8 }}" color="#F2F2F2"/>
  </padding>
</container>

<component id="br" height="{{ data(gap).x1 }}"/>
<component id="p" text="{{ page.p9 }}"/>

<padding top="{{ data(gap).x2 }}" bottom="{{ data(gap).x2 }}">
  <image ref="{{ page.screenshot_with_template }}"/>
</padding>

<component id="p" text="{{ page.p10 }}"/>

<padding top="{{ data(gap).x1 }}" bottom="{{ data(gap).x1 }}">
  <container color="#DB2A78">
    <padding top="{{ data(gap).x1 }}" bottom="{{ data(gap).x1 }}">
      <component id="p" text="{{ page.p11 }}" color="#FFECF4"/>
    </padding>
  </container>
</padding>

<component id="p" text="{{ page.p12 }}"/>
<component id="br" height="{{ data(gap).x1 }}"/>

<component id="bigButton" background="{{ page.admin_panel_link_button.1.background }}" text="{{ page.admin_panel_link_button.1.title }}"
           textColor="{{ page.admin_panel_link_button.1.text_color }}" onPressed="{{ page.admin_panel_link_button.1.link }}"
/>

<component id="p" text="{{ page.p13 }}"/>
<component id="br" height="{{ data(gap).x1 }}"/>

<component id="adminButton"/>

<component id="p" text="{{ page.p14 }}"/>

<padding left="{{ data(gap).x1 }}" top="{{ data(gap).x1 }}" right="{{ data(gap).x1 }}" bottom="{{ data(gap).x2 }}">
  <row>
    <expanded>
      <component id="storeButton" link="{{ page.store_buttons.0.link }}" image="{{ page.store_buttons.0.image }}"/>
    </expanded>
    <sizedBox width="{{ data(gap).x1 }}">
    </sizedBox>
    <expanded>
      <component id="storeButton" link="{{ page.store_buttons.1.link }}" image="{{ page.store_buttons.1.image }}"/>
    </expanded>
  </row>
</padding>
''';
