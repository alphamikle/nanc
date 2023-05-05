import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class CollectionFilterModal extends StatefulWidget {
  const CollectionFilterModal({
    super.key,
  });

  @override
  State<CollectionFilterModal> createState() => _CollectionFilterModalState();
}

class _CollectionFilterModalState extends State<CollectionFilterModal> {
  @override
  Widget build(BuildContext context) {
    return KitModal(
      onClose: context.navigator.pop,
      header: const KitText(text: 'Collection filter'),
      child: Container(
        // height: 100,
        width: 200,
        color: Colors.red,
      ),
    );
  }
}
