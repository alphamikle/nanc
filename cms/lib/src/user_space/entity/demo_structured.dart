import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model demoStructured = Model(
  name: 'Structured',
  icon: IconPackNames.mdi_numeric_2,
  fields: [
    [
      IdField(),
    ],
    [
      StructuredField(
        name: 'Single structured field',
        singleObject: true,
        structure: [
          IdField(),
          StringField(name: 'String'),
          NumberField(name: 'Number'),
          ColorField(name: 'Color'),
          StructuredField(
            name: 'Document',
            singleObject: true,
            structure: [
              FontField(name: 'Document font'),
              StringField(name: 'Document name'),
              NumberField(name: 'Document issue date'),
              StructuredField(
                name: 'Departments',
                structure: [
                  ColorField(name: 'Department color'),
                  DateTimeField(name: 'Department date'),
                ],
              ),
            ],
          ),
        ],
      ),
    ]
  ],
);
