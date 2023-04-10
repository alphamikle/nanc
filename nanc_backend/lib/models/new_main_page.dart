import 'package:fields/fields.dart';
import 'package:model/model.dart';

final Model newMainPageModel = Model(
  name: 'The new main page',
  icon: 'mdi_format_page_split',
  isCollection: false,
  fields: [
    [
      IdField(),
    ],

    /// ? SCREEN UI
    [
      HeaderField(name: 'Screen UI'),
    ],
    [
      ScreenField(name: 'Screen', screenContentType: ScreenContentType.scrollable),
    ],

    /// ? UI PARAMS
    [
      HeaderField(name: 'UI Params'),
    ],
    [
      FontField(name: 'Header Font'),
      FontField(name: 'Body Font'),
    ],
    [
      ColorField(name: 'Primary Dark Color'),
      ColorField(name: 'Primary Light Color'),
      ColorField(name: 'Background Color'),
    ],
    [
      ColorField(name: 'Surface Color'),
      ColorField(name: 'On Surface Color'),
      ColorField(name: 'Card Background Color'),
    ],
    [
      ColorField(name: 'Secondary Light Color'),
      ColorField(name: 'Shadow Color'),
    ],

    /// ? BIOMARKERS COLORS
    [
      HeaderField(name: 'Biomarkers Colors'),
    ],
    [
      ColorField(name: 'In Range Background Color'),
      ColorField(name: 'In Range Dot Color'),
    ],
    [
      ColorField(name: 'Out of Range Background Color'),
      ColorField(name: 'Out of Range Dot Color'),
    ],
    [
      ColorField(name: 'Uninterpreted Background Color'),
      ColorField(name: 'Uninterpreted Dot Color'),
    ],

    /// ? TOP SCREEN HEADER
    [
      HeaderField(name: 'View header'),
    ],
    [
      StringField(name: 'View Title'),
      StringField(name: 'Username'),
      StringField(name: 'View Subtitle'),
    ],

    /// ? SECONDARY HEADER
    [
      HeaderField(name: 'Secondary Header'),
    ],
    [
      StringField(name: 'Secondary Title'),
      StringField(name: 'Secondary Subtitle'),
    ],

    /// ? ACTION BUTTONS
    [
      HeaderField(name: 'Action Buttons'),
    ],
    [
      StructuredField(
        name: 'Action Buttons',
        structure: [
          StringField(name: 'Title'),
          IconField(name: 'Prefix Icon'),
          StringField(name: 'Deeplink'),
        ],
      ),
    ],

    /// ? RESULTS
    [
      HeaderField(name: 'Results'),
    ],
    [
      StringField(name: 'Results Header Title'),
      StringField(name: 'Results Header Button Title'),
    ],
    [
      StringField(name: 'Results Header Button Link'),
      BoolField(name: 'Have results'),
    ],
    [
      StructuredField(
        name: 'Result Details',
        structure: [
          StringField(name: 'Title'),
          StringField(name: 'Date'),
          StringField(name: 'Subtitle'),
          NumberField(name: 'In Range'),
          NumberField(name: 'Out Of Range'),
          NumberField(name: 'Uninterpreted'),
          StringField(name: 'Biomarker Suffix'),
        ],
      ),
    ],

    /// ? TESTS
    [
      HeaderField(name: 'Tests'),
    ],
    [
      StringField(name: 'Tests Title'),
      StringField(name: 'Tests Subtitle'),
    ],
    [
      StructuredField(
        name: 'Test Groups',
        structure: [
          StringField(name: 'Title'),
          StringField(name: 'Button Title'),
          StringField(name: 'Button Link'),
          StructuredField(
            name: 'Products',
            structure: [
              StringField(name: 'Title'),
              StringField(name: 'Image'),
              StringField(name: 'Price'),
              StringField(name: 'Link'),
            ],
          ),
        ],
      ),
    ],
  ],
);
