// import 'package:fields/src/domain/fields/logic/multi_selector_field/multi_selector_field.dart';
// import 'package:fields/src/domain/fields/logic/selector_field/title_fields.dart';
// import 'package:fields/src/domain/fields/ui/field_cell_mixin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:model/model.dart';
// import 'package:tools/tools.dart';
//
// class MultiSelectorFieldCellState<T extends FieldCellWidget<MultiSelectorField>> extends State<T> with FieldCellHelper<MultiSelectorField, T> {
//   final FocusNode focusNode = FocusNode();
//
//   String get eventBusId => [
//         runtimeType.toString(),
//         model.id,
//         model.idField.id,
//         ...titleFields.toFieldsIds(),
//         structure.name,
//       ].join();
//
//   List<TitleField> get titleFields => field.titleFields;
//   Model get model => field.model;
//   MultiSelectorFieldStructure get structure => field.structure;
//   late final EventBus eventBus = context.read();
//
//   bool isPreloading = false;
//
//   Future<void> selectFields() async {
//     focusNode.requestFocus();
//     final List<String>? result = await showDialog<List<String>>(
//       context: context,
//       builder: (BuildContext context) => MultiSelectorModal(
//         field: field,
//         selectedIds: getSelectedIds(),
//       ),
//       barrierDismissible: false,
//     );
//     if (result != null) {
//       pageBloc.updateValue(fieldId, result);
//       await preload();
//     }
//   }
//
//   Future<void> preload() async {
// TODO(alphamikle): Temporary fix of the problem with changing state during a build process
//     await wait(duration: const Duration(milliseconds: 50));
//     if (mounted) {
//       controller.text = kLoadingText;
//       safeSetState(() => isPreloading = true);
//       final List<Json> childrenEntities = await context.read<PageListProviderInterface>().fetchPageList(
//             model: model,
//             subset: [
//               model.idField.id,
//               ...titleFields.toFieldsIds(),
//             ],
//             params: ParamsDto(
//               page: 1,
//               limit: 50,
//               sort: Sort(field: model.idField.id, order: Order.asc),
//             ),
//             query: QueryDto(
//               multipleValues: [
//                 QueryMultipleParameter(
//                   name: model.idField.id,
//                   values: getSelectedIds().map((String id) => QueryStringValue(id)).toList(),
//                 ),
//               ],
//             ),
//           );
//       final String resultTitle = childrenEntities.map((Json row) => titleFields.toTitleSegments(row).join()).join(' | ');
//       controller.text = resultTitle;
//       if (mounted) {
//         safeSetState(() => isPreloading = false);
//       }
//     }
//   }
//
//   Future<void> saveEventHandler(Model entity) => preload();
//
//   @override
//   void initState() {
//     super.initState();
//     unawaited(preload());
//     eventBus.onEvent(consumer: eventBusId, eventId: PageEvents.save, handler: saveEventHandler);
//   }
//
//   @override
//   void dispose() {
//     eventBus.unsubscribeFromEvent(consumer: eventBusId, eventId: PageEvents.save);
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return KitShimmerSwitcher(
//       showShimmer: isPreloading,
//       child: KitButtonFieldWrapper(
//         onPressed: selectFields,
//         child: KitTextField(
//           controller: controller,
//           helper: helper,
//           placeholder: 'Tap to choose...',
//           readOnly: true,
//           maxLines: 1,
//           isChanged: pageBloc.fieldWasChanged(fieldId),
//           focusNode: focusNode,
//           isRequired: field.isRequired,
//         ),
//       ),
//     );
//   }
// }
