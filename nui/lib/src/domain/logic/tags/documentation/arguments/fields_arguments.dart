import '../../tag_description.dart';
import '../documentation_types.dart';

TagArgument autovalidateModeArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.autovalidateModeValues);

TagArgument textInputTypeArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.textInputTypeEnumValues);

TagArgument textCapitalizationArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.textCapitalizationValues);

TagArgument textInputActionArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.textInputActionValues);

TagArgument inputBorderTypeArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.inputBorderTypeValues);

TagArgument borderStyleArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.borderStyleValues);

TagArgument strokeAlignArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.strokeAlignEnumValues);

TagArgument switchStyleArgument({String name = 'style'}) => TagArgument(name: name, values: DocumentationTypes.switchStyleValues);
