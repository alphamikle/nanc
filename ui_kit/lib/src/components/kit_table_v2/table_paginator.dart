import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';

import '../../../ui_kit.dart';

const double kPaginatorHeight = 50;
const double kPaginatorButtonWidth = 50;
const int kVisiblePages = 7;
final int kMiddlePageIndex = (kVisiblePages / 2).round();
final int kMiddlePageIndexLower = (kVisiblePages / 2).floor();

final Map<String, String> _numberToIcon = {
  '0': String.fromCharCode(IconPack.mdi_numeric_0.codePoint),
  '1': String.fromCharCode(IconPack.mdi_numeric_1.codePoint),
  '2': String.fromCharCode(IconPack.mdi_numeric_2.codePoint),
  '3': String.fromCharCode(IconPack.mdi_numeric_3.codePoint),
  '4': String.fromCharCode(IconPack.mdi_numeric_4.codePoint),
  '5': String.fromCharCode(IconPack.mdi_numeric_5.codePoint),
  '6': String.fromCharCode(IconPack.mdi_numeric_6.codePoint),
  '7': String.fromCharCode(IconPack.mdi_numeric_7.codePoint),
  '8': String.fromCharCode(IconPack.mdi_numeric_8.codePoint),
  '9': String.fromCharCode(IconPack.mdi_numeric_9.codePoint),
};

class TablePaginator extends StatefulWidget {
  const TablePaginator({
    required this.currentPage,
    required this.totalPages,
    required this.perPage,
    required this.onPagination,
    super.key,
  });

  final int currentPage;
  final int totalPages;
  final int perPage;
  final ValueSetter<int> onPagination;

  @override
  State<TablePaginator> createState() => _TablePaginatorState();
}

class _TablePaginatorState extends State<TablePaginator> {
  final ScrollController pagesController = ScrollController();

  int get currentPage => widget.currentPage;
  int get totalPages => widget.totalPages;
  bool get prevActive => widget.currentPage > 1;
  bool get nextActive => widget.currentPage < widget.totalPages;
  int get visiblePages => min(kVisiblePages, widget.totalPages);

  Widget pageBuilder(BuildContext context, int index) {
    final int pageNumber = index + 1;
    final bool isActive = currentPage == pageNumber;

    return SizedBox(
      width: kPaginatorButtonWidth,
      child: KitTextIndicatedButton(
        isActive: isActive,
        borderRadius: BorderRadius.zero,
        gap: 10,
        padding: EdgeInsets.zero,
        onPressed: () => pagePressedHandler(pageNumber),
        child: KitText(
          text: numberToIconString(pageNumber),
          style: TextStyle(
            inherit: false,
            color: isActive ? context.theme.colorScheme.tertiary : context.theme.textTheme.titleMedium?.color?.withOpacity(0.6),
            fontSize: 30,
            fontFamily: IconPack.mdi_numeric_0.fontFamily,
            package: IconPack.mdi_numeric_0.fontPackage,
            letterSpacing: -18,
          ),
        ),
      ),
    );
  }

  String numberToIconString(int number) {
    final List<String> chars = number.toString().split('');
    return chars.map((String it) => _numberToIcon[it]!).join();
  }

  void prevHandler() => pagePressedHandler(currentPage - 1);

  void nextHandler() => pagePressedHandler(currentPage + 1);

  void pagePressedHandler(int pageNumber) {
    final double maxOffset = pagesController.position.maxScrollExtent;
    double newOffset = (pageNumber - kMiddlePageIndex) * kPaginatorButtonWidth;
    if (newOffset < 0) {
      newOffset = 0;
    }
    if (newOffset > maxOffset) {
      newOffset = maxOffset;
    }
    unawaited(pagesController.animateTo(newOffset, duration: const Duration(milliseconds: 250), curve: Curves.easeInOut));
    widget.onPagination(pageNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(Gap.regular),
        boxShadow: [
          BoxShadow(
            color: context.theme.colorScheme.shadow,
            spreadRadius: -10,
            blurRadius: 12,
          ),
        ],
      ),
      width: kPaginatorButtonWidth * (visiblePages + 2),
      height: kPaginatorHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: kPaginatorButtonWidth,
            child: KitInkWell(
              onPressed: prevActive ? prevHandler : null,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Gap.regular),
                bottomLeft: Radius.circular(Gap.regular),
              ),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: prevActive ? 1 : 0.5,
                child: Icon(
                  IconPack.flu_caret_left_filled,
                  size: 30,
                  color: context.theme.textTheme.bodyMedium?.color,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: pageBuilder,
              scrollDirection: Axis.horizontal,
              controller: pagesController,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.totalPages,
            ),
          ),
          SizedBox(
            width: kPaginatorButtonWidth,
            child: KitInkWell(
              onPressed: nextActive ? nextHandler : null,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(Gap.regular),
                bottomRight: Radius.circular(Gap.regular),
              ),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: nextActive ? 1 : 0.5,
                child: Icon(
                  IconPack.flu_caret_right_filled,
                  size: 30,
                  color: context.theme.textTheme.bodyMedium?.color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
