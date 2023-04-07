import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model structureFieldExampleModel = Model(
  name: 'Structure Fields',
  icon: IconPackNames.flu_code_block_filled,
  isCollection: false,
  fields: [
    [
      IdField(),
    ],
    [
      StructuredField(
        name: 'Users',
        structure: [
          StringField(name: 'Name'),
          NumberField(name: 'Age'),
          ColorField(name: 'Preferable color'),
          StructuredField(
            name: 'Documents',
            structure: [
              StringField(name: 'Document name'),
              StringField(name: 'Document number'),
              StructuredField(
                name: 'Department',
                structure: [
                  StringField(name: 'Name'),
                  StringField(name: 'Address'),
                ],
              ),
            ],
          ),
        ],
      ),
    ]
  ],
);
