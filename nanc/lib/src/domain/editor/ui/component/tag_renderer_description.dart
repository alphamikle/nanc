import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:nui/nui.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../ui_kit/domain/logic/constants/gap.dart';

class TagRendererDescription extends StatelessWidget {
  const TagRendererDescription({
    required this.tagName,
    required this.withChildren,
    required this.description,
    super.key,
  });

  final String tagName;
  final bool withChildren;
  final TagDescription description;

  void _handleLinkTap(String text, String? href, String title) {
    logInfo('Handle link tap: text: $text, href: $href, title: $title');
    if (href != null) {
      unawaited(launchUrl(Uri.parse(href), mode: LaunchMode.externalApplication));
    }
  }

  List<String> buildArgumentCode(String tagName, TagArgument argument) {
    final List<String> exampleCode = [
      '<$tagName ${argument.name}="${argument.values.join(' | ')}" ..... ',
    ];
    if (withChildren) {
      exampleCode[0] = '${exampleCode.last}>';
      exampleCode.addAll([
        if (description.properties.isNotEmpty) '  <!-- Properties -->',
        '  <!-- Children / child widgets -->',
        '</$tagName>',
      ]);
    } else {
      exampleCode[0] = '${exampleCode.last}/>';
    }
    return exampleCode;
  }

  List<String> buildAliasCode(String tagName, TagAlias alias) {
    List<String> aliasCode(int index) => [
          '  <alias name="${alias.name}">',
          '    <someWidget${index == 0 ? '' : index.toString()}/>',
          '  </alias>',
        ];

    return [
      '<$tagName ..... >',
      ...aliasCode(0),
      if (alias.multiple) ...[
        '  .....',
        ...aliasCode(2),
        '  .....',
        ...aliasCode(3),
      ],
      if (description.properties.isNotEmpty) '  <!-- Properties -->',
      '  <!-- Children / child widgets -->',
      '</$tagName>',
    ];
  }

