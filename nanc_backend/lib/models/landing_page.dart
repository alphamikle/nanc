import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';
import 'package:nanc_backend/models/developer.dart';
import 'package:nanc_backend/models/page_review_relations.dart';
import 'package:nanc_backend/models/review.dart';

final Model landingPage = Model(
  name: 'Landing page',
  icon: IconPackNames.flu_document_page_break_regular,
  fields: [
    [
      IdField(),
      StringField(name: 'Header', maxLines: 1, isRequired: true),
    ],
    [
      StringField(name: 'Subtitle', maxLines: 2, isRequired: true),
    ],
    [
      StringField(name: 'App Buttons Header', maxLines: 2, isRequired: true),
    ],
    [
      StructuredField(
        name: 'Stores',
        structure: [
          StringField(name: 'Image', maxLines: 1),
          ColorField(name: 'Color'),
          StringField(name: 'Link', maxLines: 1),
        ],
      ),
    ],
    [
      StructuredField(name: 'Images', structure: [StringField(name: 'Image')]),
    ],
    [
      StringField(name: 'About App Header', maxLines: 1),
      StringField(name: 'About App Subtitle', maxLines: 1),
    ],
    [
      StructuredField(
        name: 'Bullets',
        structure: [
          StringField(name: 'Title', maxLines: 1),
          StringField(name: 'Description', maxLines: 1),
          StringField(name: 'Link', maxLines: 1),
        ],
      ),
    ],
    [
      StructuredField(
        name: 'Features',
        structure: [
          StringField(name: 'Title', maxLines: 1),
          StringField(name: 'Description', maxLines: 1),
          StringField(name: 'Image', maxLines: 1),
        ],
      ),
    ],
    [
      StringField(name: 'Interface Header', maxLines: 1, isRequired: true),
      StringField(name: 'Interface Description', maxLines: 1, isRequired: true),
    ],
    [
      StructuredField(
        name: 'Gallery',
        structure: [
          StringField(name: 'Image', isRequired: true),
        ],
      ),
    ],
    [
      StructuredField(
        name: 'Statistics',
        structure: [
          IconField(name: 'Icon', isRequired: true),
          NumberField(name: 'Value', isRequired: true),
          StringField(name: 'Title', maxLines: 1, isRequired: true),
        ],
      ),
    ],
    [
      StringField(name: 'App Using Header', maxLines: 1, isRequired: true),
      StringField(name: 'App Using Description', maxLines: 1, isRequired: true),
    ],
    [
      StringField(name: 'About Team Header', maxLines: 1, isRequired: true),
      StringField(name: 'About Team Description', maxLines: 1, isRequired: true),
    ],
    [
      StructuredField(
        name: 'Team Members',
        structure: [
          SelectorField(name: 'Team Member', model: developer, titleField: 'name', structure: SelectorFieldStructure.object),
        ],
      ),
    ],
    [
      StringField(name: 'Reviews Header', maxLines: 1, isRequired: true),
      StringField(name: 'Reviews Description', maxLines: 1, isRequired: true),
    ],
    [
      MultiSelectorField(
        name: 'Reviews',
        model: review,
        titleField: 'customer_name',
        structure: MultiSelectorFieldStructure.thirdTable,
        thirdTable: ThirdTable(
          relationsEntity: pageReviewRelations,
          childEntityIdName: 'review_id',
          parentEntityIdName: 'page_id',
        ),
      ),
    ],
    [
      StringField(name: 'Blog Header', maxLines: 1, isRequired: true),
      StringField(name: 'Blog Description', maxLines: 1, isRequired: true),
    ],
    [
      StringField(name: 'Email', maxLines: 1, isRequired: true),
      StringField(name: 'Phone', maxLines: 1, isRequired: true),
    ],
  ],
);
