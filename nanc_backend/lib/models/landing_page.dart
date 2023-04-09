import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

import 'developer.dart';
import 'image.dart';

final Model landingPage = Model(
  name: 'Landing page',

  /// ? id in format [toSnakeCase(name)] will be set automatically, if omitted
  // id: 'landing_page',
  isCollection: false,
  icon: IconPackNames.flu_document_page_break_regular,
  fields: [
    [
      IdField(),
    ],

    /// ? SCREEN
    [
      HeaderField(name: 'Screen Header', content: 'Page Interface', contentIcon: 'flu_phone_regular'),
    ],
    [
      ScreenField(name: 'Screen'),
    ],

    /// ? COLORS AND FONTS
    [
      HeaderField(name: 'Colors Header', content: 'Colors / Fonts', contentIcon: 'flu_color_regular'),
    ],
    [
      ColorField(name: 'Royal Blue Color', isRequired: true),
      ColorField(name: 'Grey Color', isRequired: true),
      ColorField(name: 'White Color', isRequired: true),
    ],
    [
      ColorField(name: 'Black Color', isRequired: true),
      StringField(name: 'Font Family', isRequired: true, maxLines: 1),
    ],

    /// ? STORES
    [
      HeaderField(name: 'App Stores Header', content: 'Google Play / App Store', contentIcon: 'mdi_google_play'),
    ],
    [
      StringField(name: 'Google Play Badge', isRequired: true, maxLines: 1),
      StringField(name: 'App Store Badge', isRequired: true, maxLines: 1),
    ],
    [
      StringField(name: 'Google Play Link', isRequired: true, maxLines: 1),
      StringField(name: 'App Store Link', isRequired: true, maxLines: 1),
    ],

    /// ? HEADERS
    [
      HeaderField(name: 'Headers Header', content: 'Headers', contentIcon: 'flu_document_header_regular'),
    ],
    [
      StringField(name: 'Main Header', isRequired: true, maxLines: 1),
      StringField(name: 'Download Apps Header', isRequired: true, maxLines: 1),
      StringField(name: 'About Header', isRequired: true, maxLines: 1),
    ],
    [
      StringField(name: 'Features Header', isRequired: true, maxLines: 1),
      StringField(name: 'Interface Header', isRequired: true, maxLines: 1),
      StringField(name: 'How To Use Header', isRequired: true, maxLines: 1),
    ],
    [
      StringField(name: 'Team Header', isRequired: true, maxLines: 1),
      StringField(name: 'Customers Header', isRequired: true, maxLines: 1),
    ],

    /// ? LARGE TEXT CONTENT
    [
      HeaderField(name: 'Large Text Header', content: 'Text Content', contentIcon: 'flu_slide_text_regular'),
    ],
    [
      StringField(name: 'Top Block Text', isRequired: true, maxLines: 4),
      StringField(name: 'About Text', isRequired: true, maxLines: 4),
    ],
    [
      StringField(name: 'Features Text', isRequired: true, maxLines: 4),
      StringField(name: 'Interface Text', isRequired: true, maxLines: 4),
    ],
    [
      StringField(name: 'Middle Download Block Text', isRequired: true, maxLines: 4),
      StringField(name: 'How To Use Text', isRequired: true, maxLines: 4),
    ],
    [
      StringField(name: 'Team Text', isRequired: true, maxLines: 4),
      StringField(name: 'Customers Text', isRequired: true, maxLines: 4),
    ],

    /// ? IMAGES
    [
      HeaderField(name: 'Images Header', content: 'Images', contentIcon: 'flu_image_multiple_regular'),
    ],
    [
      StructuredField(
        name: 'Images',
        structure: [
          SelectorField(
            name: 'Image',
            model: image,
            titleFields: const [
              ExternalField.id('title'),
            ],
          ),
        ],
      ),
    ],

    /// ? BULLETS
    [
      HeaderField(name: 'Bullets Header', content: 'Bullets', contentIcon: 'flu_text_bullet_list_ltr_filled'),
    ],
    // TODO(alphamikle): Fix it
    // [
    //   MultiSelectorField(
    //     name: 'Bullets',
    //     model: bullet,
    //     titleFields: const [
    //       ExternalField.id('title'),
    //     ],
    //     structure: MultiSelectorFieldStructure.arrayOfObjects,
    //   ),
    // ],

    /// ? FEATURES
    [
      HeaderField(name: 'Features Header', content: 'Features', contentIcon: 'flu_text_bullet_list_ltr_filled'),
    ],
    // TODO(alphamikle): Fix it
    // [
    //   MultiSelectorField(
    //     name: 'Features',
    //     model: feature,
    //     titleFields: const [
    //       ExternalField.id('title'),
    //     ],
    //     structure: MultiSelectorFieldStructure.arrayOfObjects,
    //   ),
    // ],

    /// ? DEVELOPERS
    [
      HeaderField(name: 'Team Header', content: 'Team Members', contentIcon: 'flu_people_team_regular'),
    ],
    [
      StructuredField(
        name: 'Team Members',
        structure: [
          SelectorField(
            name: 'Team Member',
            model: developer,
            titleFields: const [
              ExternalField.id('name'),
              ExternalField.id('second_name'),
            ],
          ),
        ],
      ),
    ],

    /// ? REVIEWS
    [
      HeaderField(name: 'Reviews Header', content: 'Reviews', contentIcon: 'flu_checkmark_starburst_filled'),
    ],
    // TODO(alphamikle): Fix it
    // [
    //   MultiSelectorField(
    //     name: 'Reviews',
    //     model: review,
    //     titleFields: const [
    //       ExternalField.id('customer_name'),
    //       ExternalField.id('customer_lastname'),
    //     ],
    //     structure: MultiSelectorFieldStructure.arrayOfObjects,
    //   ),
    // ],
    [
      HeaderField(name: 'Divider', content: '', useAsDivider: true, contentColor: const Color.fromRGBO(0, 0, 0, 0.497)),
    ],
    [
      DateField(name: 'Updated At', isUpdatedAtField: true),
    ],
  ],
);
