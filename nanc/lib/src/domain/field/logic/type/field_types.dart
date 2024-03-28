enum FieldType {
  custom('Custom'),
  field('Field'),
  dateField('Date time'),
  enumField('Enum'),
  iconField('Icon'),
  idField('Id'),
  stringField('String'),
  multiSelectorField('Relations'),
  numberField('Number'),
  queryFilterField('Query filter'),
  queryFilterValueField('Query filter value'),
  selectorField('Relation'),
  boolField('Boolean'),
  dynamicField('Dynamic JSON'),
  structuredField('Structured JSON'),
  structureField('Structure'),
  colorField('String'),
  screenField('String'),
  binaryField('Bytes'),
  headerField('Header'),
  groupField('Group'),
  fontField('String'),
  modelsSelectorField('Model selector'),
  titleFieldsField('Title');
  // TODO(alphamikle): Add new field types here

  final String humanReadableType;

  const FieldType(this.humanReadableType);
}
