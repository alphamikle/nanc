const String testContent = '''
<for product:in="{{ products }}">
  <productComponent/>
  <productComponent></productComponent>
</for>

<container>
  <text>
    <textStyle font="Some non-standart font" size="32"/>
    Hello, {{ template.name }}!
    We are welcome to greetings you here!
    Do you <bold>want</bold> to eat some {{ template.food }} or drink some {{ template.drink }}?
  </text>
</container>

<!--! Here is the list of screen' paddings-->
<data id="gap" x1="4" x2="8" x3="16" x4="20" x5="24" x6="30"/>

<!--First of all - let me introduce the <template></template> - thing, which brings reusable components in the Backend Driven UI flow-->

<!--! TEMPLATES-->
<!--First - I will create templates for the text widgets (or tags - as you wish)-->
<template id="text.h1">
  <!--  We are able to use variables in our UI "code". Not only them - you will see all the staff a little bit later-->
  <text color="{{ page.primary_dark_color }}">
    <prop:textStyle font="{{ page.header_font }}" size="41" weight="bold"/>
    {{ template.text }}
  </text>
</template>

<template id="text.h3">
  <text color="{{ template.color }}">
    <prop:textStyle font="{{ page.header_font }}" size="29" weight="bold"/>
    {{ template.text }}
  </text>
</template>

<template id="text.sub1">
  <text color="{{ template.color }}">
    <prop:textStyle font="{{ page.body_font }}" size="20" weight="w700"/>
    {{ template.text }}
  </text>
</template>

<template id="text.sub3">
  <text color="{{ template.color }}">
    <prop:textStyle font="{{ page.body_font }}" size="16" weight="w500"/>
    {{ template.text }}
  </text>
</template>

<template id="text.body">
  <text color="{{ template.color }}">
    <prop:textStyle font="{{ page.body_font }}" size="16" weight="w400"/>
    {{ template.text }}
  </text>
</template>

<template id="button.primary">
  <stack>
    <container>
      <prop:decoration color="{{ page.primary_light_color }}">
        <prop:borderRadius all="8"/>
      </prop:decoration>
      <padding left="16" top="12" right="12" bottom="12">
        <row>
          <!--! We want to show the icon, only if it passed through the arguments of the template / component-->
          <show show="{{ template.icon }}">
            <padding right="12">
              <icon icon="{{ template.icon }}" color="{{ page.primary_dark_color }}"/>
            </padding>
          </show>
          <expanded>
            <text align="{{ template.titleAlign }}">
              <prop:textStyle font="{{ page.body_font }}" size="18" color="{{ page.primary_dark_color }}"/>
              {{ template.title }}
            </text>
          </expanded>
          <!--! Here - we write a condition to show the suffix icon (chevron)-->
          <show show="{{ template.hasSuffix }}">
            <icon icon="flu_chevron_right_filled" color="{{ page.primary_dark_color }}"/>
          </show>
        </row>
      </padding>
    </container>
    <positioned all="0">
      <material type="transparency">
        <prop:borderRadius all="8"/>
        <inkWell onPressed="deeplink: {{ template.deeplink }}">
          <prop:borderRadius all="8"/>
        </inkWell>
      </material>
    </positioned>
  </stack>
</template>

<!--! You can name template as you wish - any name is acceptable-->
<template id="card.result.indicator">
  <container>
    <prop:decoration color="{{ template.backgroundColor }}">
      <prop:borderRadius all="4"/>
    </prop:decoration>
    <!--! Here is the first example of using of local variables through the data parameter-->
    <padding all="{{ data(gap).x2 }}">
      <row>
        <container size="16">
          <prop:decoration color="{{ template.dotColor }}">
            <prop:borderRadius all="16"/>
          </prop:decoration>
        </container>
        <divider width="{{ data(gap).x1 }}"/>
        <text>
          <prop:textStyle color="{{ page.primary_dark_color }}" font="{{ page.body_font }}" weight="bold"/>
          {{ template.text }}
        </text>
      </row>
    </padding>
  </container>
</template>

<template id="card.result">
  <container>
    <prop:decoration color="{{ page.surface_color }}">
      <prop:borderRadius all="8"/>
      <prop:shadow color="{{ page.shadow_color }}" offsetY="2" spreadRadius="-2" blurRadius="8"/>
    </prop:decoration>
    <padding left="{{ data(gap).x4 }}" top="{{ data(gap).x5 }}" right="{{ data(gap).x4 }}" bottom="{{ data(gap).x5 }}">
      <column crossAxisAlignment="start">
        <component id="text.sub1" text="{{ template.name }}"/>
        <divider height="{{ data(gap).x1 }}"/>
        <component id="text.body" text="{{ template.date }}"/>
        <divider height="{{ data(gap).x1 }}"/>
        <component id="text.body" text="{{ template.subtitle }}"/>
        <divider height="{{ data(gap).x3 }}"/>
        <!--? RANGES-->
        <padding bottom="{{ data(gap).x3 }}">
          <row>
            <component id="card.result.indicator"
                       text="In range"
                       backgroundColor="{{ page.in_range_background_color }}"
                       dotColor="{{ page.in_range_dot_color }}"/>
            <divider width="{{ data(gap).x2 }}"/>
            <component id="text.body" text="{{ template.inRange }}"/>
          </row>
        </padding>
        <padding bottom="{{ data(gap).x3 }}">
          <row>
            <component id="card.result.indicator"
                       text="Out of range"
                       backgroundColor="{{ page.out_of_range_background_color }}"
                       dotColor="{{ page.out_of_range_dot_color }}"/>
            <divider width="{{ data(gap).x2 }}"/>
            <component id="text.body" text="{{ template.outOfRange }}"/>
          </row>
        </padding>
        <padding bottom="{{ data(gap).x3 }}">
          <row>
            <component id="card.result.indicator"
                       text="Uninterpreted"
                       backgroundColor="{{ page.uninterpreted_background_color }}"
                       dotColor="{{ page.uninterpreted_dot_color }}"/>
            <divider width="{{ data(gap).x2 }}"/>
            <component id="text.body" text="{{ template.uninterpreted }}"/>
          </row>
        </padding>
        <divider height="{{ data(gap).x2 }}"/>
        <component id="button.primary" title="View more" titleAlign="center" deeplink="TODO"/>
      </column>
    </padding>
  </container>
</template>

<template id="card.product">
  <aspectRatio ratio="0.7">
    <padding bottom="{{ data(gap).x2 }}">
      <stack>
        <container>
          <prop:decoration color="{{ page.card_background_color }}">
            <prop:borderRadius all="24"/>
            <prop:shadow color="{{ page.shadow_color }}" offsetY="4" blurRadius="4" spreadRadius="-2"/>
          </prop:decoration>
          <column crossAxisAlignment="stretch">
            <expanded>
              <padding top="{{ data(gap).x3 }}" bottom="{{ data(gap).x3 }}">
                <center>
                  <stack>
                    <positioned all="0">
                      <container>
                        <prop:decoration>
                          <prop:shadow color="{{ page.shadow_color }}" offsetY="3" offsetX="6" blurRadius="0"
                                       spreadRadius="-10"/>
                        </prop:decoration>
                      </container>
                    </positioned>
                    <image ref="{{ template.image }}"/>
                  </stack>
                </center>
              </padding>
            </expanded>
            <container color="{{ page.secondary_light_color }}">
              <prop:decoration>
                <prop:borderRadius bottomLeft="24" bottomRight="24"/>
              </prop:decoration>
              <padding top="{{ data(gap).x2 }}" bottom="{{ data(gap).x2 }}">
                <column>
                  <component id="text.sub3" text="{{ template.title }}"/>
                  <component id="text.body" text="{{ template.price }}"/>
                </column>
              </padding>
            </container>
          </column>
        </container>
        <positioned all="0">
          <material type="transparency">
            <prop:borderRadius all="24"/>
            <inkWell onPressed="deeplink: {{ template.deeplink }}">
              <prop:borderRadius all="24"/>
            </inkWell>
          </material>
        </positioned>
      </stack>
    </padding>
  </aspectRatio>
</template>

<!--! UI CODE-->
<!--? HEADER-->
<container>
  <prop:decoration color="{{ page.background_color }}">
  </prop:decoration>

  <safeArea>
    <padding left="{{ data(gap).x4 }}" right="{{ data(gap).x4 }}" bottom="{{ data(gap).x2 }}">
      <component id="text.h1" text="{{ page.view_title }} {{ page.username }}"/>
    </padding>
    <padding left="{{ data(gap).x4 }}" right="{{ data(gap).x4 }}">
      <component id="text.body" text="{{ page.view_subtitle }}"/>
    </padding>
  </safeArea>
  <stack>
    <positioned all="0">
      <container color="{{ page.background_color }}">
      </container>
    </positioned>
    <container height="22" width="1000">
      <prop:decoration color="{{ page.surface_color }}">
        <prop:borderRadius topLeft="20" topRight="20"/>
      </prop:decoration>
    </container>
  </stack>
</container>

<!--? SUB-HEADER-->
<padding left="{{ data(gap).x4 }}" right="{{ data(gap).x4 }}" bottom="{{ data(gap).x5 }}">
  <column crossAxisAlignment="start">
    <component id="text.h3" text="{{ page.secondary_title }}" color="{{ page.on_surface_color }}"/>
    <divider height="{{ data(gap).x2 }}"/>
    <component id="text.body" text="{{ page.secondary_subtitle }}"/>
  </column>
</padding>

<!--? ACTION BUTTONS-->
<!--! Yes. Nanc has iteration possibility for the UI code-->
<for valueName="button" in="{{ page.action_buttons }}">
  <padding left="{{ data(gap).x4 }}" right="{{ data(gap).x4 }}" bottom="{{ data(gap).x4 }}">
    <component id="button.primary" title="{{ cycle.button.title }}" icon="{{ cycle.button.prefix_icon }}"
               deeplink="{{ cycle.button.deeplink }}" hasSuffix="true"/>
  </padding>
</for>

<!--? RESULTS-->
<show show="{{ page.have_results }}">
  <padding bottom="{{ data(gap).x6 }}">
    <container color="{{ page.background_color }}">
      <padding all="{{ data(gap).x4 }}">
        <column>
          <row>
            <expanded>
              <component id="text.h3" text="{{ page.results_header_title }}"
                         color="{{ page.on_surface_color }}"/>
            </expanded>
            <textButton onPressed="/TODO">
              <prop:buttonStyle foregroundColor="{{ page.primary_dark_color }}"/>
              <row>
                <padding bottom="1">
                  <text>
                    View all
                  </text>
                </padding>
                <icon icon="mdi_chevron_right"/>
              </row>
            </textButton>
          </row>
          <divider height="{{ data(gap).x5 }}"/>
          <component id="card.result"
                     name="{{ page.result_details.0.title }}"
                     date="{{ page.result_details.0.date }}"
                     subtitle="{{ page.result_details.0.subtitle }}"
                     inRange="{{ page.result_details.0.in_range }} {{ page.result_details.0.biomarker_suffix }}"
                     outOfRange="{{ page.result_details.0.out_of_range }} {{ page.result_details.0.biomarker_suffix }}"
                     uninterpreted="{{ page.result_details.0.uninterpreted }} {{ page.result_details.0.biomarker_suffix }}"
          />
        </column>
      </padding>
    </container>
  </padding>
</show>

<!--? PRODUCTS HEADER-->
<padding left="{{ data(gap).x4 }}" right="{{ data(gap).x4 }}" bottom="{{ data(gap).x3 }}">
  <column crossAxisAlignment="start">
    <component id="text.h3" text="{{ page.tests_title }}" color="{{ page.on_surface_color }}"/>
    <divider height="{{ data(gap).x2 }}"/>
    <component id="text.body" text="{{ page.tests_subtitle }}" color="{{ page.on_surface_color }}"/>
  </column>
</padding>

<!--? PRODUCTS SLIDERS-->
<for valueName="group" in="{{ page.test_groups }}">
  <padding bottom="{{ data(gap).x5 }}">
    <column crossAxisAlignment="start">
      <padding left="{{ data(gap).x4 }}" right="{{ data(gap).x4 }}" bottom="{{ data(gap).x4 }}">
        <component id="text.sub1" text="{{ cycle.group.title }}" color="{{ page.primary_dark_color }}"/>
      </padding>
      <stack>
        <positioned left="0" top="60" right="0" bottom="0">
          <container color="{{ page.background_color }}">
          </container>
        </positioned>
        <sizedBox height="280">
          <listView axis="horizontal">
            <for valueName="product" indexName="productIndex" in="{{ cycle.group.products }}">
              <!--! Let's add more blablabla here-->
              <!--? For every not-first item we will add right padding-->
              <show show="{{ cycle.productIndex }}">
                <padding right="{{ data(gap).x3 }}">
                  <component id="card.product"
                             title="{{ cycle.product.title }}"
                             image="{{ cycle.product.image }}"
                             price="{{ cycle.product.price }}"
                             deeplink="{{ cycle.product.link }}"/>
                </padding>
              </show>
              <!--? And for the first product in slider we also add left padding-->
              <show notShow="{{ cycle.productIndex }}">
                <padding left="{{ data(gap).x3 }}" right="{{ data(gap).x3 }}">
                  <component id="card.product"
                             title="{{ cycle.product.title }}"
                             image="{{ cycle.product.image }}"
                             price="{{ cycle.product.price }}"
                             deeplink="{{ cycle.product.link }}"/>
                </padding>
              </show>

            </for>
          </listView>
        </sizedBox>
      </stack>
      <container color="{{ page.background_color }}">
        <padding left="{{ data(gap).x4 }}" top="{{ data(gap).x5 }}" right="{{ data(gap).x4 }}"
                 bottom="{{ data(gap).x5 }}">
          <component id="button.primary"
                     title="{{ cycle.group.button_title }}"
                     deeplink="{{ cycle.group.button_link }}"
                     titleAlign="center"/>
        </padding>
      </container>
    </column>
  </padding>
</for>

<divider height="{{ data(gap).x6 }}"/>
''';
