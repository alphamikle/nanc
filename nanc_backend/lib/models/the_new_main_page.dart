import 'package:fields/fields.dart';
import 'package:model/model.dart';

final Model theNewMainPage = Model(
  name: 'Main Page',
  icon: 'flu_home_filled',
  id: 'ivie_main_page_v1',
  isCollection: false,
  fields: [
    [
      IdField(),
    ],

    /// ? UI
    [
      HeaderField(name: 'View'),
    ],
    [
      ScreenField(name: 'Main Page UI'),
    ],

    /// ? View Header
    [
      HeaderField(name: 'View Header'),
    ],
    [
      StringField(name: 'View Title'),
      StringField(name: 'Username'),
      StringField(name: 'View Subtitle'),
    ],

    /// ? Secondary Header
    [
      HeaderField(name: 'Secondary Header'),
    ],
    [
      StringField(name: 'Secondary Title'),
      StringField(name: 'Secondary Subtitle'),
    ],

    /// ? Action Buttons
    [
      HeaderField(name: 'Action Buttons'),
    ],
    [
      StructuredField(
        name: 'Action Buttons',
        structure: [
          StringField(name: 'Title'),
          IconField(name: 'Prefix Icon'),
          IconField(name: 'Suffix Icon'),
          StringField(name: 'Deeplink'),
        ],
      ),
    ],

    /// ? Results
    [
      HeaderField(name: 'Results'),
    ],
    [
      StringField(name: 'Results Header Title'),
      StringField(name: 'Results Header Button Title'),
      StringField(name: 'Results Header Button Deeplink'),
    ],
    [
      StructuredField(
        name: 'Results Details',
        structure: [
          StringField(name: 'Title'),
          StringField(name: 'Date'),
          StringField(name: 'Subtitle'),
          StringField(name: 'Doctor'),
          NumberField(name: 'In Range'),
          NumberField(name: 'Out of Range'),
          NumberField(name: 'Uninterpreted'),
          StringField(name: 'Biomarkers Suffix'),
        ],
      ),
    ],

    /// ? Tests
    [
      HeaderField(name: 'Tests'),
    ],
    [
      StringField(name: 'Tests Title'),
      StringField(name: 'Tests Subtitle'),
    ],
    [
      StructuredField(
        name: 'Tests Groups',
        structure: [
          StringField(name: 'Title'),
          StringField(name: 'Button Title'),
          StringField(name: 'Button Deeplink'),
          StructuredField(
            name: 'Products',
            structure: [
              StringField(name: 'Title'),
              StringField(name: 'Image Path'),
              StringField(name: 'Price'),
              StringField(name: 'Deeplink'),
            ],
          ),
        ],
      ),
    ]
  ],
);
