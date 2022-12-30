import 'package:flutter/cupertino.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';

TagRenderer defaultElementsRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_language_markdown,
    tag: 'markdown',
    pattern: RegExp(''),
    endPattern: null,
    example: '''
# Default markdown elements

Here is described a default set of markdown elements,
which can be used for simple content showing - fast
and simple way for content creation

---

# Heading - level 1 (H1)

## Heading - level 2 (H2)

### Heading - level 3 (H3)

#### Heading - level 4 (H4)

##### Heading - level 5 (H5)

###### Heading - level 6 (H6)

---

This is a **bold text** inside of usual text

---

This is a *italic text* inside of usual text

---

> This is a blockquote. There a can be a many different text content, which can be multiline or not

---

This is an ordered list:
1. First element
2. Second element
3. Third element

---

This is an unordered list:
- First element
- Second element
- Third element

---

This is a `code` block inside usual text - we `can styled it as we want`

---

[This is a link](https://google.com)

---

This is an image

![This is a image text](https://i.pinimg.com/564x/e7/8f/6d/e78f6db028b37bd0254b63fc027f4020.jpg)

---


```
This is a fenced code block

With json, for example:

{
  "field": 123
}
```

---

And here is ~~an example of~~ crossed out words

---

This is a checkboxes list

- [x] Write the press release
- [ ] Update the website
- [ ] Contact the media

''',
    builder: (BuildContext context, md.Element element, RichRenderer renderer) => const SizedBox.shrink(),
  );
}
