import 'package:highlight/highlight.dart';
import 'package:highlight/src/common_modes.dart';

const bool enableXml = true;
const bool enableMd = true;
const Set<int> mdActivator = {
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
};

final richMarkdown = Mode(
  refs: {
    if (enableXml) ...{
      '~contains~6~contains~0': Mode(
        endsWithParent: true,
        illegal: "<",
        relevance: 0,
        contains: [
          Mode(
            className: "attr",
            begin: "[A-Za-z0-9\\._:-]+",
            relevance: 0,
          ),
          Mode(
            begin: "=\\s*",
            relevance: 0,
            contains: [
              Mode(
                className: "string",
                endsParent: true,
                variants: [
                  Mode(
                    begin: "\"",
                    end: "\"",
                    contains: [
                      Mode(
                        ref: '~contains~3',
                      ),
                    ],
                  ),
                  Mode(
                    begin: "'",
                    end: "'",
                    contains: [
                      Mode(
                        ref: '~contains~3',
                      ),
                    ],
                  ),
                  Mode(begin: "[^\\s\"'=<>`]+")
                ],
              )
            ],
          )
        ],
      ),
      '~contains~3': Mode(
        className: "symbol",
        begin: "&[a-z]+;|&#[0-9]+;|&#x[a-f0-9]+;",
      ),
      '~contains~0~contains~3': Mode(
        begin: "\\(",
        contains: [
          Mode(
            ref: '~contains~0~contains~0~contains~0',
          ),
        ],
        end: "\\)",
      ),
      '~contains~0~contains~2': Mode(
        className: "meta-string",
        begin: "'",
        end: "'",
        illegal: "\\n",
        contains: [BACKSLASH_ESCAPE],
      ),
      '~contains~0~contains~1': Mode(
        className: "meta-string",
        begin: "\"",
        end: "\"",
        illegal: "\\n",
        contains: [BACKSLASH_ESCAPE],
      ),
      '~contains~0~contains~0~contains~0': Mode(
        className: "meta-keyword",
        begin: "#?[a-z_][a-z1-9_-]+",
        illegal: "\\n",
      ),
      '~contains~0~contains~0': Mode(
        begin: "\\s",
        contains: [
          Mode(
            ref: '~contains~0~contains~0~contains~0',
          ),
        ],
      ),
    },
  },
  case_insensitive: true,
  aliases: [
    if (enableMd) ...[
      'md',
      'mkdown',
      'mkd',
    ],
    if (enableXml) ...[
      "html",
      "xhtml",
      "rss",
      "atom",
      "xjb",
      "xsd",
      "xsl",
      "plist",
      "wsf",
      "svg",
    ],
  ],
  contains: [
    /// ? MARKDOWN
    if (enableMd) ...[
      if (mdActivator.contains(0))
        Mode(
          className: 'section',
          variants: [
            Mode(begin: r'^#{1,6}', end: r'$'),
            Mode(begin: r'^.+?\n[=-]{2,}$'),
          ],
        ),
      if (mdActivator.contains(1))
        Mode(
          className: 'bullet',
          begin: r'^\s*([*+-]|(\d+\.))\s+',
        ),
      if (mdActivator.contains(2))
        Mode(
          className: 'strong',
          begin: r'[*_]{2}.+?[*_]{2}',
        ),
      if (mdActivator.contains(3))
        Mode(
          className: 'emphasis',
          variants: [
            Mode(begin: r'\*.+?\*'),
            Mode(begin: '_.+?_', relevance: 0),
          ],
        ),
      if (mdActivator.contains(4))
        Mode(
          className: 'quote',
          begin: r'^>\s+',
          end: r'$',
        ),
      if (mdActivator.contains(5))
        Mode(
          className: 'code',
          variants: [
            Mode(
              begin: '^```\\w*\\s*\$',
              end: '^```[ ]*\$',
            ),
            Mode(begin: '`.+?`'),

            /// ? This rule breaks xml highlighting
            // Mode(
            //   begin: r'^( {4}|\t)',
            //   end: r'$',
            //   relevance: 0,
            // ),
          ],
        ),
      if (mdActivator.contains(6))
        Mode(
          begin: '^[-\\*]{3,}',
          end: '\$',
        ),
      if (mdActivator.contains(7))
        Mode(
          begin: r'\[.+?\][\(\[].*?[\)\]]',
          returnBegin: true,
          contains: [
            Mode(
              className: 'string',
              begin: r'\[',
              end: r'\]',
              excludeBegin: true,
              returnEnd: true,
              relevance: 0,
            ),
            Mode(
              className: 'link',
              begin: r'\]\(',
              end: r'\)',
              excludeBegin: true,
              excludeEnd: true,
            ),
            Mode(
              className: 'symbol',
              begin: r'\]\[',
              end: r'\]',
              excludeBegin: true,
              excludeEnd: true,
            )
          ],
          relevance: 10,
        ),
      if (mdActivator.contains(8))
        Mode(
          begin: '^\\[[^\\n]+\\]:',
          returnBegin: true,
          contains: [
            Mode(
              className: 'symbol',
              begin: '\\[',
              end: '\\]',
              excludeBegin: true,
              excludeEnd: true,
            ),
            Mode(
              className: 'link',
              begin: ':\\s*',
              end: '\$',
              excludeBegin: true,
            ),
          ],
        ),
    ],

    /// ? XML
    if (enableXml) ...[
      Mode(
        className: "meta",
        begin: "<![a-z]",
        end: ">?",
        relevance: 10,
        contains: [
          Mode(ref: '~contains~0~contains~0'),
          Mode(ref: '~contains~0~contains~1'),
          Mode(ref: '~contains~0~contains~2'),
          Mode(ref: '~contains~0~contains~3'),
          Mode(
            begin: "\\[",
            end: "\\]",
            contains: [
              Mode(
                className: "meta",
                begin: "<![a-z]",
                end: ">",
                contains: [
                  Mode(ref: '~contains~0~contains~0'),
                  Mode(ref: '~contains~0~contains~3'),
                  Mode(ref: '~contains~0~contains~1'),
                  Mode(ref: '~contains~0~contains~2'),
                ],
              )
            ],
          )
        ],
      ),
      Mode(
        className: "comment",
        begin: "<!--",
        end: "-->",
        contains: [
          PHRASAL_WORDS_MODE,
          Mode(
            className: "doctag",
            begin: "(?:TODO|FIXME|NOTE|BUG|XXX):",
            relevance: 0,
          ),
        ],
        relevance: 10,
      ),
      Mode(
        begin: "<\\!\\[CDATA\\[",
        end: "\\]\\]>",
        relevance: 10,
      ),
      Mode(ref: '~contains~3'),
      Mode(
        className: "meta",
        begin: "<\\?xml",
        end: "\\?>",
        relevance: 10,
      ),
      Mode(
        className: "tag",
        begin: "<style(?=\\s|>)",
        end: ">",
        keywords: {"name": "style"},
        contains: [
          Mode(ref: '~contains~6~contains~0'),
        ],
        starts: Mode(
          end: "</style>",
          returnEnd: true,
          subLanguage: ["css", "xml"],
        ),
      ),
      Mode(
        className: "tag",
        begin: "<script(?=\\s|>)",
        end: ">",
        keywords: {"name": "script"},
        contains: [
          Mode(ref: '~contains~6~contains~0'),
        ],
        starts: Mode(
          end: "</script>",
          returnEnd: true,
          subLanguage: ["actionscript", "javascript", "handlebars", "xml"],
        ),
      ),
      Mode(
        className: "tag",
        begin: "</?",
        end: "/?>",
        contains: [
          Mode(
            className: "name",
            begin: "[^\\/><\\s]+",
            relevance: 0,
          ),
          Mode(ref: '~contains~6~contains~0'),
        ],
      ),
    ],
  ],
);