  Widget buildArgument(String tagName, TagArgument argument) {
    final List<String> exampleCode = buildArgumentCode(tagName, argument);

    return Padding(
      padding: const EdgeInsets.only(bottom: Gap.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Gap.regular),
            child: MarkdownBody(
              data: '### **${argument.name}**',
              onTapLink: _handleLinkTap,
            ),
          ),
          if (argument.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: Gap.regular),
              child: MarkdownBody(
                data: argument.description,
                onTapLink: _handleLinkTap,
              ),
            ),
          HighlightView(
            exampleCode.join('\n'),
            language: 'html',
            theme: githubTheme,
            textStyle: const TextStyle(fontSize: 16),
            padding: const EdgeInsets.all(12),
          ),
        ],
      ),
    );
  }

  Widget buildAlias(String tagName, TagAlias alias) {
    final List<String> exampleCode = buildAliasCode(tagName, alias);

    return Padding(
      padding: const EdgeInsets.only(bottom: Gap.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Gap.regular),
            child: MarkdownBody(
              data: '### **${alias.name}**',
              onTapLink: _handleLinkTap,
            ),
          ),
          if (alias.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: Gap.regular),
              child: MarkdownBody(
                data: alias.description,
                onTapLink: _handleLinkTap,
              ),
            ),
          HighlightView(
            exampleCode.join('\n'),
            language: 'html',
            theme: githubTheme,
            textStyle: const TextStyle(fontSize: 16),
            padding: const EdgeInsets.all(12),
          ),
        ],
      ),
    );
  }

  List<String> buildPropertyCode(String parentTagName, TagProperty property, [int level = 0]) {
    final List<String> exampleCode = [
      '<$parentTagName ..... >',
    ];
    final List<String> propertyArgumentsCode = [];

    for (final TagArgument argument in property.arguments) {
      propertyArgumentsCode.addAll([
        '${argument.name}="${argument.values.join(' | ')}"',
      ]);
    }

    exampleCode.addAll([
      '  <prop:${property.name} ${propertyArgumentsCode.join(' ')}${property.withChildren ? '>' : '/>'}',
    ]);

    if (property.withChildren) {
      exampleCode.addAll([
        '    <!-- Children properties -->',
        '  </prop:${property.name}>',
        '</$parentTagName>',
      ]);
    } else {
      exampleCode.addAll([
        '</$parentTagName>',
      ]);
    }

    return exampleCode;
  }

  List<Widget> buildProperty(String tagName, TagProperty property, [String parentPropertyName = '']) {
    final List<Widget> result = [];
    result.add(
      Padding(
        padding: const EdgeInsets.only(bottom: Gap.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: Gap.regular),
              child: MarkdownBody(
                data: '### ${parentPropertyName.isEmpty ? '' : '**$parentPropertyName** - '}**${property.name}**',
                onTapLink: _handleLinkTap,
              ),
            ),
            if (property.description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: Gap.regular),
                child: MarkdownBody(
                  data: property.description,
                  onTapLink: _handleLinkTap,
                ),
              ),
            HighlightView(
              buildPropertyCode(tagName, property).join('\n'),
              language: 'html',
              theme: githubTheme,
              textStyle: const TextStyle(fontSize: 16),
              padding: const EdgeInsets.all(12),
            ),
          ],
        ),
      ),
    );
    for (final TagProperty childProperty in property.properties) {
      result.addAll(buildProperty('$kPropertyPrefix${property.name}', childProperty, property.name));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// ? DESCRIPTION
        MarkdownBody(
          data: description.description,
          onTapLink: _handleLinkTap,
        ),

        /// ? ARGUMENTS
        if (description.arguments.isNotEmpty)
          const Padding(
            padding: EdgeInsets.only(top: Gap.large, bottom: Gap.large),
            child: MarkdownBody(
              data: '''
## Arguments

An argument is a widget parameter or a widget property. The argument value specifies the type of value to accept, or lists the possible values in case only they can be used.

Most of the Arguments are optional and may be omitted, unless otherwise stated.

For example:

```
<widget argumentName="argumentValue" ..... >
  <!-- Something else -->
</widget>
```

**"....."** means the rest of arguments of the widget
''',
            ),
          ),
        for (final TagArgument argument in description.arguments) buildArgument(tagName, argument),

        /// ? ALIASES
        if (description.aliases.isNotEmpty)
          const Padding(
            padding: EdgeInsets.only(top: Gap.large, bottom: Gap.large),
            child: MarkdownBody(
              data: '''
## Aliases

A special widget used to retrieve named argument widgets.
For example, `SliverAppBar` widget has several named widget descendants: `title`, `leading` etc.
To be able to get a specific widget by its name-location, we need the `alias` tag.
Also, you can specify several aliases with the same name and then retrieve them all, in this case you will get a list of widgets.
''',
            ),
          ),
        for (final TagAlias alias in description.aliases) buildAlias(tagName, alias),

        /// ? PROPERTIES
        if (description.properties.isNotEmpty)
          const Padding(
            padding: EdgeInsets.only(top: Gap.large, bottom: Gap.large),
            child: MarkdownBody(
              data: '''
## Properties

A property is a more complex type of argument for widgets (or other properties). If the widget parameter to be configured is not a scalar type or enum, but a class - then it forms a property parameter.

All the Properties are optional and may be omitted.

For example:

```
<widget ..... >
  <prop:propertyWithoutChildrenProperties ..... />
  <prop:propertyWithChildrenProperties ..... >
    <prop:childProperty ..... />
    <prop:anotherChildProperty ..... >
      <!-- etc. -->
    </prop:anotherChildProperty>
  </prop:propertyWithChildrenProperties>
</widget>
```

**"....."** means the rest of arguments of the widget or property
''',
            ),
          ),
        for (final TagProperty property in description.properties) ...buildProperty(tagName, property),
      ],
    );
  }
}
