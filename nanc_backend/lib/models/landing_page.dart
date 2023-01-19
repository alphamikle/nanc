import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';
import 'package:nanc_backend/models/image.dart';

final Model landingPage = Model(
  name: 'Landing page',
  isCollection: false,
  icon: IconPackNames.flu_document_page_break_regular,
  fields: [
    [
      IdField(),
    ],

    /// ? COLORS
    [
      HeaderField(name: 'Colors Header', content: 'Colors / Fonts', contentIcon: 'flu_color_regular'),
    ],
    [
      ColorField(name: 'Royal Blue Color', isRequired: true),
      ColorField(name: 'Grey Color', isRequired: true),
      ColorField(name: 'White Color', isRequired: true),
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
      StringField(name: 'Top Block Text', isRequired: true, maxLines: 2),
      StringField(name: 'About Text', isRequired: true, maxLines: 2),
    ],
    [
      StringField(name: 'Interface Text', isRequired: true, maxLines: 2),
      StringField(name: 'Middle Download Block Text', isRequired: true, maxLines: 2),
    ],
    [
      StringField(name: 'How To Use Text', isRequired: true, maxLines: 3),
      StringField(name: 'Team Text', isRequired: true, maxLines: 3),
      StringField(name: 'Customers Text', isRequired: true, maxLines: 3),
    ],

    /// ? IMAGES
    [
      StructuredField(
        name: 'Images',
        structure: [
          SelectorField(name: 'Image', model: image, titleField: 'title', structure: SelectorFieldStructure.object),
        ],
      ),
    ],

    /// ! DIVIDER
    [
      ScreenField(name: 'Screen'),
    ],
    // [
    //   StringField(name: 'Header', maxLines: 1, isRequired: true),
    //   StringField(name: 'Subtitle', maxLines: 2, isRequired: true),
    // ],
    // [
    //   StringField(name: 'App Buttons Header', maxLines: 2, isRequired: true),
    // ],
    // [
    //   StructuredField(
    //     name: 'Stores',
    //     structure: [
    //       StringField(name: 'Image', maxLines: 1),
    //       ColorField(name: 'Color'),
    //       StringField(name: 'Link', maxLines: 1),
    //     ],
    //   ),
    // ],
    // [
    //   StructuredField(name: 'Images', structure: [StringField(name: 'Image')]),
    // ],
    // [
    //   StringField(name: 'About App Header', maxLines: 1),
    //   StringField(name: 'About App Subtitle', maxLines: 1),
    // ],
    // [
    //   StructuredField(
    //     name: 'Bullets',
    //     structure: [
    //       StringField(name: 'Title', maxLines: 1),
    //       StringField(name: 'Description', maxLines: 1),
    //       StringField(name: 'Link', maxLines: 1),
    //     ],
    //   ),
    // ],
    // [
    //   StructuredField(
    //     name: 'Features',
    //     structure: [
    //       StringField(name: 'Title', maxLines: 1),
    //       StringField(name: 'Description', maxLines: 1),
    //       StringField(name: 'Image', maxLines: 1),
    //     ],
    //   ),
    // ],
    // [
    //   StringField(name: 'Interface Header', maxLines: 1, isRequired: true),
    //   StringField(name: 'Interface Description', maxLines: 1, isRequired: true),
    // ],
    // [
    //   StructuredField(
    //     name: 'Gallery',
    //     structure: [
    //       StringField(name: 'Image', isRequired: true),
    //     ],
    //   ),
    // ],
    // [
    //   StructuredField(
    //     name: 'Statistics',
    //     structure: [
    //       IconField(name: 'Icon', isRequired: true),
    //       NumberField(name: 'Value', isRequired: true),
    //       StringField(name: 'Title', maxLines: 1, isRequired: true),
    //     ],
    //   ),
    // ],
    // [
    //   StringField(name: 'App Using Header', maxLines: 1, isRequired: true),
    //   StringField(name: 'App Using Description', maxLines: 1, isRequired: true),
    // ],
    // [
    //   StringField(name: 'About Team Header', maxLines: 1, isRequired: true),
    //   StringField(name: 'About Team Description', maxLines: 1, isRequired: true),
    // ],
    // [
    //   StructuredField(
    //     name: 'Team Members',
    //     structure: [
    //       SelectorField(name: 'Team Member', model: developer, titleField: 'name', structure: SelectorFieldStructure.object),
    //     ],
    //   ),
    // ],
    // [
    //   StringField(name: 'Reviews Header', maxLines: 1, isRequired: true),
    //   StringField(name: 'Reviews Description', maxLines: 1, isRequired: true),
    // ],
    // [
    //   MultiSelectorField(
    //     name: 'Reviews',
    //     model: review,
    //     titleField: 'customer_name',
    //     structure: MultiSelectorFieldStructure.thirdTable,
    //     thirdTable: ThirdTable(
    //       relationsEntity: pageReviewRelations,
    //       childEntityIdName: 'review_id',
    //       parentEntityIdName: 'page_id',
    //     ),
    //   ),
    // ],
    // [
    //   StringField(name: 'Blog Header', maxLines: 1, isRequired: true),
    //   StringField(name: 'Blog Description', maxLines: 1, isRequired: true),
    // ],
    // [
    //   StringField(name: 'Email', maxLines: 1, isRequired: true),
    //   StringField(name: 'Phone', maxLines: 1, isRequired: true),
    // ],
  ],
);
