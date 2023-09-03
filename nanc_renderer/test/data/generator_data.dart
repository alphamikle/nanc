import 'dart:convert';

import 'package:nanc_renderer/nanc_renderer.dart';

final List<TagNode> testTagNodes = listOfTagNodesFromJson(jsonDecode(r'''
[
  {
    "type": "widget",
    "tag": "data",
    "children": [],
    "attributes": {
      "namespace": "colors",
      "primary": "#FF0B59D5",
      "primaryDarken": "#FF0A50C0",
      "primaryDarkest": "#FF0948AD",
      "secondary": "#FFFFFFFF",
      "secondaryDarken": "#FFCDDEF7",
      "secondaryAccent": "#FFE9F2F9",
      "tertiary": "#FFFCB61A",
      "quaternary": "#FF999999",
      "quaternaryDarken": "#FF696E70",
      "quaternaryLighten": "#FFEEEEEE",
      "text.basic": "#FF000000",
      "text.light": "#FFDCDCDC"
    }
  },
  {
    "type": "widget",
    "tag": "data",
    "children": [],
    "attributes": {
      "namespace": "header",
      "height": "215"
    }
  },
  {
    "type": "widget",
    "tag": "data",
    "children": [],
    "attributes": {
      "namespace": "gap",
      "x1": "4",
      "x2": "8",
      "x3": "16",
      "x4": "24",
      "x5": "32",
      "x6": "48"
    }
  },
  {
    "type": "widget",
    "tag": "data",
    "children": [],
    "attributes": {
      "namespace": "font",
      "main": "DM Sans"
    }
  },
  {
    "type": "widget",
    "tag": "data",
    "children": [],
    "attributes": {
      "namespace": "star",
      "empty": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_empty.svg",
      "half": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_half.svg",
      "full": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_filled.svg"
    }
  },
  {
    "type": "widget",
    "tag": "data",
    "children": [],
    "attributes": {
      "cart.count": "2"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "padding",
        "children": [
          {
            "type": "widget",
            "tag": "row",
            "children": [
              {
                "type": "widget",
                "tag": "show",
                "children": [
                  {
                    "type": "widget",
                    "tag": "sizedBox",
                    "children": [],
                    "attributes": {
                      "width": "{{ data.gap.x3 }}"
                    }
                  }
                ],
                "attributes": {
                  "ifFalse": "{{ template.noPrefix }}"
                }
              },
              {
                "type": "widget",
                "tag": "aspectRatio",
                "children": [
                  {
                    "type": "widget",
                    "tag": "container",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:decoration",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:borderRadius",
                            "children": [],
                            "attributes": {
                              "all": "8"
                            }
                          },
                          {
                            "type": "property",
                            "tag": "prop:shadow",
                            "children": [],
                            "attributes": {
                              "color": "#0F000000",
                              "blurRadius": "8",
                              "offsetY": "4"
                            }
                          }
                        ],
                        "attributes": {}
                      },
                      {
                        "type": "widget",
                        "tag": "column",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "expanded",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "clipRRect",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "image",
                                    "children": [],
                                    "attributes": {
                                      "ref": "{{ template.image }}",
                                      "fit": "cover",
                                      "blurHash": "{{ template.blurHash }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "topLeft": "8",
                                  "topRight": "8"
                                }
                              }
                            ],
                            "attributes": {}
                          },
                          {
                            "type": "widget",
                            "tag": "padding",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "row",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "sizedBox",
                                    "children": [],
                                    "attributes": {
                                      "width": "{{ data.gap.x2 }}"
                                    }
                                  },
                                  {
                                    "type": "widget",
                                    "tag": "column",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "component",
                                        "children": [],
                                        "attributes": {
                                          "id": "subtitle",
                                          "text": "{{ template.title }}"
                                        }
                                      },
                                      {
                                        "type": "widget",
                                        "tag": "component",
                                        "children": [],
                                        "attributes": {
                                          "id": "smallBody",
                                          "text": "{{ template.subtitle }}"
                                        }
                                      }
                                    ],
                                    "attributes": {
                                      "crossAxisAlignment": "start"
                                    }
                                  },
                                  {
                                    "type": "widget",
                                    "tag": "spacer",
                                    "children": [],
                                    "attributes": {}
                                  },
                                  {
                                    "type": "widget",
                                    "tag": "padding",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "sizedBox",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "svg",
                                            "children": [],
                                            "attributes": {
                                              "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/circle_chevron_right.svg"
                                            }
                                          }
                                        ],
                                        "attributes": {
                                          "size": "24"
                                        }
                                      }
                                    ],
                                    "attributes": {
                                      "top": "{{ data.gap.x2 }}",
                                      "right": "{{ data.gap.x2 }}"
                                    }
                                  }
                                ],
                                "attributes": {}
                              }
                            ],
                            "attributes": {
                              "all": "{{ data.gap.x2 }}"
                            }
                          }
                        ],
                        "attributes": {
                          "crossAxisAlignment": "start"
                        }
                      }
                    ],
                    "attributes": {
                      "color": "{{ data.colors.secondary }}"
                    }
                  }
                ],
                "attributes": {
                  "ratio": "1.3"
                }
              },
              {
                "type": "widget",
                "tag": "sizedBox",
                "children": [],
                "attributes": {
                  "width": "{{ data.gap.x3 }}"
                }
              }
            ],
            "attributes": {
              "mainAxisSize": "min"
            }
          }
        ],
        "attributes": {
          "top": "12",
          "bottom": "12"
        }
      }
    ],
    "attributes": {
      "id": "adCard"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "text",
        "children": [
          {
            "type": "property",
            "tag": "prop:textStyle",
            "children": [],
            "attributes": {
              "weight": "w500",
              "height": "1.25",
              "font": "{{ data.font.main }}"
            }
          }
        ],
        "attributes": {
          "text": "{{ template.text }}",
          "size": "18"
        }
      }
    ],
    "attributes": {
      "id": "subtitle"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "show",
        "children": [
          {
            "type": "widget",
            "tag": "text",
            "children": [
              {
                "type": "property",
                "tag": "prop:textStyle",
                "children": [],
                "attributes": {
                  "font": "{{ data.font.main }}"
                }
              }
            ],
            "attributes": {
              "text": "{{ template.text }}",
              "size": "12",
              "color": "{{ template.color }}"
            }
          }
        ],
        "attributes": {
          "ifTrue": "{{ template.color }}"
        }
      },
      {
        "type": "widget",
        "tag": "show",
        "children": [
          {
            "type": "widget",
            "tag": "text",
            "children": [
              {
                "type": "property",
                "tag": "prop:textStyle",
                "children": [],
                "attributes": {
                  "font": "{{ data.font.main }}"
                }
              }
            ],
            "attributes": {
              "text": "{{ template.text }}",
              "size": "12",
              "color": "{{ data.colors.quaternary }}"
            }
          }
        ],
        "attributes": {
          "ifFalse": "{{ template.color }}",
          "nullAsFalse": "true"
        }
      }
    ],
    "attributes": {
      "id": "smallBody"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "text",
        "children": [
          {
            "type": "property",
            "tag": "prop:textStyle",
            "children": [],
            "attributes": {
              "font": "{{ data.font.main }}"
            }
          }
        ],
        "attributes": {
          "text": "{{ template.text }}",
          "size": "14",
          "color": "{{ data.colors.text.basic }}",
          "maxLines": "2",
          "overflow": "ellipsis"
        }
      }
    ],
    "attributes": {
      "id": "middleBody"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "stack",
        "children": [
          {
            "type": "widget",
            "tag": "container",
            "children": [
              {
                "type": "property",
                "tag": "prop:decoration",
                "children": [
                  {
                    "type": "property",
                    "tag": "prop:borderRadius",
                    "children": [],
                    "attributes": {
                      "all": "30"
                    }
                  }
                ],
                "attributes": {
                  "color": "{{ template.color }}"
                }
              },
              {
                "type": "widget",
                "tag": "padding",
                "children": [
                  {
                    "type": "widget",
                    "tag": "row",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "show",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "padding",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "sizedBox",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "center",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "svg",
                                        "children": [],
                                        "attributes": {
                                          "ref": "{{ template.prefix }}"
                                        }
                                      }
                                    ],
                                    "attributes": {}
                                  }
                                ],
                                "attributes": {
                                  "size": "20"
                                }
                              }
                            ],
                            "attributes": {
                              "left": "2",
                              "right": "4"
                            }
                          }
                        ],
                        "attributes": {
                          "ifTrue": "{{ template.prefix }}"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "show",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "sizedBox",
                            "children": [],
                            "attributes": {
                              "width": "6"
                            }
                          }
                        ],
                        "attributes": {
                          "ifFalse": "{{ template.prefix }}",
                          "nullAsFalse": "true"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "text",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:textStyle",
                            "children": [],
                            "attributes": {
                              "font": "{{ data.font.main }}",
                              "color": "{{ template.textColor }}",
                              "weight": "w600"
                            }
                          }
                        ],
                        "attributes": {
                          "text": "{{ template.text }}",
                          "size": "14"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "show",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "padding",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "sizedBox",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "svg",
                                    "children": [],
                                    "attributes": {
                                      "ref": "{{ template.suffix }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "size": "10"
                                }
                              }
                            ],
                            "attributes": {
                              "left": "6",
                              "right": "6"
                            }
                          }
                        ],
                        "attributes": {
                          "ifTrue": "{{ template.suffix }}"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "show",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "sizedBox",
                            "children": [],
                            "attributes": {
                              "width": "6"
                            }
                          }
                        ],
                        "attributes": {
                          "ifFalse": "{{ template.suffix }}",
                          "nullAsFalse": "true"
                        }
                      }
                    ],
                    "attributes": {
                      "mainAxisSize": "min"
                    }
                  }
                ],
                "attributes": {
                  "left": "6",
                  "top": "6",
                  "right": "6",
                  "bottom": "6"
                }
              }
            ],
            "attributes": {}
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "positioned",
                "children": [
                  {
                    "type": "widget",
                    "tag": "material",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:borderRadius",
                        "children": [],
                        "attributes": {
                          "all": "30"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "inkWell",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:borderRadius",
                            "children": [],
                            "attributes": {
                              "all": "30"
                            }
                          }
                        ],
                        "attributes": {
                          "onPressed": "{{ template.onPressed }}"
                        }
                      }
                    ],
                    "attributes": {
                      "type": "transparency"
                    }
                  }
                ],
                "attributes": {
                  "all": "0"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.onPressed }}"
            }
          }
        ],
        "attributes": {}
      }
    ],
    "attributes": {
      "id": "roundButton"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "show",
        "children": [
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "container",
                "children": [
                  {
                    "type": "property",
                    "tag": "prop:decoration",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:borderRadius",
                        "children": [],
                        "attributes": {
                          "all": "20"
                        }
                      }
                    ],
                    "attributes": {
                      "color": "{{ data.colors.primary }}"
                    }
                  },
                  {
                    "type": "widget",
                    "tag": "center",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "container",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:decoration",
                            "children": [
                              {
                                "type": "property",
                                "tag": "prop:borderRadius",
                                "children": [],
                                "attributes": {
                                  "all": "16"
                                }
                              }
                            ],
                            "attributes": {
                              "color": "{{ data.colors.secondary }}"
                            }
                          },
                          {
                            "type": "widget",
                            "tag": "center",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "container",
                                "children": [
                                  {
                                    "type": "property",
                                    "tag": "prop:decoration",
                                    "children": [
                                      {
                                        "type": "property",
                                        "tag": "prop:borderRadius",
                                        "children": [],
                                        "attributes": {
                                          "all": "12"
                                        }
                                      }
                                    ],
                                    "attributes": {
                                      "color": "{{ data.colors.primary }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "size": "12"
                                }
                              }
                            ],
                            "attributes": {}
                          }
                        ],
                        "attributes": {
                          "size": "16"
                        }
                      }
                    ],
                    "attributes": {}
                  }
                ],
                "attributes": {
                  "size": "20"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.current }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "sizedBox",
                "children": [
                  {
                    "type": "widget",
                    "tag": "center",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "container",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:decoration",
                            "children": [
                              {
                                "type": "property",
                                "tag": "prop:borderRadius",
                                "children": [],
                                "attributes": {
                                  "all": "12"
                                }
                              }
                            ],
                            "attributes": {
                              "color": "{{ data.colors.primary }}"
                            }
                          }
                        ],
                        "attributes": {
                          "size": "12"
                        }
                      }
                    ],
                    "attributes": {}
                  }
                ],
                "attributes": {
                  "height": "20"
                }
              }
            ],
            "attributes": {
              "ifFalse": "{{ template.current }}",
              "nullAsFalse": "true"
            }
          }
        ],
        "attributes": {
          "ifTrue": "{{ template.active }}"
        }
      },
      {
        "type": "widget",
        "tag": "show",
        "children": [
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [
              {
                "type": "widget",
                "tag": "center",
                "children": [
                  {
                    "type": "widget",
                    "tag": "container",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:decoration",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:borderRadius",
                            "children": [],
                            "attributes": {
                              "all": "12"
                            }
                          }
                        ],
                        "attributes": {
                          "color": "{{ data.colors.quaternaryDarken }}"
                        }
                      }
                    ],
                    "attributes": {
                      "size": "12"
                    }
                  }
                ],
                "attributes": {}
              }
            ],
            "attributes": {
              "height": "20"
            }
          }
        ],
        "attributes": {
          "ifFalse": "{{ template.active }}"
        }
      }
    ],
    "attributes": {
      "id": "point"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "stack",
        "children": [
          {
            "type": "widget",
            "tag": "positioned",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "line",
                  "active": "{{ template.active }}"
                }
              }
            ],
            "attributes": {
              "left": "11",
              "top": "10",
              "right": "0"
            }
          },
          {
            "type": "widget",
            "tag": "positioned",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "point",
                  "active": "{{ template.active }}"
                }
              }
            ],
            "attributes": {
              "left": "0",
              "top": "1"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [
              {
                "type": "widget",
                "tag": "align",
                "children": [
                  {
                    "type": "widget",
                    "tag": "show",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "text",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:textStyle",
                            "children": [],
                            "attributes": {
                              "color": "{{ data.colors.primary }}",
                              "size": "12"
                            }
                          }
                        ],
                        "attributes": {
                          "text": "{{ template.title }}"
                        }
                      }
                    ],
                    "attributes": {
                      "ifTrue": "{{ template.active }}"
                    }
                  },
                  {
                    "type": "widget",
                    "tag": "show",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "text",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:textStyle",
                            "children": [],
                            "attributes": {
                              "color": "{{ data.colors.quaternaryDarken }}",
                              "size": "12"
                            }
                          }
                        ],
                        "attributes": {
                          "text": "{{ template.title }}"
                        }
                      }
                    ],
                    "attributes": {
                      "ifFalse": "{{ template.active }}"
                    }
                  }
                ],
                "attributes": {
                  "align": "bottomLeft"
                }
              }
            ],
            "attributes": {
              "height": "50"
            }
          }
        ],
        "attributes": {}
      }
    ],
    "attributes": {
      "id": "leftDot"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "stack",
        "children": [
          {
            "type": "widget",
            "tag": "positioned",
            "children": [
              {
                "type": "widget",
                "tag": "row",
                "children": [
                  {
                    "type": "widget",
                    "tag": "expanded",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "component",
                        "children": [],
                        "attributes": {
                          "id": "line",
                          "active": "{{ template.leftActive }}"
                        }
                      }
                    ],
                    "attributes": {}
                  },
                  {
                    "type": "widget",
                    "tag": "expanded",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "component",
                        "children": [],
                        "attributes": {
                          "id": "line",
                          "active": "{{ template.rightActive }}"
                        }
                      }
                    ],
                    "attributes": {}
                  }
                ],
                "attributes": {}
              }
            ],
            "attributes": {
              "left": "0",
              "top": "10",
              "right": "0"
            }
          },
          {
            "type": "widget",
            "tag": "positioned",
            "children": [
              {
                "type": "widget",
                "tag": "align",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "point",
                      "active": "{{ template.active }}",
                      "current": "{{ template.current }}"
                    }
                  }
                ],
                "attributes": {
                  "align": "topCenter"
                }
              }
            ],
            "attributes": {
              "left": "0",
              "top": "1",
              "right": "0"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [
              {
                "type": "widget",
                "tag": "align",
                "children": [
                  {
                    "type": "widget",
                    "tag": "show",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "text",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:textStyle",
                            "children": [],
                            "attributes": {
                              "color": "{{ data.colors.primary }}",
                              "size": "12"
                            }
                          }
                        ],
                        "attributes": {
                          "text": "{{ template.title }}"
                        }
                      }
                    ],
                    "attributes": {
                      "ifTrue": "{{ template.active }}"
                    }
                  },
                  {
                    "type": "widget",
                    "tag": "show",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "text",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:textStyle",
                            "children": [],
                            "attributes": {
                              "color": "{{ data.colors.quaternaryDarken }}",
                              "size": "12"
                            }
                          }
                        ],
                        "attributes": {
                          "text": "{{ template.title }}"
                        }
                      }
                    ],
                    "attributes": {
                      "ifFalse": "{{ template.active }}"
                    }
                  }
                ],
                "attributes": {
                  "align": "bottomLeft"
                }
              }
            ],
            "attributes": {
              "height": "50"
            }
          }
        ],
        "attributes": {}
      }
    ],
    "attributes": {
      "id": "dot"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "stack",
        "children": [
          {
            "type": "widget",
            "tag": "positioned",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "line",
                  "active": "{{ template.active }}"
                }
              }
            ],
            "attributes": {
              "left": "0",
              "top": "10",
              "right": "11"
            }
          },
          {
            "type": "widget",
            "tag": "positioned",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "point",
                  "active": "{{ template.active }}"
                }
              }
            ],
            "attributes": {
              "top": "1",
              "right": "0"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [
              {
                "type": "widget",
                "tag": "align",
                "children": [
                  {
                    "type": "widget",
                    "tag": "show",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "text",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:textStyle",
                            "children": [],
                            "attributes": {
                              "color": "{{ data.colors.primary }}",
                              "size": "12"
                            }
                          }
                        ],
                        "attributes": {
                          "text": "{{ template.title }}"
                        }
                      }
                    ],
                    "attributes": {
                      "ifTrue": "{{ template.active }}"
                    }
                  },
                  {
                    "type": "widget",
                    "tag": "show",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "text",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:textStyle",
                            "children": [],
                            "attributes": {
                              "color": "{{ data.colors.quaternaryDarken }}",
                              "size": "12"
                            }
                          }
                        ],
                        "attributes": {
                          "text": "{{ template.title }}"
                        }
                      }
                    ],
                    "attributes": {
                      "ifFalse": "{{ template.active }}"
                    }
                  }
                ],
                "attributes": {
                  "align": "bottomLeft"
                }
              }
            ],
            "attributes": {
              "height": "50"
            }
          }
        ],
        "attributes": {}
      }
    ],
    "attributes": {
      "id": "rightDot"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "show",
        "children": [
          {
            "type": "widget",
            "tag": "container",
            "children": [
              {
                "type": "property",
                "tag": "prop:decoration",
                "children": [],
                "attributes": {
                  "color": "{{ data.colors.primary }}"
                }
              }
            ],
            "attributes": {
              "height": "2",
              "width": "100"
            }
          }
        ],
        "attributes": {
          "ifTrue": "{{ template.active }}"
        }
      },
      {
        "type": "widget",
        "tag": "show",
        "children": [
          {
            "type": "widget",
            "tag": "container",
            "children": [
              {
                "type": "property",
                "tag": "prop:decoration",
                "children": [],
                "attributes": {
                  "color": "{{ data.colors.quaternaryDarken }}"
                }
              }
            ],
            "attributes": {
              "height": "2",
              "width": "100"
            }
          }
        ],
        "attributes": {
          "ifFalse": "{{ template.active }}"
        }
      }
    ],
    "attributes": {
      "id": "line"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "sizedBox",
        "children": [
          {
            "type": "widget",
            "tag": "stack",
            "children": [
              {
                "type": "widget",
                "tag": "positioned",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "line",
                      "active": "{{ template.active }}"
                    }
                  }
                ],
                "attributes": {
                  "left": "0",
                  "top": "10",
                  "right": "0"
                }
              }
            ],
            "attributes": {
              "fix": "expand"
            }
          }
        ],
        "attributes": {
          "height": "50"
        }
      }
    ],
    "attributes": {
      "id": "lineSpacer"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "aspectRatio",
        "children": [
          {
            "type": "widget",
            "tag": "stack",
            "children": [
              {
                "type": "widget",
                "tag": "container",
                "children": [
                  {
                    "type": "property",
                    "tag": "prop:decoration",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:border",
                        "children": [],
                        "attributes": {
                          "color": "{{ data.colors.quaternaryLighten }}",
                          "width": "1.6"
                        }
                      },
                      {
                        "type": "property",
                        "tag": "prop:borderRadius",
                        "children": [],
                        "attributes": {
                          "all": "8"
                        }
                      }
                    ],
                    "attributes": {}
                  },
                  {
                    "type": "widget",
                    "tag": "column",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "expanded",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "center",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "image",
                                    "children": [],
                                    "attributes": {
                                      "ref": "{{ template.image }}",
                                      "blurHash": "{{ template.blurHash }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "top": "4",
                                  "bottom": "4"
                                }
                              }
                            ],
                            "attributes": {}
                          }
                        ],
                        "attributes": {}
                      },
                      {
                        "type": "widget",
                        "tag": "expanded",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "column",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "column",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "component",
                                        "children": [],
                                        "attributes": {
                                          "id": "smallBody",
                                          "text": "{{ template.subtitle }}"
                                        }
                                      },
                                      {
                                        "type": "widget",
                                        "tag": "component",
                                        "children": [],
                                        "attributes": {
                                          "id": "middleBody",
                                          "text": "{{ template.title }}"
                                        }
                                      },
                                      {
                                        "type": "widget",
                                        "tag": "sizedBox",
                                        "children": [],
                                        "attributes": {
                                          "height": "{{ data.gap.x2 }}"
                                        }
                                      },
                                      {
                                        "type": "widget",
                                        "tag": "richText",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "textSpan",
                                            "children": [
                                              {
                                                "type": "property",
                                                "tag": "prop:textStyle",
                                                "children": [],
                                                "attributes": {
                                                  "color": "{{ data.colors.text.basic }}",
                                                  "size": "14"
                                                }
                                              }
                                            ],
                                            "attributes": {
                                              "text": "{{ template.price }}"
                                            }
                                          },
                                          {
                                            "type": "widget",
                                            "tag": "textSpan",
                                            "children": [
                                              {
                                                "type": "property",
                                                "tag": "prop:textStyle",
                                                "children": [],
                                                "attributes": {
                                                  "color": "{{ data.colors.text.light }}",
                                                  "size": "14"
                                                }
                                              }
                                            ],
                                            "attributes": {
                                              "text": "  {{ template.pricePerUnit }}"
                                            }
                                          }
                                        ],
                                        "attributes": {}
                                      }
                                    ],
                                    "attributes": {
                                      "crossAxisAlignment": "start"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "left": "{{ data.gap.x2 }}",
                                  "right": "{{ data.gap.x2 }}",
                                  "bottom": "{{ data.gap.x2 }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "container",
                                "children": [],
                                "attributes": {
                                  "height": "1.6",
                                  "width": "500",
                                  "color": "{{ data.colors.quaternaryLighten }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "expanded",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "center",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "padding",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "row",
                                            "children": [
                                              {
                                                "type": "widget",
                                                "tag": "show",
                                                "children": [
                                                  {
                                                    "type": "widget",
                                                    "tag": "component",
                                                    "children": [],
                                                    "attributes": {
                                                      "id": "smallBody",
                                                      "text": "In stock",
                                                      "color": "{{ data.colors.text.basic }}"
                                                    }
                                                  }
                                                ],
                                                "attributes": {
                                                  "ifTrue": "{{ template.inStock }}"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "show",
                                                "children": [
                                                  {
                                                    "type": "widget",
                                                    "tag": "component",
                                                    "children": [],
                                                    "attributes": {
                                                      "id": "smallBody",
                                                      "text": "Out of stock",
                                                      "color": "{{ data.colors.text.basic }}"
                                                    }
                                                  }
                                                ],
                                                "attributes": {
                                                  "ifFalse": "{{ template.inStock }}",
                                                  "nullAsFalse": "true"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "padding",
                                                "children": [
                                                  {
                                                    "type": "widget",
                                                    "tag": "container",
                                                    "children": [],
                                                    "attributes": {
                                                      "width": "1",
                                                      "height": "14",
                                                      "color": "{{ data.colors.text.basic }}"
                                                    }
                                                  }
                                                ],
                                                "attributes": {
                                                  "left": "8",
                                                  "right": "8"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "sizedBox",
                                                "children": [
                                                  {
                                                    "type": "widget",
                                                    "tag": "svg",
                                                    "children": [],
                                                    "attributes": {
                                                      "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/location_dark.svg"
                                                    }
                                                  }
                                                ],
                                                "attributes": {
                                                  "size": "20"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "sizedBox",
                                                "children": [],
                                                "attributes": {
                                                  "width": "2"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "component",
                                                "children": [],
                                                "attributes": {
                                                  "id": "smallBody",
                                                  "text": "S23",
                                                  "color": "{{ data.colors.text.basic }}"
                                                }
                                              }
                                            ],
                                            "attributes": {}
                                          }
                                        ],
                                        "attributes": {
                                          "left": "{{ data.gap.x2 }}",
                                          "right": "{{ data.gap.x2 }}"
                                        }
                                      }
                                    ],
                                    "attributes": {}
                                  }
                                ],
                                "attributes": {}
                              }
                            ],
                            "attributes": {
                              "crossAxisAlignment": "start"
                            }
                          }
                        ],
                        "attributes": {}
                      }
                    ],
                    "attributes": {
                      "crossAxisAlignment": "start"
                    }
                  }
                ],
                "attributes": {}
              },
              {
                "type": "widget",
                "tag": "positioned",
                "children": [
                  {
                    "type": "widget",
                    "tag": "material",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:borderRadius",
                        "children": [],
                        "attributes": {
                          "all": "8"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "inkWell",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:borderRadius",
                            "children": [],
                            "attributes": {
                              "all": "8"
                            }
                          },
                          {
                            "type": "widget",
                            "tag": "container",
                            "children": [],
                            "attributes": {
                              "color": "#00FFFFFF"
                            }
                          }
                        ],
                        "attributes": {
                          "onPressed": "{{ template.onPressed }}",
                          "splashColor": "{{ template.splashColor }}",
                          "highlightColor": "#00FFFFFF"
                        }
                      }
                    ],
                    "attributes": {
                      "type": "transparency"
                    }
                  }
                ],
                "attributes": {
                  "all": "0"
                }
              },
              {
                "type": "widget",
                "tag": "positioned",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "roundButton",
                      "text": "Add",
                      "color": "{{ data.colors.primary }}",
                      "textColor": "{{ data.colors.secondary }}",
                      "prefix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/plus.svg",
                      "onPressed": "addToCart"
                    }
                  }
                ],
                "attributes": {
                  "top": "8",
                  "right": "8"
                }
              }
            ],
            "attributes": {}
          }
        ],
        "attributes": {
          "ratio": "0.65"
        }
      }
    ],
    "attributes": {
      "id": "groceryCard"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "padding",
        "children": [
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [
              {
                "type": "widget",
                "tag": "svg",
                "children": [],
                "attributes": {
                  "ref": "{{ template.ref }}"
                }
              }
            ],
            "attributes": {
              "size": "16"
            }
          }
        ],
        "attributes": {
          "right": "{{ data.gap.x1 }}"
        }
      }
    ],
    "attributes": {
      "id": "star"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "row",
        "children": [
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.empty }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating < 0.5 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.half }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 0.5 and template.rating < 1 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.full }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 1 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.empty }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating < 1.5 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.half }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 1.5 and template.rating < 2 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.full }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 2 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.empty }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating < 2.5 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.half }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 2.5 and template.rating < 3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.full }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.empty }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating < 3.5 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.half }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 3.5 and template.rating < 4 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.full }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 4 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.empty }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating < 4.5 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.half }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 4.5 and template.rating < 5 }}"
            }
          },
          {
            "type": "widget",
            "tag": "show",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "star",
                  "ref": "{{ data.star.full }}"
                }
              }
            ],
            "attributes": {
              "ifTrue": "{{ template.rating >= 5 }}"
            }
          }
        ],
        "attributes": {}
      }
    ],
    "attributes": {
      "id": "rating"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "aspectRatio",
        "children": [
          {
            "type": "widget",
            "tag": "stack",
            "children": [
              {
                "type": "widget",
                "tag": "container",
                "children": [
                  {
                    "type": "property",
                    "tag": "prop:decoration",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:border",
                        "children": [],
                        "attributes": {
                          "color": "{{ data.colors.quaternaryLighten }}",
                          "width": "1.6"
                        }
                      },
                      {
                        "type": "property",
                        "tag": "prop:borderRadius",
                        "children": [],
                        "attributes": {
                          "all": "8"
                        }
                      }
                    ],
                    "attributes": {}
                  },
                  {
                    "type": "widget",
                    "tag": "column",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "expanded",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "center",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "image",
                                    "children": [],
                                    "attributes": {
                                      "ref": "{{ template.image }}",
                                      "blurHash": "{{ template.blurHash }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "top": "4",
                                  "bottom": "4"
                                }
                              }
                            ],
                            "attributes": {}
                          }
                        ],
                        "attributes": {}
                      },
                      {
                        "type": "widget",
                        "tag": "expanded",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "column",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "column",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "component",
                                        "children": [],
                                        "attributes": {
                                          "id": "smallBody",
                                          "text": "{{ template.subtitle }}"
                                        }
                                      },
                                      {
                                        "type": "widget",
                                        "tag": "component",
                                        "children": [],
                                        "attributes": {
                                          "id": "middleBody",
                                          "text": "{{ template.title }}"
                                        }
                                      },
                                      {
                                        "type": "widget",
                                        "tag": "sizedBox",
                                        "children": [],
                                        "attributes": {
                                          "height": "{{ data.gap.x2 }}"
                                        }
                                      },
                                      {
                                        "type": "widget",
                                        "tag": "richText",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "textSpan",
                                            "children": [
                                              {
                                                "type": "property",
                                                "tag": "prop:textStyle",
                                                "children": [],
                                                "attributes": {
                                                  "color": "{{ data.colors.text.basic }}",
                                                  "size": "14"
                                                }
                                              }
                                            ],
                                            "attributes": {
                                              "text": "{{ template.pricePerMonth }}"
                                            }
                                          },
                                          {
                                            "type": "widget",
                                            "tag": "textSpan",
                                            "children": [
                                              {
                                                "type": "property",
                                                "tag": "prop:textStyle",
                                                "children": [],
                                                "attributes": {
                                                  "color": "{{ data.colors.text.light }}",
                                                  "size": "14"
                                                }
                                              }
                                            ],
                                            "attributes": {
                                              "text": "  {{ template.price }}"
                                            }
                                          }
                                        ],
                                        "attributes": {}
                                      }
                                    ],
                                    "attributes": {
                                      "crossAxisAlignment": "start"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "left": "{{ data.gap.x2 }}",
                                  "right": "{{ data.gap.x2 }}",
                                  "bottom": "{{ data.gap.x2 }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "container",
                                "children": [],
                                "attributes": {
                                  "height": "1.6",
                                  "width": "500",
                                  "color": "{{ data.colors.quaternaryLighten }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "expanded",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "center",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "padding",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "row",
                                            "children": [
                                              {
                                                "type": "widget",
                                                "tag": "component",
                                                "children": [],
                                                "attributes": {
                                                  "id": "rating",
                                                  "rating": "{{ template.rating }}"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "sizedBox",
                                                "children": [],
                                                "attributes": {
                                                  "width": "{{ data.gap.x1 }}"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "component",
                                                "children": [],
                                                "attributes": {
                                                  "id": "smallBody",
                                                  "text": "({{ template.count }})",
                                                  "color": "{{ data.colors.text.light }}"
                                                }
                                              }
                                            ],
                                            "attributes": {}
                                          }
                                        ],
                                        "attributes": {
                                          "left": "{{ data.gap.x2 }}",
                                          "right": "{{ data.gap.x2 }}"
                                        }
                                      }
                                    ],
                                    "attributes": {}
                                  }
                                ],
                                "attributes": {}
                              }
                            ],
                            "attributes": {
                              "crossAxisAlignment": "start"
                            }
                          }
                        ],
                        "attributes": {}
                      }
                    ],
                    "attributes": {
                      "crossAxisAlignment": "start"
                    }
                  }
                ],
                "attributes": {}
              },
              {
                "type": "widget",
                "tag": "positioned",
                "children": [
                  {
                    "type": "widget",
                    "tag": "material",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:borderRadius",
                        "children": [],
                        "attributes": {
                          "all": "8"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "inkWell",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:borderRadius",
                            "children": [],
                            "attributes": {
                              "all": "8"
                            }
                          },
                          {
                            "type": "widget",
                            "tag": "container",
                            "children": [],
                            "attributes": {
                              "color": "#00FFFFFF"
                            }
                          }
                        ],
                        "attributes": {
                          "onPressed": "{{ template.onPressed }}",
                          "splashColor": "{{ template.splashColor }}",
                          "highlightColor": "#00FFFFFF"
                        }
                      }
                    ],
                    "attributes": {
                      "type": "transparency"
                    }
                  }
                ],
                "attributes": {
                  "all": "0"
                }
              },
              {
                "type": "widget",
                "tag": "positioned",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "roundButton",
                      "text": "Add",
                      "color": "{{ data.colors.primary }}",
                      "textColor": "{{ data.colors.secondary }}",
                      "prefix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/plus.svg",
                      "onPressed": "addToCart"
                    }
                  }
                ],
                "attributes": {
                  "top": "8",
                  "right": "8"
                }
              }
            ],
            "attributes": {}
          }
        ],
        "attributes": {
          "ratio": "0.65"
        }
      }
    ],
    "attributes": {
      "id": "electronicsCard"
    }
  },
  {
    "type": "widget",
    "tag": "template",
    "children": [
      {
        "type": "widget",
        "tag": "padding",
        "children": [
          {
            "type": "widget",
            "tag": "stack",
            "children": [
              {
                "type": "widget",
                "tag": "sizedBox",
                "children": [
                  {
                    "type": "widget",
                    "tag": "svg",
                    "children": [],
                    "attributes": {
                      "ref": "{{ template.image }}"
                    }
                  }
                ],
                "attributes": {
                  "size": "72"
                }
              },
              {
                "type": "widget",
                "tag": "positioned",
                "children": [
                  {
                    "type": "widget",
                    "tag": "material",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:borderRadius",
                        "children": [],
                        "attributes": {
                          "all": "100"
                        }
                      },
                      {
                        "type": "widget",
                        "tag": "inkWell",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:borderRadius",
                            "children": [],
                            "attributes": {
                              "all": "100"
                            }
                          },
                          {
                            "type": "widget",
                            "tag": "container",
                            "children": [],
                            "attributes": {
                              "color": "#00FFFFFF"
                            }
                          }
                        ],
                        "attributes": {
                          "onPressed": "snackbar: Brand!"
                        }
                      }
                    ],
                    "attributes": {
                      "type": "transparency"
                    }
                  }
                ],
                "attributes": {
                  "all": "0"
                }
              }
            ],
            "attributes": {}
          }
        ],
        "attributes": {
          "right": "{{ data.gap.x3 }}"
        }
      }
    ],
    "attributes": {
      "id": "brand"
    }
  },
  {
    "type": "widget",
    "tag": "sliverPersistentHeader",
    "children": [
      {
        "type": "widget",
        "tag": "container",
        "children": [
          {
            "type": "widget",
            "tag": "column",
            "children": [
              {
                "type": "widget",
                "tag": "sizedBox",
                "children": [],
                "attributes": {
                  "height": "44"
                }
              },
              {
                "type": "widget",
                "tag": "padding",
                "children": [
                  {
                    "type": "widget",
                    "tag": "row",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "expanded",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "row",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "sizedBox",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "image",
                                    "children": [],
                                    "attributes": {
                                      "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/images/avatar.png"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "size": "32"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "sizedBox",
                                "children": [],
                                "attributes": {
                                  "width": "{{ data.gap.x2 }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "text",
                                "children": [
                                  {
                                    "type": "property",
                                    "tag": "prop:textStyle",
                                    "children": [],
                                    "attributes": {
                                      "color": "{{ data.colors.secondary }}",
                                      "size": "14",
                                      "font": "{{ data.font.main }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "text": "Hi, John"
                                }
                              }
                            ],
                            "attributes": {
                              "mainAxisSize": "min"
                            }
                          }
                        ],
                        "attributes": {}
                      },
                      {
                        "type": "widget",
                        "tag": "expanded",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "sizedBox",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "svg",
                                "children": [],
                                "attributes": {
                                  "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/logo.svg"
                                }
                              }
                            ],
                            "attributes": {
                              "size": "39"
                            }
                          }
                        ],
                        "attributes": {}
                      },
                      {
                        "type": "widget",
                        "tag": "expanded",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "row",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "text",
                                "children": [
                                  {
                                    "type": "property",
                                    "tag": "prop:textStyle",
                                    "children": [],
                                    "attributes": {
                                      "color": "{{ data.colors.secondaryDarken }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "text": "$499.60"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "sizedBox",
                                "children": [],
                                "attributes": {
                                  "width": "{{ data.gap.x2 }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "stack",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "padding",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "sizedBox",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "svg",
                                            "children": [],
                                            "attributes": {
                                              "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/cart.svg"
                                            }
                                          }
                                        ],
                                        "attributes": {
                                          "size": "24"
                                        }
                                      }
                                    ],
                                    "attributes": {
                                      "top": "4",
                                      "right": "4"
                                    }
                                  },
                                  {
                                    "type": "widget",
                                    "tag": "positioned",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "container",
                                        "children": [
                                          {
                                            "type": "property",
                                            "tag": "prop:decoration",
                                            "children": [
                                              {
                                                "type": "property",
                                                "tag": "prop:borderRadius",
                                                "children": [],
                                                "attributes": {
                                                  "all": "14"
                                                }
                                              }
                                            ],
                                            "attributes": {
                                              "color": "{{ data.colors.tertiary }}"
                                            }
                                          },
                                          {
                                            "type": "widget",
                                            "tag": "center",
                                            "children": [
                                              {
                                                "type": "widget",
                                                "tag": "dataBuilder",
                                                "children": [
                                                  {
                                                    "type": "widget",
                                                    "tag": "text",
                                                    "children": [],
                                                    "attributes": {
                                                      "text": "{{ data.cart.count }}",
                                                      "size": "9"
                                                    }
                                                  }
                                                ],
                                                "attributes": {
                                                  "buildWhen": "cart.count"
                                                }
                                              }
                                            ],
                                            "attributes": {}
                                          }
                                        ],
                                        "attributes": {
                                          "size": "14"
                                        }
                                      }
                                    ],
                                    "attributes": {
                                      "top": "0",
                                      "right": "0"
                                    }
                                  }
                                ],
                                "attributes": {}
                              }
                            ],
                            "attributes": {
                              "mainAxisAlignment": "end"
                            }
                          }
                        ],
                        "attributes": {}
                      }
                    ],
                    "attributes": {}
                  }
                ],
                "attributes": {
                  "left": "{{ data.gap.x3 }}",
                  "top": "{{ data.gap.x2 }}",
                  "right": "{{ data.gap.x3 }}",
                  "bottom": "{{ data.gap.x2 }}"
                }
              },
              {
                "type": "widget",
                "tag": "padding",
                "children": [
                  {
                    "type": "widget",
                    "tag": "textField",
                    "children": [
                      {
                        "type": "property",
                        "tag": "prop:inputDecoration",
                        "children": [
                          {
                            "type": "property",
                            "tag": "prop:inputBorder",
                            "children": [
                              {
                                "type": "property",
                                "tag": "prop:borderRadius",
                                "children": [],
                                "attributes": {
                                  "all": "60"
                                }
                              },
                              {
                                "type": "property",
                                "tag": "prop:borderSide",
                                "children": [],
                                "attributes": {
                                  "color": "#00FFFFFF",
                                  "width": "0"
                                }
                              }
                            ],
                            "attributes": {
                              "type": "outline"
                            }
                          },
                          {
                            "type": "property",
                            "tag": "prop:contentPadding",
                            "children": [],
                            "attributes": {
                              "left": "30"
                            }
                          },
                          {
                            "type": "widget",
                            "tag": "alias",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "sizedBox",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "center",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "svg",
                                            "children": [],
                                            "attributes": {
                                              "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/search.svg",
                                              "size": "21"
                                            }
                                          }
                                        ],
                                        "attributes": {}
                                      }
                                    ],
                                    "attributes": {
                                      "size": "21"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "left": "8",
                                  "top": "3"
                                }
                              }
                            ],
                            "attributes": {
                              "name": "prefixIcon"
                            }
                          },
                          {
                            "type": "property",
                            "tag": "prop:hintStyle",
                            "children": [],
                            "attributes": {
                              "color": "{{ data.colors.quaternary }}",
                              "size": "14",
                              "font": "{{ data.font.main }}"
                            }
                          },
                          {
                            "type": "widget",
                            "tag": "alias",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "sizedBox",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "center",
                                        "children": [
                                          {
                                            "type": "widget",
                                            "tag": "material",
                                            "children": [
                                              {
                                                "type": "property",
                                                "tag": "prop:borderRadius",
                                                "children": [],
                                                "attributes": {
                                                  "all": "3"
                                                }
                                              },
                                              {
                                                "type": "widget",
                                                "tag": "inkWell",
                                                "children": [
                                                  {
                                                    "type": "property",
                                                    "tag": "prop:borderRadius",
                                                    "children": [],
                                                    "attributes": {
                                                      "all": "3"
                                                    }
                                                  },
                                                  {
                                                    "type": "widget",
                                                    "tag": "svg",
                                                    "children": [],
                                                    "attributes": {
                                                      "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/barcode.svg",
                                                      "size": "21"
                                                    }
                                                  }
                                                ],
                                                "attributes": {
                                                  "onPressed": "snackbar: Let's go scan!"
                                                }
                                              }
                                            ],
                                            "attributes": {
                                              "type": "transparent"
                                            }
                                          }
                                        ],
                                        "attributes": {}
                                      }
                                    ],
                                    "attributes": {
                                      "size": "21"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "right": "8"
                                }
                              }
                            ],
                            "attributes": {
                              "name": "suffixIcon"
                            }
                          }
                        ],
                        "attributes": {
                          "filled": "true",
                          "simpleBorders": "true",
                          "fillColor": "{{ data.colors.secondary }}",
                          "dense": "false",
                          "hint": "Search everything at Walmart"
                        }
                      }
                    ],
                    "attributes": {
                      "maxLines": "1",
                      "onChanged": "emit:search"
                    }
                  }
                ],
                "attributes": {
                  "all": "{{ data.gap.x3 }}"
                }
              },
              {
                "type": "widget",
                "tag": "row",
                "children": [
                  {
                    "type": "widget",
                    "tag": "expanded",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "container",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "row",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "sizedBox",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "svg",
                                        "children": [],
                                        "attributes": {
                                          "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/home.svg"
                                        }
                                      }
                                    ],
                                    "attributes": {
                                      "size": "20"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "left": "{{ data.gap.x3 }}",
                                  "right": "{{ data.gap.x1 }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "text",
                                "children": [
                                  {
                                    "type": "property",
                                    "tag": "prop:textStyle",
                                    "children": [],
                                    "attributes": {
                                      "color": "{{ data.colors.secondary }}",
                                      "size": "12",
                                      "font": "{{ data.font.main }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "text": "Carrollton Supercenter",
                                  "color": "{{ data.colors.secondary }}",
                                  "overflow": "ellipsis",
                                  "maxLines": "1"
                                }
                              }
                            ],
                            "attributes": {
                              "mainAxisSize": "min"
                            }
                          }
                        ],
                        "attributes": {
                          "height": "36",
                          "color": "{{ data.colors.primaryDarken }}"
                        }
                      }
                    ],
                    "attributes": {}
                  },
                  {
                    "type": "widget",
                    "tag": "expanded",
                    "children": [
                      {
                        "type": "widget",
                        "tag": "container",
                        "children": [
                          {
                            "type": "widget",
                            "tag": "row",
                            "children": [
                              {
                                "type": "widget",
                                "tag": "padding",
                                "children": [
                                  {
                                    "type": "widget",
                                    "tag": "sizedBox",
                                    "children": [
                                      {
                                        "type": "widget",
                                        "tag": "svg",
                                        "children": [],
                                        "attributes": {
                                          "ref": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/location.svg"
                                        }
                                      }
                                    ],
                                    "attributes": {
                                      "size": "20"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "left": "{{ data.gap.x3 }}",
                                  "right": "{{ data.gap.x1 }}"
                                }
                              },
                              {
                                "type": "widget",
                                "tag": "text",
                                "children": [
                                  {
                                    "type": "property",
                                    "tag": "prop:textStyle",
                                    "children": [],
                                    "attributes": {
                                      "color": "{{ data.colors.secondary }}",
                                      "size": "12",
                                      "font": "{{ data.font.main }}"
                                    }
                                  }
                                ],
                                "attributes": {
                                  "text": "Dallas 75220",
                                  "color": "{{ data.colors.secondary }}"
                                }
                              }
                            ],
                            "attributes": {
                              "mainAxisSize": "min"
                            }
                          }
                        ],
                        "attributes": {
                          "height": "36",
                          "color": "{{ data.colors.primaryDarkest }}"
                        }
                      }
                    ],
                    "attributes": {}
                  }
                ],
                "attributes": {}
              }
            ],
            "attributes": {}
          }
        ],
        "attributes": {
          "color": "{{ data.colors.primary }}",
          "height": "{{ data.header.height }}"
        }
      }
    ],
    "attributes": {
      "maxExtent": "{{ data.header.height }}",
      "minExtent": "{{ data.header.height }}",
      "floating": "true"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x1 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [
      {
        "type": "widget",
        "tag": "listView",
        "children": [
          {
            "type": "widget",
            "tag": "for",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "adCard",
                  "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/ad_{{ cycle.value }}.jpeg",
                  "title": "Free Assembly",
                  "noPrefix": "{{ cycle.index }}",
                  "subtitle": "A new brand that looks good.",
                  "blurHash": "LQK^scRP%%%0pe%LnMSj.8W=Rkxt"
                }
              }
            ],
            "attributes": {
              "from": "1",
              "to": "4"
            }
          }
        ],
        "attributes": {
          "axis": "horizontal"
        }
      }
    ],
    "attributes": {
      "height": "280"
    }
  },
  {
    "type": "widget",
    "tag": "padding",
    "children": [
      {
        "type": "widget",
        "tag": "column",
        "children": [
          {
            "type": "widget",
            "tag": "row",
            "children": [
              {
                "type": "widget",
                "tag": "column",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "subtitle",
                      "text": "Your order is on the way"
                    }
                  },
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "smallBody",
                      "text": "Arrives today, 3pm – 4pm"
                    }
                  }
                ],
                "attributes": {
                  "mainAxisSize": "min",
                  "crossAxisAlignment": "start"
                }
              },
              {
                "type": "widget",
                "tag": "spacer",
                "children": [],
                "attributes": {}
              },
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "roundButton",
                  "text": "Track",
                  "prefix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/location.svg",
                  "color": "{{ data.colors.primary }}",
                  "textColor": "{{ data.colors.secondary }}",
                  "onPressed": "snackbar: Go to track!"
                }
              }
            ],
            "attributes": {}
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "height": "{{ data.gap.x4 }}"
            }
          },
          {
            "type": "widget",
            "tag": "row",
            "children": [
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "leftDot",
                  "active": "true",
                  "title": "Placed"
                }
              },
              {
                "type": "widget",
                "tag": "expanded",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "lineSpacer",
                      "active": "true"
                    }
                  }
                ],
                "attributes": {}
              },
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "dot",
                  "leftActive": "true",
                  "active": "true",
                  "rightActive": "true",
                  "title": "Preparing"
                }
              },
              {
                "type": "widget",
                "tag": "expanded",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "lineSpacer",
                      "active": "true"
                    }
                  }
                ],
                "attributes": {}
              },
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "dot",
                  "leftActive": "true",
                  "active": "true",
                  "rightActive": "false",
                  "current": "true",
                  "title": "On the way"
                }
              },
              {
                "type": "widget",
                "tag": "expanded",
                "children": [
                  {
                    "type": "widget",
                    "tag": "component",
                    "children": [],
                    "attributes": {
                      "id": "lineSpacer",
                      "active": "false"
                    }
                  }
                ],
                "attributes": {}
              },
              {
                "type": "widget",
                "tag": "component",
                "children": [],
                "attributes": {
                  "id": "rightDot",
                  "active": "false",
                  "title": "Delivered"
                }
              }
            ],
            "attributes": {}
          }
        ],
        "attributes": {
          "mainAxisSize": "min",
          "crossAxisAlignment": "start"
        }
      }
    ],
    "attributes": {
      "left": "{{ data.gap.x3 }}",
      "top": "{{ data.gap.x5 }}",
      "right": "{{ data.gap.x3 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x4 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [
      {
        "type": "widget",
        "tag": "listView",
        "children": [
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "roundButton",
              "color": "{{ data.colors.secondaryAccent }}",
              "text": "Sort & Filter",
              "onPressed": "snackbar: Sort & Filter!",
              "prefix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/menu.svg",
              "suffix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "12"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "roundButton",
              "color": "{{ data.colors.secondaryAccent }}",
              "text": "In store",
              "onPressed": "snackbar: In store!",
              "suffix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "12"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "roundButton",
              "color": "{{ data.colors.secondaryAccent }}",
              "text": "Price",
              "onPressed": "snackbar: Price!",
              "suffix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "12"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "roundButton",
              "color": "{{ data.colors.secondaryAccent }}",
              "text": "Brand",
              "onPressed": "snackbar: Brand!",
              "suffix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "12"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "roundButton",
              "color": "{{ data.colors.secondaryAccent }}",
              "text": "Size",
              "onPressed": "snackbar: Size!",
              "suffix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "12"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "roundButton",
              "color": "{{ data.colors.secondaryAccent }}",
              "text": "Color",
              "onPressed": "snackbar: Color!",
              "suffix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "12"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "roundButton",
              "color": "{{ data.colors.secondaryAccent }}",
              "text": "Weight",
              "onPressed": "snackbar: Weight!",
              "suffix": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"
            }
          }
        ],
        "attributes": {
          "axis": "horizontal"
        }
      }
    ],
    "attributes": {
      "height": "34"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x4 }}"
    }
  },
  {
    "type": "widget",
    "tag": "padding",
    "children": [
      {
        "type": "widget",
        "tag": "richText",
        "children": [
          {
            "type": "widget",
            "tag": "textSpan",
            "children": [
              {
                "type": "property",
                "tag": "prop:textStyle",
                "children": [],
                "attributes": {
                  "weight": "w500",
                  "height": "1.25",
                  "font": "{{ data.font.main }}"
                }
              }
            ],
            "attributes": {
              "text": "Groceries",
              "size": "18",
              "color": "{{ data.colors.text.basic }}"
            }
          },
          {
            "type": "widget",
            "tag": "textSpan",
            "children": [
              {
                "type": "property",
                "tag": "prop:textStyle",
                "children": [],
                "attributes": {
                  "weight": "w500",
                  "height": "1.25",
                  "font": "{{ data.font.main }}"
                }
              }
            ],
            "attributes": {
              "text": " (12.3k)",
              "size": "18",
              "color": "{{ data.colors.text.light }}"
            }
          }
        ],
        "attributes": {}
      }
    ],
    "attributes": {
      "left": "{{ data.gap.x3 }}",
      "right": "{{ data.gap.x3 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x3 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [
      {
        "type": "widget",
        "tag": "listView",
        "children": [
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/apple.png",
              "subtitle": "Final cost by weight",
              "title": "Gala Apples, 3lb Bag",
              "price": "$4.62",
              "pricePerUnit": "$2.27/lb",
              "inStock": "true",
              "onPressed": "snackbar: Apple!",
              "splashColor": "#1FCF011F"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/bread.png",
              "subtitle": "Wonder",
              "title": "Wonder Bread Classic",
              "price": "$2.39",
              "pricePerUnit": "11.9 ¢/oz",
              "inStock": "true",
              "onPressed": "snackbar: Bread!",
              "splashColor": "#1FD38B4E"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/milk.png",
              "subtitle": "Fairlife 2%",
              "title": "Ultra-Filtered Milk",
              "price": "$3.98",
              "pricePerUnit": "7.7 ¢/fl oz",
              "inStock": "true",
              "onPressed": "snackbar: Milk!",
              "splashColor": "#1F66BEEC"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/bananas.png",
              "subtitle": "Fresh Produce",
              "title": "Bananas, Each",
              "price": "$0.21",
              "pricePerUnit": "each",
              "inStock": "true",
              "onPressed": "snackbar: Bananas!",
              "splashColor": "#1FF5E673"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/peanut_cream.png",
              "subtitle": "18 oz, Great Value",
              "title": "Creamy Peanut Butter",
              "price": "$1.72",
              "pricePerUnit": "9.6 ¢/oz",
              "inStock": "true",
              "onPressed": "snackbar: Butter!",
              "splashColor": "#1F35221F"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/ice_cream.png",
              "subtitle": "Strawberry Cheesecake",
              "title": "Ben & Jerry's",
              "price": "$4.62",
              "pricePerUnit": "28.0 ¢/oz",
              "inStock": "false",
              "onPressed": "snackbar: Ice cream!",
              "splashColor": "#1F2A388F"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/avocados.png",
              "subtitle": "Fresh Produce",
              "title": "Hass Avocados",
              "price": "$3.78",
              "pricePerUnit": "$2.27/lb",
              "inStock": "true",
              "onPressed": "snackbar: Avocados!",
              "splashColor": "#1F5D7428"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "groceryCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/spinach.png",
              "subtitle": "Marketside",
              "title": "Fresh Spinach, 10 oz",
              "price": "$2.18",
              "pricePerUnit": "21.8 ¢/oz",
              "inStock": "true",
              "onPressed": "snackbar: Spinach!",
              "splashColor": "#1F2E4006"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          }
        ],
        "attributes": {
          "axis": "horizontal"
        }
      }
    ],
    "attributes": {
      "height": "252"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x5 }}"
    }
  },
  {
    "type": "widget",
    "tag": "padding",
    "children": [
      {
        "type": "widget",
        "tag": "component",
        "children": [],
        "attributes": {
          "id": "subtitle",
          "text": "Brands"
        }
      }
    ],
    "attributes": {
      "left": "{{ data.gap.x3 }}",
      "right": "{{ data.gap.x3 }}",
      "bottom": "{{ data.gap.x4 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [
      {
        "type": "widget",
        "tag": "listView",
        "children": [
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/gap_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/apple_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/tommy_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/boss_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/levis_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/nautica_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/boots_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/ikea_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/crocodile_logo.svg"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "brand",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/svg/nike_logo.svg"
            }
          }
        ],
        "attributes": {
          "axis": "horizontal"
        }
      }
    ],
    "attributes": {
      "height": "72"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x6 }}"
    }
  },
  {
    "type": "widget",
    "tag": "padding",
    "children": [
      {
        "type": "widget",
        "tag": "richText",
        "children": [
          {
            "type": "widget",
            "tag": "textSpan",
            "children": [
              {
                "type": "property",
                "tag": "prop:textStyle",
                "children": [],
                "attributes": {
                  "weight": "w500",
                  "height": "1.25",
                  "font": "{{ data.font.main }}"
                }
              }
            ],
            "attributes": {
              "text": "Electronics",
              "size": "18",
              "color": "{{ data.colors.text.basic }}"
            }
          },
          {
            "type": "widget",
            "tag": "textSpan",
            "children": [
              {
                "type": "property",
                "tag": "prop:textStyle",
                "children": [],
                "attributes": {
                  "weight": "w500",
                  "height": "1.25",
                  "font": "{{ data.font.main }}"
                }
              }
            ],
            "attributes": {
              "text": " (3.5k)",
              "size": "18",
              "color": "{{ data.colors.text.light }}"
            }
          }
        ],
        "attributes": {}
      }
    ],
    "attributes": {
      "left": "{{ data.gap.x3 }}",
      "right": "{{ data.gap.x3 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x3 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [
      {
        "type": "widget",
        "tag": "listView",
        "children": [
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "electronicsCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/watch.png",
              "subtitle": "Apple",
              "title": "Apple Watch SE GPS",
              "price": "$279.00",
              "pricePerMonth": "$26/mo",
              "onPressed": "snackbar: Apple!",
              "splashColor": "#1FCABEB4",
              "rating": "4.5",
              "count": "135"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "electronicsCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/camera.png",
              "subtitle": "Canon",
              "title": "Canon EOS Rebel T100",
              "price": "$379.00",
              "pricePerMonth": "$36/mo",
              "onPressed": "snackbar: Canon!",
              "splashColor": "#1F612E65",
              "rating": "3.1",
              "count": "1.4k"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "electronicsCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/oneplus.png",
              "subtitle": "OnePlus",
              "title": "OnePlus Nord N200",
              "price": "$220.00",
              "pricePerMonth": "$21/mo",
              "onPressed": "snackbar: OnePlus!",
              "splashColor": "#1F0C2BBA",
              "rating": "3.6",
              "count": "70"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "electronicsCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/projector.png",
              "subtitle": "Bomaker",
              "title": "Bomaker Projector",
              "price": "$320.00",
              "pricePerMonth": "$18/mo",
              "onPressed": "snackbar: Projector!",
              "splashColor": "#1F30AFF3",
              "rating": "3.2",
              "count": "80"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "electronicsCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/headphones.png",
              "subtitle": "Bose",
              "title": "QuietComfort 45",
              "price": "$279.00",
              "pricePerMonth": "$24/mo",
              "onPressed": "snackbar: Headphones!",
              "splashColor": "#1F363636",
              "rating": "4.15",
              "count": "250"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          },
          {
            "type": "widget",
            "tag": "component",
            "children": [],
            "attributes": {
              "id": "electronicsCard",
              "image": "https://raw.githubusercontent.com/alphamikle/assets/master/images/drone.png",
              "subtitle": "Contixo",
              "title": "Contixo F16 FPV",
              "price": "$180.00",
              "pricePerMonth": "$10/mo",
              "onPressed": "snackbar: Drone!",
              "splashColor": "#1F4F565D",
              "rating": "5.0",
              "count": "49"
            }
          },
          {
            "type": "widget",
            "tag": "sizedBox",
            "children": [],
            "attributes": {
              "width": "{{ data.gap.x3 }}"
            }
          }
        ],
        "attributes": {
          "axis": "horizontal"
        }
      }
    ],
    "attributes": {
      "height": "252"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "{{ data.gap.x5 }}"
    }
  },
  {
    "type": "widget",
    "tag": "sizedBox",
    "children": [],
    "attributes": {
      "height": "100"
    }
  }
]
'''));

const String testXmlCode = r'''
<data namespace="colors" primary="#FF0B59D5" primaryDarken="#FF0A50C0" primaryDarkest="#FF0948AD"
      secondary="#FFFFFFFF" secondaryDarken="#FFCDDEF7" secondaryAccent="#FFE9F2F9"
      tertiary="#FFFCB61A"
      quaternary="#FF999999" quaternaryDarken="#FF696E70" quaternaryLighten="#FFEEEEEE"
      text.basic="#FF000000" text.light="#FFDCDCDC"
/>
<data namespace="header" height="215"/>
<data namespace="gap" x1="4" x2="8" x3="16" x4="24" x5="32" x6="48"/>
<data namespace="font" main="DM Sans"/>
<data namespace="star"
      empty="https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_empty.svg"
      half="https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_half.svg"
      full="https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_filled.svg"
/>
<data cart.count="2"/>

<!-- # TEMPLATES-->
<template id="adCard">
  <padding top="12" bottom="12">
    <row mainAxisSize="min">
      <show ifFalse="{{ template.noPrefix }}">
        <sizedBox width="{{ data.gap.x3 }}"/>
      </show>
      <aspectRatio ratio="1.3">
        <container color="{{ data.colors.secondary }}">
          <prop:decoration>
            <prop:borderRadius all="8"/>
            <prop:shadow color="#0F000000" blurRadius="8" offsetY="4"/>
          </prop:decoration>

          <column crossAxisAlignment="start">
            <expanded>
              <clipRRect topLeft="8" topRight="8">
                <image ref="{{ template.image }}" fit="cover" blurHash="{{ template.blurHash }}"/>
              </clipRRect>
            </expanded>
            <padding all="{{ data.gap.x2 }}">
              <row>
                <sizedBox width="{{ data.gap.x2 }}"/>
                <column crossAxisAlignment="start">
                  <component id="subtitle" text="{{ template.title }}"/>
                  <component id="smallBody" text="{{ template.subtitle }}"/>
                </column>
                <spacer/>
                <padding top="{{ data.gap.x2 }}" right="{{ data.gap.x2 }}">
                  <sizedBox size="24">
                    <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/circle_chevron_right.svg"/>
                  </sizedBox>
                </padding>
              </row>
            </padding>
          </column>
        </container>
      </aspectRatio>
      <sizedBox width="{{ data.gap.x3 }}"/>
    </row>
  </padding>
</template>

<template id="subtitle">
  <text text="{{ template.text }}" size="18">
    <prop:textStyle weight="w500" height="1.25" font="{{ data.font.main }}"/>
  </text>
</template>

<template id="smallBody">
  <show ifTrue="{{ template.color }}">
    <text text="{{ template.text }}" size="12" color="{{ template.color }}">
      <prop:textStyle font="{{ data.font.main }}"/>
    </text>
  </show>
  <show ifFalse="{{ template.color }}" nullAsFalse="true">
    <text text="{{ template.text }}" size="12" color="{{ data.colors.quaternary }}">
      <prop:textStyle font="{{ data.font.main }}"/>
    </text>
  </show>
</template>

<template id="middleBody">
  <text text="{{ template.text }}" size="14" color="{{ data.colors.text.basic }}" maxLines="2" overflow="ellipsis">
    <prop:textStyle font="{{ data.font.main }}"/>
  </text>
</template>

<template id="roundButton">
  <stack>
    <container>
      <prop:decoration color="{{ template.color }}">
        <prop:borderRadius all="30"/>
      </prop:decoration>

      <padding left="6" top="6" right="6" bottom="6">
        <row mainAxisSize="min">
          <show ifTrue="{{ template.prefix }}">
            <padding left="2" right="4">
              <sizedBox size="20">
                <center>
                  <svg ref="{{ template.prefix }}"/>
                </center>
              </sizedBox>
            </padding>
          </show>
          <show ifFalse="{{ template.prefix }}" nullAsFalse="true">
            <sizedBox width="6"/>
          </show>
          <text text="{{ template.text }}" size="14">
            <prop:textStyle font="{{ data.font.main }}" color="{{ template.textColor }}" weight="w600"/>
          </text>
          <show ifTrue="{{ template.suffix }}">
            <padding left="6" right="6">
              <sizedBox size="10">
                <svg ref="{{ template.suffix }}"/>
              </sizedBox>
            </padding>
          </show>
          <show ifFalse="{{ template.suffix }}" nullAsFalse="true">
            <sizedBox width="6"/>
          </show>
        </row>
      </padding>
    </container>
    <show ifTrue="{{ template.onPressed }}">
      <positioned all="0">
        <material type="transparency">
          <prop:borderRadius all="30"/>
          <inkWell onPressed="{{ template.onPressed }}">
            <prop:borderRadius all="30"/>
          </inkWell>
        </material>
      </positioned>
    </show>
  </stack>
</template>

<template id="point">
  <show ifTrue="{{ template.active }}">
    <show ifTrue="{{ template.current }}">
      <container size="20">
        <prop:decoration color="{{ data.colors.primary }}">
          <prop:borderRadius all="20"/>
        </prop:decoration>
        <center>
          <container size="16">
            <prop:decoration color="{{ data.colors.secondary }}">
              <prop:borderRadius all="16"/>
            </prop:decoration>
            <center>
              <container size="12">
                <prop:decoration color="{{ data.colors.primary }}">
                  <prop:borderRadius all="12"/>
                </prop:decoration>
              </container>
            </center>
          </container>
        </center>
      </container>
    </show>
    <show ifFalse="{{ template.current }}" nullAsFalse="true">
      <sizedBox height="20">
        <center>
          <container size="12">
            <prop:decoration color="{{ data.colors.primary }}">
              <prop:borderRadius all="12"/>
            </prop:decoration>
          </container>
        </center>
      </sizedBox>
    </show>
  </show>
  <show ifFalse="{{ template.active }}">
    <sizedBox height="20">
      <center>
        <container size="12">
          <prop:decoration color="{{ data.colors.quaternaryDarken }}">
            <prop:borderRadius all="12"/>
          </prop:decoration>
        </container>
      </center>
    </sizedBox>
  </show>
</template>

<template id="leftDot">
  <stack>
    <positioned left="11" top="10" right="0">
      <component id="line" active="{{ template.active }}"/>
    </positioned>

    <positioned left="0" top="1">
      <component id="point" active="{{ template.active }}"/>
    </positioned>

    <sizedBox height="50">
      <align align="bottomLeft">
        <show ifTrue="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="{{ data.colors.primary }}" size="12"/>
          </text>
        </show>
        <show ifFalse="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="{{ data.colors.quaternaryDarken }}" size="12"/>
          </text>
        </show>
      </align>
    </sizedBox>
  </stack>
</template>

<template id="dot">
  <stack>
    <positioned left="0" top="10" right="0">
      <row>
        <expanded>
          <component id="line" active="{{ template.leftActive }}"/>
        </expanded>
        <expanded>
          <component id="line" active="{{ template.rightActive }}"/>
        </expanded>
      </row>
    </positioned>

    <positioned left="0" top="1" right="0">
      <align align="topCenter">
        <component id="point" active="{{ template.active }}" current="{{ template.current }}"/>
      </align>
    </positioned>

    <sizedBox height="50">
      <align align="bottomLeft">
        <show ifTrue="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="{{ data.colors.primary }}" size="12"/>
          </text>
        </show>
        <show ifFalse="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="{{ data.colors.quaternaryDarken }}" size="12"/>
          </text>
        </show>
      </align>
    </sizedBox>
  </stack>
</template>

<template id="rightDot">
  <stack>
    <positioned left="0" top="10" right="11">
      <component id="line" active="{{ template.active }}"/>
    </positioned>

    <positioned top="1" right="0">
      <component id="point" active="{{ template.active }}"/>
    </positioned>

    <sizedBox height="50">
      <align align="bottomLeft">
        <show ifTrue="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="{{ data.colors.primary }}" size="12"/>
          </text>
        </show>
        <show ifFalse="{{ template.active }}">
          <text text="{{ template.title }}">
            <prop:textStyle color="{{ data.colors.quaternaryDarken }}" size="12"/>
          </text>
        </show>
      </align>
    </sizedBox>
  </stack>
</template>

<template id="line">
  <show ifTrue="{{ template.active }}">
    <container height="2" width="100">
      <prop:decoration color="{{ data.colors.primary }}"/>
    </container>
  </show>
  <show ifFalse="{{ template.active }}">
    <container height="2" width="100">
      <prop:decoration color="{{ data.colors.quaternaryDarken }}"/>
    </container>
  </show>
</template>

<template id="lineSpacer">
  <sizedBox height="50">
    <stack fix="expand">
      <positioned left="0" top="10" right="0">
        <component id="line" active="{{ template.active }}"/>
      </positioned>
    </stack>
  </sizedBox>
</template>

<template id="groceryCard">
  <aspectRatio ratio="0.65">
    <stack>
      <container>
        <prop:decoration>
          <prop:border color="{{ data.colors.quaternaryLighten }}" width="1.6"/>
          <prop:borderRadius all="8"/>
        </prop:decoration>
        <column crossAxisAlignment="start">
          <expanded>
            <center>
              <padding top="4" bottom="4">
                <image ref="{{ template.image }}" blurHash="{{ template.blurHash }}"/>
              </padding>
            </center>
          </expanded>
          <expanded>
            <column crossAxisAlignment="start">
              <padding left="{{ data.gap.x2 }}" right="{{ data.gap.x2 }}" bottom="{{ data.gap.x2 }}">
                <column crossAxisAlignment="start">
                  <component id="smallBody" text="{{ template.subtitle }}"/>
                  <component id="middleBody" text="{{ template.title }}"/>
                  <sizedBox height="{{ data.gap.x2 }}"/>
                  <richText>
                    <textSpan text="{{ template.price }}">
                      <prop:textStyle color="{{ data.colors.text.basic }}" size="14"/>
                    </textSpan>
                    <textSpan text="  {{ template.pricePerUnit }}">
                      <prop:textStyle color="{{ data.colors.text.light }}" size="14"/>
                    </textSpan>
                  </richText>
                </column>
              </padding>
              <container height="1.6" width="500" color="{{ data.colors.quaternaryLighten }}"/>
              <expanded>
                <center>
                  <padding left="{{ data.gap.x2 }}" right="{{ data.gap.x2 }}">
                    <row>
                      <show ifTrue="{{ template.inStock }}">
                        <component id="smallBody" text="In stock" color="{{ data.colors.text.basic }}"/>
                      </show>
                      <show ifFalse="{{ template.inStock }}" nullAsFalse="true">
                        <component id="smallBody" text="Out of stock" color="{{ data.colors.text.basic }}"/>
                      </show>
                      <padding left="8" right="8">
                        <container width="1" height="14" color="{{ data.colors.text.basic }}"/>
                      </padding>
                      <sizedBox size="20">
                        <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/location_dark.svg"/>
                      </sizedBox>
                      <sizedBox width="2"/>
                      <component id="smallBody" text="S23" color="{{ data.colors.text.basic }}"/>
                    </row>
                  </padding>
                </center>
              </expanded>
            </column>
          </expanded>
        </column>
      </container>
      <positioned all="0">
        <material type="transparency">
          <prop:borderRadius all="8"/>
          <inkWell onPressed="{{ template.onPressed }}" splashColor="{{ template.splashColor }}" highlightColor="#00FFFFFF">
            <prop:borderRadius all="8"/>
            <container color="#00FFFFFF"/>
          </inkWell>
        </material>
      </positioned>
      <positioned top="8" right="8">
        <component id="roundButton" text="Add" color="{{ data.colors.primary }}" textColor="{{ data.colors.secondary }}"
                   prefix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/plus.svg" onPressed="addToCart"/>
      </positioned>
    </stack>
  </aspectRatio>
</template>

<template id="star">
  <padding right="{{ data.gap.x1 }}">
    <sizedBox size="16">
      <svg ref="{{ template.ref }}"/>
    </sizedBox>
  </padding>
</template>

<template id="rating">
  <row>
    <!-- # FIRST STAR -->
    <show ifTrue="{{ template.rating < 0.5 }}">
      <component id="star" ref="{{ data.star.empty }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 0.5 and template.rating < 1 }}">
      <component id="star" ref="{{ data.star.half }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 1 }}">
      <component id="star" ref="{{ data.star.full }}"/>
    </show>

    <!-- # SECOND STAR -->
    <show ifTrue="{{ template.rating < 1.5 }}">
      <component id="star" ref="{{ data.star.empty }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 1.5 and template.rating < 2 }}">
      <component id="star" ref="{{ data.star.half }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 2 }}">
      <component id="star" ref="{{ data.star.full }}"/>
    </show>

    <!-- # THIRD STAR -->
    <show ifTrue="{{ template.rating < 2.5 }}">
      <component id="star" ref="{{ data.star.empty }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 2.5 and template.rating < 3 }}">
      <component id="star" ref="{{ data.star.half }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 3 }}">
      <component id="star" ref="{{ data.star.full }}"/>
    </show>

    <!-- # FOURTH STAR -->
    <show ifTrue="{{ template.rating < 3.5 }}">
      <component id="star" ref="{{ data.star.empty }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 3.5 and template.rating < 4 }}">
      <component id="star" ref="{{ data.star.half }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 4 }}">
      <component id="star" ref="{{ data.star.full }}"/>
    </show>

    <!-- # FIFTH STAR -->
    <show ifTrue="{{ template.rating < 4.5 }}">
      <component id="star" ref="{{ data.star.empty }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 4.5 and template.rating < 5 }}">
      <component id="star" ref="{{ data.star.half }}"/>
    </show>
    <show ifTrue="{{ template.rating >= 5 }}">
      <component id="star" ref="{{ data.star.full }}"/>
    </show>
  </row>
</template>

<template id="electronicsCard">
  <aspectRatio ratio="0.65">
    <stack>
      <container>
        <prop:decoration>
          <prop:border color="{{ data.colors.quaternaryLighten }}" width="1.6"/>
          <prop:borderRadius all="8"/>
        </prop:decoration>
        <column crossAxisAlignment="start">
          <expanded>
            <center>
              <padding top="4" bottom="4">
                <image ref="{{ template.image }}" blurHash="{{ template.blurHash }}"/>
              </padding>
            </center>
          </expanded>
          <expanded>
            <column crossAxisAlignment="start">
              <padding left="{{ data.gap.x2 }}" right="{{ data.gap.x2 }}" bottom="{{ data.gap.x2 }}">
                <column crossAxisAlignment="start">
                  <component id="smallBody" text="{{ template.subtitle }}"/>
                  <component id="middleBody" text="{{ template.title }}"/>
                  <sizedBox height="{{ data.gap.x2 }}"/>
                  <richText>
                    <textSpan text="{{ template.pricePerMonth }}">
                      <prop:textStyle color="{{ data.colors.text.basic }}" size="14"/>
                    </textSpan>
                    <textSpan text="  {{ template.price }}">
                      <prop:textStyle color="{{ data.colors.text.light }}" size="14"/>
                    </textSpan>
                  </richText>
                </column>
              </padding>
              <container height="1.6" width="500" color="{{ data.colors.quaternaryLighten }}"/>
              <expanded>
                <center>
                  <padding left="{{ data.gap.x2 }}" right="{{ data.gap.x2 }}">
                    <row>
                      <component id="rating" rating="{{ template.rating }}"/>
                      <sizedBox width="{{ data.gap.x1 }}"/>
                      <component id="smallBody" text="({{ template.count }})" color="{{ data.colors.text.light }}"/>
                    </row>
                  </padding>
                </center>
              </expanded>
            </column>
          </expanded>
        </column>
      </container>
      <positioned all="0">
        <material type="transparency">
          <prop:borderRadius all="8"/>
          <inkWell onPressed="{{ template.onPressed }}" splashColor="{{ template.splashColor }}" highlightColor="#00FFFFFF">
            <prop:borderRadius all="8"/>
            <container color="#00FFFFFF"/>
          </inkWell>
        </material>
      </positioned>
      <positioned top="8" right="8">
        <component id="roundButton" text="Add" color="{{ data.colors.primary }}" textColor="{{ data.colors.secondary }}"
                   prefix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/plus.svg" onPressed="addToCart"/>
      </positioned>
    </stack>
  </aspectRatio>
</template>

<template id="brand">
  <padding right="{{ data.gap.x3 }}">
    <stack>
      <sizedBox size="72">
        <svg ref="{{ template.image }}"/>
      </sizedBox>
      <positioned all="0">
        <material type="transparency">
          <prop:borderRadius all="100"/>
          <inkWell onPressed="snackbar: Brand!">
            <prop:borderRadius all="100"/>
            <container color="#00FFFFFF"/>
          </inkWell>
        </material>
      </positioned>
    </stack>
  </padding>
</template>

<!-- # HEADER-->
<sliverPersistentHeader maxExtent="{{ data.header.height }}" minExtent="{{ data.header.height }}" floating="true">
  <container color="{{ data.colors.primary }}" height="{{ data.header.height }}">
    <column>
      <sizedBox height="44"/>
      <padding left="{{ data.gap.x3 }}" top="{{ data.gap.x2 }}" right="{{ data.gap.x3 }}" bottom="{{ data.gap.x2 }}">
        <row>
          <expanded>
            <row mainAxisSize="min">
              <sizedBox size="32">
                <image ref="https://raw.githubusercontent.com/alphamikle/assets/master/images/avatar.png"/>
              </sizedBox>
              <sizedBox width="{{ data.gap.x2 }}"/>
              <text text="Hi, John">
                <prop:textStyle color="{{ data.colors.secondary }}" size="14" font="{{ data.font.main }}"/>
              </text>
            </row>
          </expanded>
          <expanded>
            <sizedBox size="39">
              <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/logo.svg"/>
            </sizedBox>
          </expanded>
          <expanded>
            <row mainAxisAlignment="end">
              <text text="$499.60">
                <prop:textStyle color="{{ data.colors.secondaryDarken }}"/>
              </text>
              <sizedBox width="{{ data.gap.x2 }}"/>
              <stack>
                <padding top="4" right="4">
                  <sizedBox size="24">
                    <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/cart.svg"/>
                  </sizedBox>
                </padding>
                <positioned top="0" right="0">
                  <container size="14">
                    <prop:decoration color="{{ data.colors.tertiary }}">
                      <prop:borderRadius all="14"/>
                    </prop:decoration>
                    <center>
                      <dataBuilder buildWhen="cart.count">
                        <text text="{{ data.cart.count }}" size="9"/>
                      </dataBuilder>
                    </center>
                  </container>
                </positioned>
              </stack>
            </row>
          </expanded>
        </row>
      </padding>
      <padding all="{{ data.gap.x3 }}">
        <textField maxLines="1" onChanged="emit:search">
          <prop:inputDecoration filled="true" simpleBorders="true" fillColor="{{ data.colors.secondary }}" dense="false"
                                hint="Search everything at Walmart">
            <prop:inputBorder type="outline">
              <prop:borderRadius all="60"/>
              <prop:borderSide color="#00FFFFFF" width="0"/>
            </prop:inputBorder>
            <prop:contentPadding left="30"/>
            <alias name="prefixIcon">
              <padding left="8" top="3">
                <sizedBox size="21">
                  <center>
                    <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/search.svg" size="21"/>
                  </center>
                </sizedBox>
              </padding>
            </alias>
            <prop:hintStyle color="{{ data.colors.quaternary }}" size="14" font="{{ data.font.main }}"/>
            <alias name="suffixIcon">
              <padding right="8">
                <sizedBox size="21">
                  <center>
                    <material type="transparent">
                      <prop:borderRadius all="3"/>
                      <inkWell onPressed="snackbar: Let's go scan!">
                        <prop:borderRadius all="3"/>
                        <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/barcode.svg" size="21"/>
                      </inkWell>
                    </material>
                  </center>
                </sizedBox>
              </padding>
            </alias>
          </prop:inputDecoration>
        </textField>
      </padding>
      <row>
        <expanded>
          <container height="36" color="{{ data.colors.primaryDarken }}">
            <row mainAxisSize="min">
              <padding left="{{ data.gap.x3 }}" right="{{ data.gap.x1 }}">
                <sizedBox size="20">
                  <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/home.svg"/>
                </sizedBox>
              </padding>
              <text text="Carrollton Supercenter" color="{{ data.colors.secondary }}" overflow="ellipsis" maxLines="1">
                <prop:textStyle color="{{ data.colors.secondary }}" size="12" font="{{ data.font.main }}"/>
              </text>
            </row>
          </container>
        </expanded>
        <expanded>
          <container height="36" color="{{ data.colors.primaryDarkest }}">
            <row mainAxisSize="min">
              <padding left="{{ data.gap.x3 }}" right="{{ data.gap.x1 }}">
                <sizedBox size="20">
                  <svg ref="https://raw.githubusercontent.com/alphamikle/assets/master/svg/location.svg"/>
                </sizedBox>
              </padding>
              <text text="Dallas 75220" color="{{ data.colors.secondary }}">
                <prop:textStyle color="{{ data.colors.secondary }}" size="12" font="{{ data.font.main }}"/>
              </text>
            </row>
          </container>
        </expanded>
      </row>
    </column>
  </container>
</sliverPersistentHeader>

<sizedBox height="{{ data.gap.x1 }}"/>

<!-- # AD CARDS-->
<sizedBox height="280">
  <listView axis="horizontal">
    <for from="1" to="4">
      <component id="adCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/ad_{{ cycle.value }}.jpeg"
                 title="Free Assembly" noPrefix="{{ cycle.index }}" subtitle="A new brand that looks good." blurHash="LQK^scRP%%%0pe%LnMSj.8W=Rkxt"/>
    </for>
  </listView>
</sizedBox>

<!-- # DELIVERY INFO-->
<padding left="{{ data.gap.x3 }}" top="{{ data.gap.x5 }}" right="{{ data.gap.x3 }}">
  <column mainAxisSize="min" crossAxisAlignment="start">
    <row>
      <column mainAxisSize="min" crossAxisAlignment="start">
        <component id="subtitle" text="Your order is on the way"/>
        <component id="smallBody" text="Arrives today, 3pm – 4pm"/>
      </column>
      <spacer/>
      <component id="roundButton" text="Track" prefix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/location.svg"
                 color="{{ data.colors.primary }}" textColor="{{ data.colors.secondary }}" onPressed="snackbar: Go to track!"/>
    </row>
    <sizedBox height="{{ data.gap.x4 }}"/>
    <row>
      <component id="leftDot" active="true" title="Placed"/>
      <expanded>
        <component id="lineSpacer" active="true"/>
      </expanded>
      <component id="dot" leftActive="true" active="true" rightActive="true" title="Preparing"/>
      <expanded>
        <component id="lineSpacer" active="true"/>
      </expanded>
      <component id="dot" leftActive="true" active="true" rightActive="false" current="true" title="On the way"/>
      <expanded>
        <component id="lineSpacer" active="false"/>
      </expanded>
      <component id="rightDot" active="false" title="Delivered"/>
    </row>
  </column>
</padding>

<sizedBox height="{{ data.gap.x4 }}"/>

<!-- # FILTER CHIPS -->
<sizedBox height="34">
  <listView axis="horizontal">
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="roundButton" color="{{ data.colors.secondaryAccent }}" text="Sort & Filter" onPressed="snackbar: Sort & Filter!"
               prefix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/menu.svg" suffix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"/>
    <sizedBox width="12"/>
    <component id="roundButton" color="{{ data.colors.secondaryAccent }}" text="In store" onPressed="snackbar: In store!"
               suffix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"/>
    <sizedBox width="12"/>
    <component id="roundButton" color="{{ data.colors.secondaryAccent }}" text="Price" onPressed="snackbar: Price!"
               suffix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"/>
    <sizedBox width="12"/>
    <component id="roundButton" color="{{ data.colors.secondaryAccent }}" text="Brand" onPressed="snackbar: Brand!"
               suffix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"/>
    <sizedBox width="12"/>
    <component id="roundButton" color="{{ data.colors.secondaryAccent }}" text="Size" onPressed="snackbar: Size!"
               suffix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"/>
    <sizedBox width="12"/>
    <component id="roundButton" color="{{ data.colors.secondaryAccent }}" text="Color" onPressed="snackbar: Color!"
               suffix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"/>
    <sizedBox width="12"/>
    <component id="roundButton" color="{{ data.colors.secondaryAccent }}" text="Weight" onPressed="snackbar: Weight!"
               suffix="https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg"/>
  </listView>
</sizedBox>

<sizedBox height="{{ data.gap.x4 }}"/>

<!-- # GROCERIES -->
<padding left="{{ data.gap.x3 }}" right="{{ data.gap.x3 }}">
  <richText>
    <textSpan text="Groceries" size="18" color="{{ data.colors.text.basic }}">
      <prop:textStyle weight="w500" height="1.25" font="{{ data.font.main }}"/>
    </textSpan>
    <textSpan text=" (12.3k)" size="18" color="{{ data.colors.text.light }}">
      <prop:textStyle weight="w500" height="1.25" font="{{ data.font.main }}"/>
    </textSpan>
  </richText>
</padding>

<sizedBox height="{{ data.gap.x3 }}"/>

<sizedBox height="252">
  <listView axis="horizontal">
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="groceryCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/apple.png" subtitle="Final cost by weight" title="Gala Apples, 3lb Bag" price="$4.62"
               pricePerUnit="$2.27/lb" inStock="true" onPressed="snackbar: Apple!" splashColor="#1FCF011F"/>
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="groceryCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/bread.png" subtitle="Wonder" title="Wonder Bread Classic" price="$2.39"
               pricePerUnit="11.9 ¢/oz" inStock="true" onPressed="snackbar: Bread!" splashColor="#1FD38B4E"/>
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="groceryCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/milk.png" subtitle="Fairlife 2%" title="Ultra-Filtered Milk" price="$3.98"
               pricePerUnit="7.7 ¢/fl oz" inStock="true" onPressed="snackbar: Milk!" splashColor="#1F66BEEC"/>
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="groceryCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/bananas.png" subtitle="Fresh Produce" title="Bananas, Each" price="$0.21"
               pricePerUnit="each" inStock="true" onPressed="snackbar: Bananas!" splashColor="#1FF5E673"/>
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="groceryCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/peanut_cream.png" subtitle="18 oz, Great Value" title="Creamy Peanut Butter" price="$1.72"
               pricePerUnit="9.6 ¢/oz" inStock="true" onPressed="snackbar: Butter!" splashColor="#1F35221F"/>
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="groceryCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/ice_cream.png" subtitle="Strawberry Cheesecake" title="Ben & Jerry's" price="$4.62"
               pricePerUnit="28.0 ¢/oz" inStock="false" onPressed="snackbar: Ice cream!" splashColor="#1F2A388F"/>
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="groceryCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/avocados.png" subtitle="Fresh Produce" title="Hass Avocados" price="$3.78"
               pricePerUnit="$2.27/lb" inStock="true" onPressed="snackbar: Avocados!" splashColor="#1F5D7428"/>
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="groceryCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/spinach.png" subtitle="Marketside" title="Fresh Spinach, 10 oz" price="$2.18"
               pricePerUnit="21.8 ¢/oz" inStock="true" onPressed="snackbar: Spinach!" splashColor="#1F2E4006"/>
    <sizedBox width="{{ data.gap.x3 }}"/>
  </listView>
</sizedBox>

<sizedBox height="{{ data.gap.x5 }}"/>

<!-- # BRANDS -->
<padding left="{{ data.gap.x3 }}" right="{{ data.gap.x3 }}" bottom="{{ data.gap.x4 }}">
  <component id="subtitle" text="Brands"/>
</padding>

<sizedBox height="72">
  <listView axis="horizontal">
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="brand" image="https://raw.githubusercontent.com/alphamikle/assets/master/svg/gap_logo.svg"/>
    <component id="brand" image="https://raw.githubusercontent.com/alphamikle/assets/master/svg/apple_logo.svg"/>
    <component id="brand" image="https://raw.githubusercontent.com/alphamikle/assets/master/svg/tommy_logo.svg"/>
    <component id="brand" image="https://raw.githubusercontent.com/alphamikle/assets/master/svg/boss_logo.svg"/>
    <component id="brand" image="https://raw.githubusercontent.com/alphamikle/assets/master/svg/levis_logo.svg"/>
    <component id="brand" image="https://raw.githubusercontent.com/alphamikle/assets/master/svg/nautica_logo.svg"/>
    <component id="brand" image="https://raw.githubusercontent.com/alphamikle/assets/master/svg/boots_logo.svg"/>
    <component id="brand" image="https://raw.githubusercontent.com/alphamikle/assets/master/svg/ikea_logo.svg"/>
    <component id="brand" image="https://raw.githubusercontent.com/alphamikle/assets/master/svg/crocodile_logo.svg"/>
    <component id="brand" image="https://raw.githubusercontent.com/alphamikle/assets/master/svg/nike_logo.svg"/>
  </listView>
</sizedBox>

<sizedBox height="{{ data.gap.x6 }}"/>

<!-- # ELECTRONICS -->
<padding left="{{ data.gap.x3 }}" right="{{ data.gap.x3 }}">
  <richText>
    <textSpan text="Electronics" size="18" color="{{ data.colors.text.basic }}">
      <prop:textStyle weight="w500" height="1.25" font="{{ data.font.main }}"/>
    </textSpan>
    <textSpan text=" (3.5k)" size="18" color="{{ data.colors.text.light }}">
      <prop:textStyle weight="w500" height="1.25" font="{{ data.font.main }}"/>
    </textSpan>
  </richText>
</padding>

<sizedBox height="{{ data.gap.x3 }}"/>

<sizedBox height="252">
  <listView axis="horizontal">
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="electronicsCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/watch.png" subtitle="Apple" title="Apple Watch SE GPS" price="$279.00"
               pricePerMonth="$26/mo" onPressed="snackbar: Apple!" splashColor="#1FCABEB4" rating="4.5" count="135"/>
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="electronicsCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/camera.png" subtitle="Canon" title="Canon EOS Rebel T100" price="$379.00"
               pricePerMonth="$36/mo" onPressed="snackbar: Canon!" splashColor="#1F612E65" rating="3.1" count="1.4k"/>
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="electronicsCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/oneplus.png" subtitle="OnePlus" title="OnePlus Nord N200" price="$220.00"
               pricePerMonth="$21/mo" onPressed="snackbar: OnePlus!" splashColor="#1F0C2BBA" rating="3.6" count="70"/>
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="electronicsCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/projector.png" subtitle="Bomaker" title="Bomaker Projector" price="$320.00"
               pricePerMonth="$18/mo" onPressed="snackbar: Projector!" splashColor="#1F30AFF3" rating="3.2" count="80"/>
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="electronicsCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/headphones.png" subtitle="Bose" title="QuietComfort 45" price="$279.00"
               pricePerMonth="$24/mo" onPressed="snackbar: Headphones!" splashColor="#1F363636" rating="4.15" count="250"/>
    <sizedBox width="{{ data.gap.x3 }}"/>
    <component id="electronicsCard" image="https://raw.githubusercontent.com/alphamikle/assets/master/images/drone.png" subtitle="Contixo" title="Contixo F16 FPV" price="$180.00"
               pricePerMonth="$10/mo" onPressed="snackbar: Drone!" splashColor="#1F4F565D" rating="5.0" count="49"/>
    <sizedBox width="{{ data.gap.x3 }}"/>
  </listView>
</sizedBox>

<sizedBox height="{{ data.gap.x5 }}"/>

<sizedBox height="100"/>
''';

const String testBinaryNodes =
    r'EuQCEuECEAAaBGRhdGEqEwoJbmFtZXNwYWNlEgZjb2xvcnMqFAoHcHJpbWFyeRIJI0ZGMEI1OUQ1KhoKDXByaW1hcnlEYXJrZW4SCSNGRjBBNTBDMCobCg5wcmltYXJ5RGFya2VzdBIJI0ZGMDk0OEFEKhYKCXNlY29uZGFyeRIJI0ZGRkZGRkZGKhwKD3NlY29uZGFyeURhcmtlbhIJI0ZGQ0RERUY3KhwKD3NlY29uZGFyeUFjY2VudBIJI0ZGRTlGMkY5KhUKCHRlcnRpYXJ5EgkjRkZGQ0I2MUEqFwoKcXVhdGVybmFyeRIJI0ZGOTk5OTk5Kh0KEHF1YXRlcm5hcnlEYXJrZW4SCSNGRjY5NkU3MCoeChFxdWF0ZXJuYXJ5TGlnaHRlbhIJI0ZGRUVFRUVFKhcKCnRleHQuYmFzaWMSCSNGRjAwMDAwMCoXCgp0ZXh0LmxpZ2h0EgkjRkZEQ0RDREMSLhIsEAAaBGRhdGEqEwoJbmFtZXNwYWNlEgZoZWFkZXIqDQoGaGVpZ2h0EgMyMTUSVhJUEAAaBGRhdGEqEAoJbmFtZXNwYWNlEgNnYXAqBwoCeDESATQqBwoCeDISATgqCAoCeDMSAjE2KggKAng0EgIyNCoICgJ4NRICMzIqCAoCeDYSAjQ4Ei4SLBAAGgRkYXRhKhEKCW5hbWVzcGFjZRIEZm9udCoPCgRtYWluEgdETSBTYW5zEqQCEqECEAAaBGRhdGEqEQoJbmFtZXNwYWNlEgRzdGFyKlYKBWVtcHR5Ek1odHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL3N2Zy9zdGFyX2VtcHR5LnN2ZypUCgRoYWxmEkxodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL3N2Zy9zdGFyX2hhbGYuc3ZnKlYKBGZ1bGwSTmh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvc3ZnL3N0YXJfZmlsbGVkLnN2ZxIbEhkQABoEZGF0YSoPCgpjYXJ0LmNvdW50EgEyEooJEocJEAAaCHRlbXBsYXRlIuoIEucIEAAaB3BhZGRpbmciwAgSvQgQABoDcm93IloSWBAAGgRzaG93IioSKBAAGghzaXplZEJveCoaCgV3aWR0aBIRe3sgZGF0YS5nYXAueDMgfX0qIgoHaWZGYWxzZRIXe3sgdGVtcGxhdGUubm9QcmVmaXggfX0ilgcSkwcQABoLYXNwZWN0UmF0aW8i8wYS8AYQABoJY29udGFpbmVyIn4SfBABGg9wcm9wOmRlY29yYXRpb24iIRIfEAEaEXByb3A6Ym9yZGVyUmFkaXVzKggKA2FsbBIBOCJEEkIQARoLcHJvcDpzaGFkb3cqEgoFY29sb3ISCSMwRjAwMDAwMCoPCgpibHVyUmFkaXVzEgE4KgwKB29mZnNldFkSATQiugUStwUQABoGY29sdW1uIpwBEpkBEAAaCGV4cGFuZGVkIooBEocBEAAaCWNsaXBSUmVjdCJbElkQABoFaW1hZ2UqGwoDcmVmEhR7eyB0ZW1wbGF0ZS5pbWFnZSB9fSoMCgNmaXQSBWNvdmVyKiMKCGJsdXJIYXNoEhd7eyB0ZW1wbGF0ZS5ibHVySGFzaCB9fSoMCgd0b3BMZWZ0EgE4Kg0KCHRvcFJpZ2h0EgE4Iu4DEusDEAAaB3BhZGRpbmciwwMSwAMQABoDcm93IioSKBAAGghzaXplZEJveCoaCgV3aWR0aBIRe3sgZGF0YS5nYXAueDIgfX0irAESqQEQABoGY29sdW1uIj0SOxAAGgljb21wb25lbnQqDgoCaWQSCHN1YnRpdGxlKhwKBHRleHQSFHt7IHRlbXBsYXRlLnRpdGxlIH19IkESPxAAGgljb21wb25lbnQqDwoCaWQSCXNtYWxsQm9keSofCgR0ZXh0Ehd7eyB0ZW1wbGF0ZS5zdWJ0aXRsZSB9fSobChJjcm9zc0F4aXNBbGlnbm1lbnQSBXN0YXJ0IgwSChAAGgZzcGFjZXIizQESygEQABoHcGFkZGluZyKGARKDARAAGghzaXplZEJveCJpEmcQABoDc3ZnKl4KA3JlZhJXaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9zdmcvY2lyY2xlX2NoZXZyb25fcmlnaHQuc3ZnKgoKBHNpemUSAjI0KhgKA3RvcBIRe3sgZGF0YS5nYXAueDIgfX0qGgoFcmlnaHQSEXt7IGRhdGEuZ2FwLngyIH19KhgKA2FsbBIRe3sgZGF0YS5nYXAueDIgfX0qGwoSY3Jvc3NBeGlzQWxpZ25tZW50EgVzdGFydCokCgVjb2xvchIbe3sgZGF0YS5jb2xvcnMuc2Vjb25kYXJ5IH19KgwKBXJhdGlvEgMxLjMiKhIoEAAaCHNpemVkQm94KhoKBXdpZHRoEhF7eyBkYXRhLmdhcC54MyB9fSoTCgxtYWluQXhpc1NpemUSA21pbioJCgN0b3ASAjEyKgwKBmJvdHRvbRICMTIqDAoCaWQSBmFkQ2FyZBKqARKnARAAGgh0ZW1wbGF0ZSKIARKFARAAGgR0ZXh0IlISUBABGg5wcm9wOnRleHRTdHlsZSoOCgZ3ZWlnaHQSBHc1MDAqDgoGaGVpZ2h0EgQxLjI1KhwKBGZvbnQSFHt7IGRhdGEuZm9udC5tYWluIH19KhsKBHRleHQSE3t7IHRlbXBsYXRlLnRleHQgfX0qCgoEc2l6ZRICMTgqDgoCaWQSCHN1YnRpdGxlEq4DEqsDEAAaCHRlbXBsYXRlIrUBErIBEAAaBHNob3cihwEShAEQABoEdGV4dCIyEjAQARoOcHJvcDp0ZXh0U3R5bGUqHAoEZm9udBIUe3sgZGF0YS5mb250Lm1haW4gfX0qGwoEdGV4dBITe3sgdGVtcGxhdGUudGV4dCB9fSoKCgRzaXplEgIxMiodCgVjb2xvchIUe3sgdGVtcGxhdGUuY29sb3IgfX0qHgoGaWZUcnVlEhR7eyB0ZW1wbGF0ZS5jb2xvciB9fSLTARLQARAAGgRzaG93Io8BEowBEAAaBHRleHQiMhIwEAEaDnByb3A6dGV4dFN0eWxlKhwKBGZvbnQSFHt7IGRhdGEuZm9udC5tYWluIH19KhsKBHRleHQSE3t7IHRlbXBsYXRlLnRleHQgfX0qCgoEc2l6ZRICMTIqJQoFY29sb3ISHHt7IGRhdGEuY29sb3JzLnF1YXRlcm5hcnkgfX0qHwoHaWZGYWxzZRIUe3sgdGVtcGxhdGUuY29sb3IgfX0qEwoLbnVsbEFzRmFsc2USBHRydWUqDwoCaWQSCXNtYWxsQm9keRLYARLVARAAGgh0ZW1wbGF0ZSK0ARKxARAAGgR0ZXh0IjISMBABGg5wcm9wOnRleHRTdHlsZSocCgRmb250EhR7eyBkYXRhLmZvbnQubWFpbiB9fSobCgR0ZXh0EhN7eyB0ZW1wbGF0ZS50ZXh0IH19KgoKBHNpemUSAjE0KiUKBWNvbG9yEhx7eyBkYXRhLmNvbG9ycy50ZXh0LmJhc2ljIH19Kg0KCG1heExpbmVzEgEyKhQKCG92ZXJmbG93EghlbGxpcHNpcyoQCgJpZBIKbWlkZGxlQm9keRKTCRKQCRAAGgh0ZW1wbGF0ZSLuCBLrCBAAGgVzdGFjayLpBhLmBhAAGgljb250YWluZXIiWBJWEAEaD3Byb3A6ZGVjb3JhdGlvbiIiEiAQARoRcHJvcDpib3JkZXJSYWRpdXMqCQoDYWxsEgIzMCodCgVjb2xvchIUe3sgdGVtcGxhdGUuY29sb3IgfX0i/AUS+QUQABoHcGFkZGluZyK9BRK6BRAAGgNyb3cipQESogEQABoEc2hvdyJ3EnUQABoHcGFkZGluZyJREk8QABoIc2l6ZWRCb3giNRIzEAAaBmNlbnRlciInEiUQABoDc3ZnKhwKA3JlZhIVe3sgdGVtcGxhdGUucHJlZml4IH19KgoKBHNpemUSAjIwKgkKBGxlZnQSATIqCgoFcmlnaHQSATQqHwoGaWZUcnVlEhV7eyB0ZW1wbGF0ZS5wcmVmaXggfX0iXRJbEAAaBHNob3ciGhIYEAAaCHNpemVkQm94KgoKBXdpZHRoEgE2KiAKB2lmRmFsc2USFXt7IHRlbXBsYXRlLnByZWZpeCB9fSoTCgtudWxsQXNGYWxzZRIEdHJ1ZSKbARKYARAAGgR0ZXh0ImUSYxABGg5wcm9wOnRleHRTdHlsZSocCgRmb250EhR7eyBkYXRhLmZvbnQubWFpbiB9fSohCgVjb2xvchIYe3sgdGVtcGxhdGUudGV4dENvbG9yIH19Kg4KBndlaWdodBIEdzYwMCobCgR0ZXh0EhN7eyB0ZW1wbGF0ZS50ZXh0IH19KgoKBHNpemUSAjE0IpcBEpQBEAAaBHNob3ciaRJnEAAaB3BhZGRpbmciQxJBEAAaCHNpemVkQm94IicSJRAAGgNzdmcqHAoDcmVmEhV7eyB0ZW1wbGF0ZS5zdWZmaXggfX0qCgoEc2l6ZRICMTAqCQoEbGVmdBIBNioKCgVyaWdodBIBNiofCgZpZlRydWUSFXt7IHRlbXBsYXRlLnN1ZmZpeCB9fSJdElsQABoEc2hvdyIaEhgQABoIc2l6ZWRCb3gqCgoFd2lkdGgSATYqIAoHaWZGYWxzZRIVe3sgdGVtcGxhdGUuc3VmZml4IH19KhMKC251bGxBc0ZhbHNlEgR0cnVlKhMKDG1haW5BeGlzU2l6ZRIDbWluKgkKBGxlZnQSATYqCAoDdG9wEgE2KgoKBXJpZ2h0EgE2KgsKBmJvdHRvbRIBNiLzARLwARAAGgRzaG93IsEBEr4BEAAaCnBvc2l0aW9uZWQiowESoAEQABoIbWF0ZXJpYWwiIhIgEAEaEXByb3A6Ym9yZGVyUmFkaXVzKgkKA2FsbBICMzAiWBJWEAAaB2lua1dlbGwiIhIgEAEaEXByb3A6Ym9yZGVyUmFkaXVzKgkKA2FsbBICMzAqJQoJb25QcmVzc2VkEhh7eyB0ZW1wbGF0ZS5vblByZXNzZWQgfX0qFAoEdHlwZRIMdHJhbnNwYXJlbmN5KggKA2FsbBIBMCoiCgZpZlRydWUSGHt7IHRlbXBsYXRlLm9uUHJlc3NlZCB9fSoRCgJpZBILcm91bmRCdXR0b24S7gcS6wcQABoIdGVtcGxhdGUi6AUS5QUQABoEc2hvdyLHAxLEAxAAGgRzaG93IpcDEpQDEAAaCWNvbnRhaW5lciJdElsQARoPcHJvcDpkZWNvcmF0aW9uIiISIBABGhFwcm9wOmJvcmRlclJhZGl1cyoJCgNhbGwSAjIwKiIKBWNvbG9yEhl7eyBkYXRhLmNvbG9ycy5wcmltYXJ5IH19IpkCEpYCEAAaBmNlbnRlciKJAhKGAhAAGgljb250YWluZXIiXxJdEAEaD3Byb3A6ZGVjb3JhdGlvbiIiEiAQARoRcHJvcDpib3JkZXJSYWRpdXMqCQoDYWxsEgIxNiokCgVjb2xvchIbe3sgZGF0YS5jb2xvcnMuc2Vjb25kYXJ5IH19IokBEoYBEAAaBmNlbnRlciJ6EngQABoJY29udGFpbmVyIl0SWxABGg9wcm9wOmRlY29yYXRpb24iIhIgEAEaEXByb3A6Ym9yZGVyUmFkaXVzKgkKA2FsbBICMTIqIgoFY29sb3ISGXt7IGRhdGEuY29sb3JzLnByaW1hcnkgfX0qCgoEc2l6ZRICMTIqCgoEc2l6ZRICMTYqCgoEc2l6ZRICMjAqIAoGaWZUcnVlEhZ7eyB0ZW1wbGF0ZS5jdXJyZW50IH19Iu8BEuwBEAAaBHNob3ciqQESpgEQABoIc2l6ZWRCb3giiQEShgEQABoGY2VudGVyInoSeBAAGgljb250YWluZXIiXRJbEAEaD3Byb3A6ZGVjb3JhdGlvbiIiEiAQARoRcHJvcDpib3JkZXJSYWRpdXMqCQoDYWxsEgIxMioiCgVjb2xvchIZe3sgZGF0YS5jb2xvcnMucHJpbWFyeSB9fSoKCgRzaXplEgIxMioMCgZoZWlnaHQSAjIwKiEKB2lmRmFsc2USFnt7IHRlbXBsYXRlLmN1cnJlbnQgfX0qEwoLbnVsbEFzRmFsc2USBHRydWUqHwoGaWZUcnVlEhV7eyB0ZW1wbGF0ZS5hY3RpdmUgfX0i5AES4QEQABoEc2hvdyK0ARKxARAAGghzaXplZEJveCKUARKRARAAGgZjZW50ZXIihAESgQEQABoJY29udGFpbmVyImYSZBABGg9wcm9wOmRlY29yYXRpb24iIhIgEAEaEXByb3A6Ym9yZGVyUmFkaXVzKgkKA2FsbBICMTIqKwoFY29sb3ISInt7IGRhdGEuY29sb3JzLnF1YXRlcm5hcnlEYXJrZW4gfX0qCgoEc2l6ZRICMTIqDAoGaGVpZ2h0EgIyMCogCgdpZkZhbHNlEhV7eyB0ZW1wbGF0ZS5hY3RpdmUgfX0qCwoCaWQSBXBvaW50EpIFEo8FEAAaCHRlbXBsYXRlIvEEEu4EEAAaBXN0YWNrInESbxAAGgpwb3NpdGlvbmVkIjwSOhAAGgljb21wb25lbnQqCgoCaWQSBGxpbmUqHwoGYWN0aXZlEhV7eyB0ZW1wbGF0ZS5hY3RpdmUgfX0qCgoEbGVmdBICMTEqCQoDdG9wEgIxMCoKCgVyaWdodBIBMCJkEmIQABoKcG9zaXRpb25lZCI9EjsQABoJY29tcG9uZW50KgsKAmlkEgVwb2ludCofCgZhY3RpdmUSFXt7IHRlbXBsYXRlLmFjdGl2ZSB9fSoJCgRsZWZ0EgEwKggKA3RvcBIBMSKJAxKGAxAAGghzaXplZEJveCLpAhLmAhAAGgVhbGlnbiKcARKZARAAGgRzaG93Im4SbBAAGgR0ZXh0IkQSQhABGg5wcm9wOnRleHRTdHlsZSoiCgVjb2xvchIZe3sgZGF0YS5jb2xvcnMucHJpbWFyeSB9fSoKCgRzaXplEgIxMiocCgR0ZXh0EhR7eyB0ZW1wbGF0ZS50aXRsZSB9fSofCgZpZlRydWUSFXt7IHRlbXBsYXRlLmFjdGl2ZSB9fSKmARKjARAAGgRzaG93IncSdRAAGgR0ZXh0Ik0SSxABGg5wcm9wOnRleHRTdHlsZSorCgVjb2xvchIie3sgZGF0YS5jb2xvcnMucXVhdGVybmFyeURhcmtlbiB9fSoKCgRzaXplEgIxMiocCgR0ZXh0EhR7eyB0ZW1wbGF0ZS50aXRsZSB9fSogCgdpZkZhbHNlEhV7eyB0ZW1wbGF0ZS5hY3RpdmUgfX0qEwoFYWxpZ24SCmJvdHRvbUxlZnQqDAoGaGVpZ2h0EgI1MCoNCgJpZBIHbGVmdERvdBLWBhLTBhAAGgh0ZW1wbGF0ZSK5BhK2BhAAGgVzdGFjayLlARLiARAAGgpwb3NpdGlvbmVkIq8BEqwBEAAaA3JvdyJQEk4QABoIZXhwYW5kZWQiQBI+EAAaCWNvbXBvbmVudCoKCgJpZBIEbGluZSojCgZhY3RpdmUSGXt7IHRlbXBsYXRlLmxlZnRBY3RpdmUgfX0iURJPEAAaCGV4cGFuZGVkIkESPxAAGgljb21wb25lbnQqCgoCaWQSBGxpbmUqJAoGYWN0aXZlEhp7eyB0ZW1wbGF0ZS5yaWdodEFjdGl2ZSB9fSoJCgRsZWZ0EgEwKgkKA3RvcBICMTAqCgoFcmlnaHQSATAitgESswEQABoKcG9zaXRpb25lZCKBARJ/EAAaBWFsaWduImASXhAAGgljb21wb25lbnQqCwoCaWQSBXBvaW50Kh8KBmFjdGl2ZRIVe3sgdGVtcGxhdGUuYWN0aXZlIH19KiEKB2N1cnJlbnQSFnt7IHRlbXBsYXRlLmN1cnJlbnQgfX0qEgoFYWxpZ24SCXRvcENlbnRlcioJCgRsZWZ0EgEwKggKA3RvcBIBMSoKCgVyaWdodBIBMCKJAxKGAxAAGghzaXplZEJveCLpAhLmAhAAGgVhbGlnbiKcARKZARAAGgRzaG93Im4SbBAAGgR0ZXh0IkQSQhABGg5wcm9wOnRleHRTdHlsZSoiCgVjb2xvchIZe3sgZGF0YS5jb2xvcnMucHJpbWFyeSB9fSoKCgRzaXplEgIxMiocCgR0ZXh0EhR7eyB0ZW1wbGF0ZS50aXRsZSB9fSofCgZpZlRydWUSFXt7IHRlbXBsYXRlLmFjdGl2ZSB9fSKmARKjARAAGgRzaG93IncSdRAAGgR0ZXh0Ik0SSxABGg5wcm9wOnRleHRTdHlsZSorCgVjb2xvchIie3sgZGF0YS5jb2xvcnMucXVhdGVybmFyeURhcmtlbiB9fSoKCgRzaXplEgIxMiocCgR0ZXh0EhR7eyB0ZW1wbGF0ZS50aXRsZSB9fSogCgdpZkZhbHNlEhV7eyB0ZW1wbGF0ZS5hY3RpdmUgfX0qEwoFYWxpZ24SCmJvdHRvbUxlZnQqDAoGaGVpZ2h0EgI1MCoJCgJpZBIDZG90EpQFEpEFEAAaCHRlbXBsYXRlIvIEEu8EEAAaBXN0YWNrInESbxAAGgpwb3NpdGlvbmVkIjwSOhAAGgljb21wb25lbnQqCgoCaWQSBGxpbmUqHwoGYWN0aXZlEhV7eyB0ZW1wbGF0ZS5hY3RpdmUgfX0qCQoEbGVmdBIBMCoJCgN0b3ASAjEwKgsKBXJpZ2h0EgIxMSJlEmMQABoKcG9zaXRpb25lZCI9EjsQABoJY29tcG9uZW50KgsKAmlkEgVwb2ludCofCgZhY3RpdmUSFXt7IHRlbXBsYXRlLmFjdGl2ZSB9fSoICgN0b3ASATEqCgoFcmlnaHQSATAiiQMShgMQABoIc2l6ZWRCb3gi6QIS5gIQABoFYWxpZ24inAESmQEQABoEc2hvdyJuEmwQABoEdGV4dCJEEkIQARoOcHJvcDp0ZXh0U3R5bGUqIgoFY29sb3ISGXt7IGRhdGEuY29sb3JzLnByaW1hcnkgfX0qCgoEc2l6ZRICMTIqHAoEdGV4dBIUe3sgdGVtcGxhdGUudGl0bGUgfX0qHwoGaWZUcnVlEhV7eyB0ZW1wbGF0ZS5hY3RpdmUgfX0ipgESowEQABoEc2hvdyJ3EnUQABoEdGV4dCJNEksQARoOcHJvcDp0ZXh0U3R5bGUqKwoFY29sb3ISInt7IGRhdGEuY29sb3JzLnF1YXRlcm5hcnlEYXJrZW4gfX0qCgoEc2l6ZRICMTIqHAoEdGV4dBIUe3sgdGVtcGxhdGUudGl0bGUgfX0qIAoHaWZGYWxzZRIVe3sgdGVtcGxhdGUuYWN0aXZlIH19KhMKBWFsaWduEgpib3R0b21MZWZ0KgwKBmhlaWdodBICNTAqDgoCaWQSCHJpZ2h0RG90EtECEs4CEAAaCHRlbXBsYXRlIpMBEpABEAAaBHNob3ciZRJjEAAaCWNvbnRhaW5lciI5EjcQARoPcHJvcDpkZWNvcmF0aW9uKiIKBWNvbG9yEhl7eyBkYXRhLmNvbG9ycy5wcmltYXJ5IH19KgsKBmhlaWdodBIBMioMCgV3aWR0aBIDMTAwKh8KBmlmVHJ1ZRIVe3sgdGVtcGxhdGUuYWN0aXZlIH19Ip0BEpoBEAAaBHNob3cibhJsEAAaCWNvbnRhaW5lciJCEkAQARoPcHJvcDpkZWNvcmF0aW9uKisKBWNvbG9yEiJ7eyBkYXRhLmNvbG9ycy5xdWF0ZXJuYXJ5RGFya2VuIH19KgsKBmhlaWdodBIBMioMCgV3aWR0aBIDMTAwKiAKB2lmRmFsc2USFXt7IHRlbXBsYXRlLmFjdGl2ZSB9fSoKCgJpZBIEbGluZRLRARLOARAAGgh0ZW1wbGF0ZSKtARKqARAAGghzaXplZEJveCKNARKKARAAGgVzdGFjayJwEm4QABoKcG9zaXRpb25lZCI8EjoQABoJY29tcG9uZW50KgoKAmlkEgRsaW5lKh8KBmFjdGl2ZRIVe3sgdGVtcGxhdGUuYWN0aXZlIH19KgkKBGxlZnQSATAqCQoDdG9wEgIxMCoKCgVyaWdodBIBMCoNCgNmaXgSBmV4cGFuZCoMCgZoZWlnaHQSAjUwKhAKAmlkEgpsaW5lU3BhY2VyEvUTEvITEAAaCHRlbXBsYXRlItATEs0TEAAaC2FzcGVjdFJhdGlvIqwTEqkTEAAaBXN0YWNrItYOEtMOEAAaCWNvbnRhaW5lciKIARKFARABGg9wcm9wOmRlY29yYXRpb24iTRJLEAEaC3Byb3A6Ym9yZGVyKiwKBWNvbG9yEiN7eyBkYXRhLmNvbG9ycy5xdWF0ZXJuYXJ5TGlnaHRlbiB9fSoMCgV3aWR0aBIDMS42IiESHxABGhFwcm9wOmJvcmRlclJhZGl1cyoICgNhbGwSATgiuA0StQ0QABoGY29sdW1uIpMBEpABEAAaCGV4cGFuZGVkIoEBEn8QABoGY2VudGVyInMScRAAGgdwYWRkaW5nIk0SSxAAGgVpbWFnZSobCgNyZWYSFHt7IHRlbXBsYXRlLmltYWdlIH19KiMKCGJsdXJIYXNoEhd7eyB0ZW1wbGF0ZS5ibHVySGFzaCB9fSoICgN0b3ASATQqCwoGYm90dG9tEgE0IvULEvILEAAaCGV4cGFuZGVkIuMLEuALEAAaBmNvbHVtbiLJBBLGBBAAGgdwYWRkaW5nIuQDEuEDEAAaBmNvbHVtbiJBEj8QABoJY29tcG9uZW50Kg8KAmlkEglzbWFsbEJvZHkqHwoEdGV4dBIXe3sgdGVtcGxhdGUuc3VidGl0bGUgfX0iPxI9EAAaCWNvbXBvbmVudCoQCgJpZBIKbWlkZGxlQm9keSocCgR0ZXh0EhR7eyB0ZW1wbGF0ZS50aXRsZSB9fSIrEikQABoIc2l6ZWRCb3gqGwoGaGVpZ2h0EhF7eyBkYXRhLmdhcC54MiB9fSKGAhKDAhAAGghyaWNoVGV4dCJ1EnMQABoIdGV4dFNwYW4iRxJFEAEaDnByb3A6dGV4dFN0eWxlKiUKBWNvbG9yEhx7eyBkYXRhLmNvbG9ycy50ZXh0LmJhc2ljIH19KgoKBHNpemUSAjE0KhwKBHRleHQSFHt7IHRlbXBsYXRlLnByaWNlIH19In4SfBAAGgh0ZXh0U3BhbiJHEkUQARoOcHJvcDp0ZXh0U3R5bGUqJQoFY29sb3ISHHt7IGRhdGEuY29sb3JzLnRleHQubGlnaHQgfX0qCgoEc2l6ZRICMTQqJQoEdGV4dBIdICB7eyB0ZW1wbGF0ZS5wcmljZVBlclVuaXQgfX0qGwoSY3Jvc3NBeGlzQWxpZ25tZW50EgVzdGFydCoZCgRsZWZ0EhF7eyBkYXRhLmdhcC54MiB9fSoaCgVyaWdodBIRe3sgZGF0YS5nYXAueDIgfX0qGwoGYm90dG9tEhF7eyBkYXRhLmdhcC54MiB9fSJaElgQABoJY29udGFpbmVyKg0KBmhlaWdodBIDMS42KgwKBXdpZHRoEgM1MDAqLAoFY29sb3ISI3t7IGRhdGEuY29sb3JzLnF1YXRlcm5hcnlMaWdodGVuIH19Io4GEosGEAAaCGV4cGFuZGVkIvwFEvkFEAAaBmNlbnRlciLsBRLpBRAAGgdwYWRkaW5nIqQFEqEFEAAaA3JvdyKIARKFARAAGgRzaG93IlkSVxAAGgljb21wb25lbnQqDwoCaWQSCXNtYWxsQm9keSoQCgR0ZXh0EghJbiBzdG9jayolCgVjb2xvchIce3sgZGF0YS5jb2xvcnMudGV4dC5iYXNpYyB9fSogCgZpZlRydWUSFnt7IHRlbXBsYXRlLmluU3RvY2sgfX0iogESnwEQABoEc2hvdyJdElsQABoJY29tcG9uZW50Kg8KAmlkEglzbWFsbEJvZHkqFAoEdGV4dBIMT3V0IG9mIHN0b2NrKiUKBWNvbG9yEhx7eyBkYXRhLmNvbG9ycy50ZXh0LmJhc2ljIH19KiEKB2lmRmFsc2USFnt7IHRlbXBsYXRlLmluU3RvY2sgfX0qEwoLbnVsbEFzRmFsc2USBHRydWUidhJ0EAAaB3BhZGRpbmciUBJOEAAaCWNvbnRhaW5lcioKCgV3aWR0aBIBMSoMCgZoZWlnaHQSAjE0KiUKBWNvbG9yEhx7eyBkYXRhLmNvbG9ycy50ZXh0LmJhc2ljIH19KgkKBGxlZnQSATgqCgoFcmlnaHQSATgifhJ8EAAaCHNpemVkQm94ImISYBAAGgNzdmcqVwoDcmVmElBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL3N2Zy9sb2NhdGlvbl9kYXJrLnN2ZyoKCgRzaXplEgIyMCIaEhgQABoIc2l6ZWRCb3gqCgoFd2lkdGgSATIiVBJSEAAaCWNvbXBvbmVudCoPCgJpZBIJc21hbGxCb2R5KgsKBHRleHQSA1MyMyolCgVjb2xvchIce3sgZGF0YS5jb2xvcnMudGV4dC5iYXNpYyB9fSoZCgRsZWZ0EhF7eyBkYXRhLmdhcC54MiB9fSoaCgVyaWdodBIRe3sgZGF0YS5nYXAueDIgfX0qGwoSY3Jvc3NBeGlzQWxpZ25tZW50EgVzdGFydCobChJjcm9zc0F4aXNBbGlnbm1lbnQSBXN0YXJ0Iq4CEqsCEAAaCnBvc2l0aW9uZWQikAISjQIQABoIbWF0ZXJpYWwiIRIfEAEaEXByb3A6Ym9yZGVyUmFkaXVzKggKA2FsbBIBOCLFARLCARAAGgdpbmtXZWxsIiESHxABGhFwcm9wOmJvcmRlclJhZGl1cyoICgNhbGwSATgiIxIhEAAaCWNvbnRhaW5lcioSCgVjb2xvchIJIzAwRkZGRkZGKiUKCW9uUHJlc3NlZBIYe3sgdGVtcGxhdGUub25QcmVzc2VkIH19KikKC3NwbGFzaENvbG9yEhp7eyB0ZW1wbGF0ZS5zcGxhc2hDb2xvciB9fSobCg5oaWdobGlnaHRDb2xvchIJIzAwRkZGRkZGKhQKBHR5cGUSDHRyYW5zcGFyZW5jeSoICgNhbGwSATAikwISkAIQABoKcG9zaXRpb25lZCLpARLmARAAGgljb21wb25lbnQqEQoCaWQSC3JvdW5kQnV0dG9uKgsKBHRleHQSA0FkZCoiCgVjb2xvchIZe3sgZGF0YS5jb2xvcnMucHJpbWFyeSB9fSooCgl0ZXh0Q29sb3ISG3t7IGRhdGEuY29sb3JzLnNlY29uZGFyeSB9fSpRCgZwcmVmaXgSR2h0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvc3ZnL3BsdXMuc3ZnKhYKCW9uUHJlc3NlZBIJYWRkVG9DYXJ0KggKA3RvcBIBOCoKCgVyaWdodBIBOCoNCgVyYXRpbxIEMC42NSoRCgJpZBILZ3JvY2VyeUNhcmQSiAEShQEQABoIdGVtcGxhdGUiaxJpEAAaB3BhZGRpbmciQBI+EAAaCHNpemVkQm94IiQSIhAAGgNzdmcqGQoDcmVmEhJ7eyB0ZW1wbGF0ZS5yZWYgfX0qCgoEc2l6ZRICMTYqGgoFcmlnaHQSEXt7IGRhdGEuZ2FwLngxIH19KgoKAmlkEgRzdGFyEpQOEpEOEAAaCHRlbXBsYXRlIvQNEvENEAAaA3JvdyJsEmoQABoEc2hvdyI5EjcQABoJY29tcG9uZW50KgoKAmlkEgRzdGFyKhwKA3JlZhIVe3sgZGF0YS5zdGFyLmVtcHR5IH19KiUKBmlmVHJ1ZRIbe3sgdGVtcGxhdGUucmF0aW5nIDwgMC41IH19IoUBEoIBEAAaBHNob3ciOBI2EAAaCWNvbXBvbmVudCoKCgJpZBIEc3RhciobCgNyZWYSFHt7IGRhdGEuc3Rhci5oYWxmIH19Kj4KBmlmVHJ1ZRI0e3sgdGVtcGxhdGUucmF0aW5nID49IDAuNSBhbmQgdGVtcGxhdGUucmF0aW5nIDwgMSB9fSJqEmgQABoEc2hvdyI4EjYQABoJY29tcG9uZW50KgoKAmlkEgRzdGFyKhsKA3JlZhIUe3sgZGF0YS5zdGFyLmZ1bGwgfX0qJAoGaWZUcnVlEhp7eyB0ZW1wbGF0ZS5yYXRpbmcgPj0gMSB9fSJsEmoQABoEc2hvdyI5EjcQABoJY29tcG9uZW50KgoKAmlkEgRzdGFyKhwKA3JlZhIVe3sgZGF0YS5zdGFyLmVtcHR5IH19KiUKBmlmVHJ1ZRIbe3sgdGVtcGxhdGUucmF0aW5nIDwgMS41IH19IoUBEoIBEAAaBHNob3ciOBI2EAAaCWNvbXBvbmVudCoKCgJpZBIEc3RhciobCgNyZWYSFHt7IGRhdGEuc3Rhci5oYWxmIH19Kj4KBmlmVHJ1ZRI0e3sgdGVtcGxhdGUucmF0aW5nID49IDEuNSBhbmQgdGVtcGxhdGUucmF0aW5nIDwgMiB9fSJqEmgQABoEc2hvdyI4EjYQABoJY29tcG9uZW50KgoKAmlkEgRzdGFyKhsKA3JlZhIUe3sgZGF0YS5zdGFyLmZ1bGwgfX0qJAoGaWZUcnVlEhp7eyB0ZW1wbGF0ZS5yYXRpbmcgPj0gMiB9fSJsEmoQABoEc2hvdyI5EjcQABoJY29tcG9uZW50KgoKAmlkEgRzdGFyKhwKA3JlZhIVe3sgZGF0YS5zdGFyLmVtcHR5IH19KiUKBmlmVHJ1ZRIbe3sgdGVtcGxhdGUucmF0aW5nIDwgMi41IH19IoUBEoIBEAAaBHNob3ciOBI2EAAaCWNvbXBvbmVudCoKCgJpZBIEc3RhciobCgNyZWYSFHt7IGRhdGEuc3Rhci5oYWxmIH19Kj4KBmlmVHJ1ZRI0e3sgdGVtcGxhdGUucmF0aW5nID49IDIuNSBhbmQgdGVtcGxhdGUucmF0aW5nIDwgMyB9fSJqEmgQABoEc2hvdyI4EjYQABoJY29tcG9uZW50KgoKAmlkEgRzdGFyKhsKA3JlZhIUe3sgZGF0YS5zdGFyLmZ1bGwgfX0qJAoGaWZUcnVlEhp7eyB0ZW1wbGF0ZS5yYXRpbmcgPj0gMyB9fSJsEmoQABoEc2hvdyI5EjcQABoJY29tcG9uZW50KgoKAmlkEgRzdGFyKhwKA3JlZhIVe3sgZGF0YS5zdGFyLmVtcHR5IH19KiUKBmlmVHJ1ZRIbe3sgdGVtcGxhdGUucmF0aW5nIDwgMy41IH19IoUBEoIBEAAaBHNob3ciOBI2EAAaCWNvbXBvbmVudCoKCgJpZBIEc3RhciobCgNyZWYSFHt7IGRhdGEuc3Rhci5oYWxmIH19Kj4KBmlmVHJ1ZRI0e3sgdGVtcGxhdGUucmF0aW5nID49IDMuNSBhbmQgdGVtcGxhdGUucmF0aW5nIDwgNCB9fSJqEmgQABoEc2hvdyI4EjYQABoJY29tcG9uZW50KgoKAmlkEgRzdGFyKhsKA3JlZhIUe3sgZGF0YS5zdGFyLmZ1bGwgfX0qJAoGaWZUcnVlEhp7eyB0ZW1wbGF0ZS5yYXRpbmcgPj0gNCB9fSJsEmoQABoEc2hvdyI5EjcQABoJY29tcG9uZW50KgoKAmlkEgRzdGFyKhwKA3JlZhIVe3sgZGF0YS5zdGFyLmVtcHR5IH19KiUKBmlmVHJ1ZRIbe3sgdGVtcGxhdGUucmF0aW5nIDwgNC41IH19IoUBEoIBEAAaBHNob3ciOBI2EAAaCWNvbXBvbmVudCoKCgJpZBIEc3RhciobCgNyZWYSFHt7IGRhdGEuc3Rhci5oYWxmIH19Kj4KBmlmVHJ1ZRI0e3sgdGVtcGxhdGUucmF0aW5nID49IDQuNSBhbmQgdGVtcGxhdGUucmF0aW5nIDwgNSB9fSJqEmgQABoEc2hvdyI4EjYQABoJY29tcG9uZW50KgoKAmlkEgRzdGFyKhsKA3JlZhIUe3sgZGF0YS5zdGFyLmZ1bGwgfX0qJAoGaWZUcnVlEhp7eyB0ZW1wbGF0ZS5yYXRpbmcgPj0gNSB9fSoMCgJpZBIGcmF0aW5nErUQErIQEAAaCHRlbXBsYXRlIowQEokQEAAaC2FzcGVjdFJhdGlvIugPEuUPEAAaBXN0YWNrIpILEo8LEAAaCWNvbnRhaW5lciKIARKFARABGg9wcm9wOmRlY29yYXRpb24iTRJLEAEaC3Byb3A6Ym9yZGVyKiwKBWNvbG9yEiN7eyBkYXRhLmNvbG9ycy5xdWF0ZXJuYXJ5TGlnaHRlbiB9fSoMCgV3aWR0aBIDMS42IiESHxABGhFwcm9wOmJvcmRlclJhZGl1cyoICgNhbGwSATgi9AkS8QkQABoGY29sdW1uIpMBEpABEAAaCGV4cGFuZGVkIoEBEn8QABoGY2VudGVyInMScRAAGgdwYWRkaW5nIk0SSxAAGgVpbWFnZSobCgNyZWYSFHt7IHRlbXBsYXRlLmltYWdlIH19KiMKCGJsdXJIYXNoEhd7eyB0ZW1wbGF0ZS5ibHVySGFzaCB9fSoICgN0b3ASATQqCwoGYm90dG9tEgE0IrEIEq4IEAAaCGV4cGFuZGVkIp8IEpwIEAAaBmNvbHVtbiLKBBLHBBAAGgdwYWRkaW5nIuUDEuIDEAAaBmNvbHVtbiJBEj8QABoJY29tcG9uZW50Kg8KAmlkEglzbWFsbEJvZHkqHwoEdGV4dBIXe3sgdGVtcGxhdGUuc3VidGl0bGUgfX0iPxI9EAAaCWNvbXBvbmVudCoQCgJpZBIKbWlkZGxlQm9keSocCgR0ZXh0EhR7eyB0ZW1wbGF0ZS50aXRsZSB9fSIrEikQABoIc2l6ZWRCb3gqGwoGaGVpZ2h0EhF7eyBkYXRhLmdhcC54MiB9fSKHAhKEAhAAGghyaWNoVGV4dCJ9EnsQABoIdGV4dFNwYW4iRxJFEAEaDnByb3A6dGV4dFN0eWxlKiUKBWNvbG9yEhx7eyBkYXRhLmNvbG9ycy50ZXh0LmJhc2ljIH19KgoKBHNpemUSAjE0KiQKBHRleHQSHHt7IHRlbXBsYXRlLnByaWNlUGVyTW9udGggfX0idxJ1EAAaCHRleHRTcGFuIkcSRRABGg5wcm9wOnRleHRTdHlsZSolCgVjb2xvchIce3sgZGF0YS5jb2xvcnMudGV4dC5saWdodCB9fSoKCgRzaXplEgIxNCoeCgR0ZXh0EhYgIHt7IHRlbXBsYXRlLnByaWNlIH19KhsKEmNyb3NzQXhpc0FsaWdubWVudBIFc3RhcnQqGQoEbGVmdBIRe3sgZGF0YS5nYXAueDIgfX0qGgoFcmlnaHQSEXt7IGRhdGEuZ2FwLngyIH19KhsKBmJvdHRvbRIRe3sgZGF0YS5nYXAueDIgfX0iWhJYEAAaCWNvbnRhaW5lcioNCgZoZWlnaHQSAzEuNioMCgV3aWR0aBIDNTAwKiwKBWNvbG9yEiN7eyBkYXRhLmNvbG9ycy5xdWF0ZXJuYXJ5TGlnaHRlbiB9fSLJAhLGAhAAGghleHBhbmRlZCK3AhK0AhAAGgZjZW50ZXIipwISpAIQABoHcGFkZGluZyLfARLcARAAGgNyb3ciPhI8EAAaCWNvbXBvbmVudCoMCgJpZBIGcmF0aW5nKh8KBnJhdGluZxIVe3sgdGVtcGxhdGUucmF0aW5nIH19IioSKBAAGghzaXplZEJveCoaCgV3aWR0aBIRe3sgZGF0YS5nYXAueDEgfX0iZxJlEAAaCWNvbXBvbmVudCoPCgJpZBIJc21hbGxCb2R5Kh4KBHRleHQSFih7eyB0ZW1wbGF0ZS5jb3VudCB9fSkqJQoFY29sb3ISHHt7IGRhdGEuY29sb3JzLnRleHQubGlnaHQgfX0qGQoEbGVmdBIRe3sgZGF0YS5nYXAueDIgfX0qGgoFcmlnaHQSEXt7IGRhdGEuZ2FwLngyIH19KhsKEmNyb3NzQXhpc0FsaWdubWVudBIFc3RhcnQqGwoSY3Jvc3NBeGlzQWxpZ25tZW50EgVzdGFydCKuAhKrAhAAGgpwb3NpdGlvbmVkIpACEo0CEAAaCG1hdGVyaWFsIiESHxABGhFwcm9wOmJvcmRlclJhZGl1cyoICgNhbGwSATgixQESwgEQABoHaW5rV2VsbCIhEh8QARoRcHJvcDpib3JkZXJSYWRpdXMqCAoDYWxsEgE4IiMSIRAAGgljb250YWluZXIqEgoFY29sb3ISCSMwMEZGRkZGRiolCglvblByZXNzZWQSGHt7IHRlbXBsYXRlLm9uUHJlc3NlZCB9fSopCgtzcGxhc2hDb2xvchIae3sgdGVtcGxhdGUuc3BsYXNoQ29sb3IgfX0qGwoOaGlnaGxpZ2h0Q29sb3ISCSMwMEZGRkZGRioUCgR0eXBlEgx0cmFuc3BhcmVuY3kqCAoDYWxsEgEwIpMCEpACEAAaCnBvc2l0aW9uZWQi6QES5gEQABoJY29tcG9uZW50KhEKAmlkEgtyb3VuZEJ1dHRvbioLCgR0ZXh0EgNBZGQqIgoFY29sb3ISGXt7IGRhdGEuY29sb3JzLnByaW1hcnkgfX0qKAoJdGV4dENvbG9yEht7eyBkYXRhLmNvbG9ycy5zZWNvbmRhcnkgfX0qUQoGcHJlZml4EkdodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL3N2Zy9wbHVzLnN2ZyoWCglvblByZXNzZWQSCWFkZFRvQ2FydCoICgN0b3ASATgqCgoFcmlnaHQSATgqDQoFcmF0aW8SBDAuNjUqFQoCaWQSD2VsZWN0cm9uaWNzQ2FyZBL/AhL8AhAAGgh0ZW1wbGF0ZSLgAhLdAhAAGgdwYWRkaW5nIrMCErACEAAaBXN0YWNrIkISQBAAGghzaXplZEJveCImEiQQABoDc3ZnKhsKA3JlZhIUe3sgdGVtcGxhdGUuaW1hZ2UgfX0qCgoEc2l6ZRICNzIi4AES3QEQABoKcG9zaXRpb25lZCLCARK/ARAAGghtYXRlcmlhbCIjEiEQARoRcHJvcDpib3JkZXJSYWRpdXMqCgoDYWxsEgMxMDAidhJ0EAAaB2lua1dlbGwiIxIhEAEaEXByb3A6Ym9yZGVyUmFkaXVzKgoKA2FsbBIDMTAwIiMSIRAAGgljb250YWluZXIqEgoFY29sb3ISCSMwMEZGRkZGRiodCglvblByZXNzZWQSEHNuYWNrYmFyOiBCcmFuZCEqFAoEdHlwZRIMdHJhbnNwYXJlbmN5KggKA2FsbBIBMCoaCgVyaWdodBIRe3sgZGF0YS5nYXAueDMgfX0qCwoCaWQSBWJyYW5kEqEdEp4dEAAaFnNsaXZlclBlcnNpc3RlbnRIZWFkZXIioRwSnhwQABoJY29udGFpbmVyIsYbEsMbEAAaBmNvbHVtbiIcEhoQABoIc2l6ZWRCb3gqDAoGaGVpZ2h0EgI0NCKAChL9CRAAGgdwYWRkaW5nIoEJEv4IEAAaA3JvdyLhAhLeAhAAGghleHBhbmRlZCLPAhLMAhAAGgNyb3cifBJ6EAAaCHNpemVkQm94ImASXhAAGgVpbWFnZSpTCgNyZWYSTGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvaW1hZ2VzL2F2YXRhci5wbmcqCgoEc2l6ZRICMzIiKhIoEAAaCHNpemVkQm94KhoKBXdpZHRoEhF7eyBkYXRhLmdhcC54MiB9fSKDARKAARAAGgR0ZXh0ImQSYhABGg5wcm9wOnRleHRTdHlsZSokCgVjb2xvchIbe3sgZGF0YS5jb2xvcnMuc2Vjb25kYXJ5IH19KgoKBHNpemUSAjE0KhwKBGZvbnQSFHt7IGRhdGEuZm9udC5tYWluIH19KhAKBHRleHQSCEhpLCBKb2huKhMKDG1haW5BeGlzU2l6ZRIDbWluIoYBEoMBEAAaCGV4cGFuZGVkInUScxAAGghzaXplZEJveCJZElcQABoDc3ZnKk4KA3JlZhJHaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9zdmcvbG9nby5zdmcqCgoEc2l6ZRICMzkihwUShAUQABoIZXhwYW5kZWQi9QQS8gQQABoDcm93Il0SWxAAGgR0ZXh0IkASPhABGg5wcm9wOnRleHRTdHlsZSoqCgVjb2xvchIhe3sgZGF0YS5jb2xvcnMuc2Vjb25kYXJ5RGFya2VuIH19Kg8KBHRleHQSByQ0OTkuNjAiKhIoEAAaCHNpemVkQm94KhoKBXdpZHRoEhF7eyBkYXRhLmdhcC54MiB9fSLDAxLAAxAAGgVzdGFjayKbARKYARAAGgdwYWRkaW5nInUScxAAGghzaXplZEJveCJZElcQABoDc3ZnKk4KA3JlZhJHaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9zdmcvY2FydC5zdmcqCgoEc2l6ZRICMjQqCAoDdG9wEgE0KgoKBXJpZ2h0EgE0IpYCEpMCEAAaCnBvc2l0aW9uZWQi7AES6QEQABoJY29udGFpbmVyIl4SXBABGg9wcm9wOmRlY29yYXRpb24iIhIgEAEaEXByb3A6Ym9yZGVyUmFkaXVzKgkKA2FsbBICMTQqIwoFY29sb3ISGnt7IGRhdGEuY29sb3JzLnRlcnRpYXJ5IH19Im4SbBAAGgZjZW50ZXIiYBJeEAAaC2RhdGFCdWlsZGVyIjQSMhAAGgR0ZXh0Kh0KBHRleHQSFXt7IGRhdGEuY2FydC5jb3VudCB9fSoJCgRzaXplEgE5KhcKCWJ1aWxkV2hlbhIKY2FydC5jb3VudCoKCgRzaXplEgIxNCoICgN0b3ASATAqCgoFcmlnaHQSATAqGAoRbWFpbkF4aXNBbGlnbm1lbnQSA2VuZCoZCgRsZWZ0EhF7eyBkYXRhLmdhcC54MyB9fSoYCgN0b3ASEXt7IGRhdGEuZ2FwLngyIH19KhoKBXJpZ2h0EhF7eyBkYXRhLmdhcC54MyB9fSobCgZib3R0b20SEXt7IGRhdGEuZ2FwLngyIH19IvgIEvUIEAAaB3BhZGRpbmcizQgSyggQABoJdGV4dEZpZWxkIpEIEo4IEAEaFHByb3A6aW5wdXREZWNvcmF0aW9uIoMBEoABEAEaEHByb3A6aW5wdXRCb3JkZXIiIhIgEAEaEXByb3A6Ym9yZGVyUmFkaXVzKgkKA2FsbBICNjAiNRIzEAEaD3Byb3A6Ym9yZGVyU2lkZSoSCgVjb2xvchIJIzAwRkZGRkZGKgoKBXdpZHRoEgEwKg8KBHR5cGUSB291dGxpbmUiJRIjEAEaE3Byb3A6Y29udGVudFBhZGRpbmcqCgoEbGVmdBICMzAi2wES2AEQABoFYWxpYXMiuAEStQEQABoHcGFkZGluZyKSARKPARAAGghzaXplZEJveCJ1EnMQABoGY2VudGVyImcSZRAAGgNzdmcqUAoDcmVmEklodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL3N2Zy9zZWFyY2guc3ZnKgoKBHNpemUSAjIxKgoKBHNpemUSAjIxKgkKBGxlZnQSATgqCAoDdG9wEgEzKhIKBG5hbWUSCnByZWZpeEljb24iZRJjEAEaDnByb3A6aGludFN0eWxlKiUKBWNvbG9yEhx7eyBkYXRhLmNvbG9ycy5xdWF0ZXJuYXJ5IH19KgoKBHNpemUSAjE0KhwKBGZvbnQSFHt7IGRhdGEuZm9udC5tYWluIH19IvoCEvcCEAAaBWFsaWFzItcCEtQCEAAaB3BhZGRpbmciugIStwIQABoIc2l6ZWRCb3ginAISmQIQABoGY2VudGVyIowCEokCEAAaCG1hdGVyaWFsIiESHxABGhFwcm9wOmJvcmRlclJhZGl1cyoICgNhbGwSATMiwgESvwEQABoHaW5rV2VsbCIhEh8QARoRcHJvcDpib3JkZXJSYWRpdXMqCAoDYWxsEgEzImgSZhAAGgNzdmcqUQoDcmVmEkpodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL3N2Zy9iYXJjb2RlLnN2ZyoKCgRzaXplEgIyMSolCglvblByZXNzZWQSGHNuYWNrYmFyOiBMZXQncyBnbyBzY2FuISoTCgR0eXBlEgt0cmFuc3BhcmVudCoKCgRzaXplEgIyMSoKCgVyaWdodBIBOCoSCgRuYW1lEgpzdWZmaXhJY29uKg4KBmZpbGxlZBIEdHJ1ZSoVCg1zaW1wbGVCb3JkZXJzEgR0cnVlKigKCWZpbGxDb2xvchIbe3sgZGF0YS5jb2xvcnMuc2Vjb25kYXJ5IH19Kg4KBWRlbnNlEgVmYWxzZSokCgRoaW50EhxTZWFyY2ggZXZlcnl0aGluZyBhdCBXYWxtYXJ0Kg0KCG1heExpbmVzEgExKhgKCW9uQ2hhbmdlZBILZW1pdDpzZWFyY2gqGAoDYWxsEhF7eyBkYXRhLmdhcC54MyB9fSKaCBKXCBAAGgNyb3cimgQSlwQQABoIZXhwYW5kZWQiiAQShQQQABoJY29udGFpbmVyIr0DEroDEAAaA3JvdyK8ARK5ARAAGgdwYWRkaW5nInUScxAAGghzaXplZEJveCJZElcQABoDc3ZnKk4KA3JlZhJHaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9zdmcvaG9tZS5zdmcqCgoEc2l6ZRICMjAqGQoEbGVmdBIRe3sgZGF0YS5nYXAueDMgfX0qGgoFcmlnaHQSEXt7IGRhdGEuZ2FwLngxIH19ItwBEtkBEAAaBHRleHQiZBJiEAEaDnByb3A6dGV4dFN0eWxlKiQKBWNvbG9yEht7eyBkYXRhLmNvbG9ycy5zZWNvbmRhcnkgfX0qCgoEc2l6ZRICMTIqHAoEZm9udBIUe3sgZGF0YS5mb250Lm1haW4gfX0qHgoEdGV4dBIWQ2Fycm9sbHRvbiBTdXBlcmNlbnRlciokCgVjb2xvchIbe3sgZGF0YS5jb2xvcnMuc2Vjb25kYXJ5IH19KhQKCG92ZXJmbG93EghlbGxpcHNpcyoNCghtYXhMaW5lcxIBMSoTCgxtYWluQXhpc1NpemUSA21pbioMCgZoZWlnaHQSAjM2KigKBWNvbG9yEh97eyBkYXRhLmNvbG9ycy5wcmltYXJ5RGFya2VuIH19IvADEu0DEAAaCGV4cGFuZGVkIt4DEtsDEAAaCWNvbnRhaW5lciKSAxKPAxAAGgNyb3ciwAESvQEQABoHcGFkZGluZyJ5EncQABoIc2l6ZWRCb3giXRJbEAAaA3N2ZypSCgNyZWYSS2h0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvc3ZnL2xvY2F0aW9uLnN2ZyoKCgRzaXplEgIyMCoZCgRsZWZ0EhF7eyBkYXRhLmdhcC54MyB9fSoaCgVyaWdodBIRe3sgZGF0YS5nYXAueDEgfX0irQESqgEQABoEdGV4dCJkEmIQARoOcHJvcDp0ZXh0U3R5bGUqJAoFY29sb3ISG3t7IGRhdGEuY29sb3JzLnNlY29uZGFyeSB9fSoKCgRzaXplEgIxMiocCgRmb250EhR7eyBkYXRhLmZvbnQubWFpbiB9fSoUCgR0ZXh0EgxEYWxsYXMgNzUyMjAqJAoFY29sb3ISG3t7IGRhdGEuY29sb3JzLnNlY29uZGFyeSB9fSoTCgxtYWluQXhpc1NpemUSA21pbioMCgZoZWlnaHQSAjM2KikKBWNvbG9yEiB7eyBkYXRhLmNvbG9ycy5wcmltYXJ5RGFya2VzdCB9fSoiCgVjb2xvchIZe3sgZGF0YS5jb2xvcnMucHJpbWFyeSB9fSoiCgZoZWlnaHQSGHt7IGRhdGEuaGVhZGVyLmhlaWdodCB9fSolCgltYXhFeHRlbnQSGHt7IGRhdGEuaGVhZGVyLmhlaWdodCB9fSolCgltaW5FeHRlbnQSGHt7IGRhdGEuaGVhZGVyLmhlaWdodCB9fSoQCghmbG9hdGluZxIEdHJ1ZRIrEikQABoIc2l6ZWRCb3gqGwoGaGVpZ2h0EhF7eyBkYXRhLmdhcC54MSB9fRL3AhL0AhAAGghzaXplZEJveCLWAhLTAhAAGghsaXN0VmlldyKwAhKtAhAAGgNmb3IijwISjAIQABoJY29tcG9uZW50KgwKAmlkEgZhZENhcmQqZAoFaW1hZ2USW2h0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvaW1hZ2VzL2FkX3t7IGN5Y2xlLnZhbHVlIH19LmpwZWcqFgoFdGl0bGUSDUZyZWUgQXNzZW1ibHkqHQoIbm9QcmVmaXgSEXt7IGN5Y2xlLmluZGV4IH19KigKCHN1YnRpdGxlEhxBIG5ldyBicmFuZCB0aGF0IGxvb2tzIGdvb2QuKigKCGJsdXJIYXNoEhxMUUtec2NSUCUlJTBwZSVMbk1Tai44Vz1Sa3h0KgkKBGZyb20SATEqBwoCdG8SATQqEgoEYXhpcxIKaG9yaXpvbnRhbCoNCgZoZWlnaHQSAzI4MBL2CRLzCRAAGgdwYWRkaW5nIpQJEpEJEAAaBmNvbHVtbiLiAxLfAxAAGgNyb3ciyAESxQEQABoGY29sdW1uIkESPxAAGgljb21wb25lbnQqDgoCaWQSCHN1YnRpdGxlKiAKBHRleHQSGFlvdXIgb3JkZXIgaXMgb24gdGhlIHdheSJEEkIQABoJY29tcG9uZW50Kg8KAmlkEglzbWFsbEJvZHkqIgoEdGV4dBIaQXJyaXZlcyB0b2RheSwgM3BtIOKAkyA0cG0qEwoMbWFpbkF4aXNTaXplEgNtaW4qGwoSY3Jvc3NBeGlzQWxpZ25tZW50EgVzdGFydCIMEgoQABoGc3BhY2VyIvwBEvkBEAAaCWNvbXBvbmVudCoRCgJpZBILcm91bmRCdXR0b24qDQoEdGV4dBIFVHJhY2sqVQoGcHJlZml4EktodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL3N2Zy9sb2NhdGlvbi5zdmcqIgoFY29sb3ISGXt7IGRhdGEuY29sb3JzLnByaW1hcnkgfX0qKAoJdGV4dENvbG9yEht7eyBkYXRhLmNvbG9ycy5zZWNvbmRhcnkgfX0qIwoJb25QcmVzc2VkEhZzbmFja2JhcjogR28gdG8gdHJhY2shIisSKRAAGghzaXplZEJveCobCgZoZWlnaHQSEXt7IGRhdGEuZ2FwLng0IH19IsAEEr0EEAAaA3JvdyI/Ej0QABoJY29tcG9uZW50Kg0KAmlkEgdsZWZ0RG90Kg4KBmFjdGl2ZRIEdHJ1ZSoPCgV0aXRsZRIGUGxhY2VkIkESPxAAGghleHBhbmRlZCIxEi8QABoJY29tcG9uZW50KhAKAmlkEgpsaW5lU3BhY2VyKg4KBmFjdGl2ZRIEdHJ1ZSJnEmUQABoJY29tcG9uZW50KgkKAmlkEgNkb3QqEgoKbGVmdEFjdGl2ZRIEdHJ1ZSoOCgZhY3RpdmUSBHRydWUqEwoLcmlnaHRBY3RpdmUSBHRydWUqEgoFdGl0bGUSCVByZXBhcmluZyJBEj8QABoIZXhwYW5kZWQiMRIvEAAaCWNvbXBvbmVudCoQCgJpZBIKbGluZVNwYWNlcioOCgZhY3RpdmUSBHRydWUiehJ4EAAaCWNvbXBvbmVudCoJCgJpZBIDZG90KhIKCmxlZnRBY3RpdmUSBHRydWUqDgoGYWN0aXZlEgR0cnVlKhQKC3JpZ2h0QWN0aXZlEgVmYWxzZSoPCgdjdXJyZW50EgR0cnVlKhMKBXRpdGxlEgpPbiB0aGUgd2F5IkISQBAAGghleHBhbmRlZCIyEjAQABoJY29tcG9uZW50KhAKAmlkEgpsaW5lU3BhY2VyKg8KBmFjdGl2ZRIFZmFsc2UiRBJCEAAaCWNvbXBvbmVudCoOCgJpZBIIcmlnaHREb3QqDwoGYWN0aXZlEgVmYWxzZSoSCgV0aXRsZRIJRGVsaXZlcmVkKhMKDG1haW5BeGlzU2l6ZRIDbWluKhsKEmNyb3NzQXhpc0FsaWdubWVudBIFc3RhcnQqGQoEbGVmdBIRe3sgZGF0YS5nYXAueDMgfX0qGAoDdG9wEhF7eyBkYXRhLmdhcC54NSB9fSoaCgVyaWdodBIRe3sgZGF0YS5nYXAueDMgfX0SKxIpEAAaCHNpemVkQm94KhsKBmhlaWdodBIRe3sgZGF0YS5nYXAueDQgfX0SkQ8Sjg8QABoIc2l6ZWRCb3gi8Q4S7g4QABoIbGlzdFZpZXciKhIoEAAaCHNpemVkQm94KhoKBXdpZHRoEhF7eyBkYXRhLmdhcC54MyB9fSK9AhK6AhAAGgljb21wb25lbnQqEQoCaWQSC3JvdW5kQnV0dG9uKioKBWNvbG9yEiF7eyBkYXRhLmNvbG9ycy5zZWNvbmRhcnlBY2NlbnQgfX0qFQoEdGV4dBINU29ydCAmIEZpbHRlciolCglvblByZXNzZWQSGHNuYWNrYmFyOiBTb3J0ICYgRmlsdGVyISpRCgZwcmVmaXgSR2h0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvc3ZnL21lbnUuc3ZnKlsKBnN1ZmZpeBJRaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9zdmcvY2hldnJvbl9ib3R0b20uc3ZnIhsSGRAAGghzaXplZEJveCoLCgV3aWR0aBICMTIi4AES3QEQABoJY29tcG9uZW50KhEKAmlkEgtyb3VuZEJ1dHRvbioqCgVjb2xvchIhe3sgZGF0YS5jb2xvcnMuc2Vjb25kYXJ5QWNjZW50IH19KhAKBHRleHQSCEluIHN0b3JlKiAKCW9uUHJlc3NlZBITc25hY2tiYXI6IEluIHN0b3JlISpbCgZzdWZmaXgSUWh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvc3ZnL2NoZXZyb25fYm90dG9tLnN2ZyIbEhkQABoIc2l6ZWRCb3gqCwoFd2lkdGgSAjEyItoBEtcBEAAaCWNvbXBvbmVudCoRCgJpZBILcm91bmRCdXR0b24qKgoFY29sb3ISIXt7IGRhdGEuY29sb3JzLnNlY29uZGFyeUFjY2VudCB9fSoNCgR0ZXh0EgVQcmljZSodCglvblByZXNzZWQSEHNuYWNrYmFyOiBQcmljZSEqWwoGc3VmZml4ElFodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL3N2Zy9jaGV2cm9uX2JvdHRvbS5zdmciGxIZEAAaCHNpemVkQm94KgsKBXdpZHRoEgIxMiLaARLXARAAGgljb21wb25lbnQqEQoCaWQSC3JvdW5kQnV0dG9uKioKBWNvbG9yEiF7eyBkYXRhLmNvbG9ycy5zZWNvbmRhcnlBY2NlbnQgfX0qDQoEdGV4dBIFQnJhbmQqHQoJb25QcmVzc2VkEhBzbmFja2JhcjogQnJhbmQhKlsKBnN1ZmZpeBJRaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9zdmcvY2hldnJvbl9ib3R0b20uc3ZnIhsSGRAAGghzaXplZEJveCoLCgV3aWR0aBICMTIi2AES1QEQABoJY29tcG9uZW50KhEKAmlkEgtyb3VuZEJ1dHRvbioqCgVjb2xvchIhe3sgZGF0YS5jb2xvcnMuc2Vjb25kYXJ5QWNjZW50IH19KgwKBHRleHQSBFNpemUqHAoJb25QcmVzc2VkEg9zbmFja2JhcjogU2l6ZSEqWwoGc3VmZml4ElFodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL3N2Zy9jaGV2cm9uX2JvdHRvbS5zdmciGxIZEAAaCHNpemVkQm94KgsKBXdpZHRoEgIxMiLaARLXARAAGgljb21wb25lbnQqEQoCaWQSC3JvdW5kQnV0dG9uKioKBWNvbG9yEiF7eyBkYXRhLmNvbG9ycy5zZWNvbmRhcnlBY2NlbnQgfX0qDQoEdGV4dBIFQ29sb3IqHQoJb25QcmVzc2VkEhBzbmFja2JhcjogQ29sb3IhKlsKBnN1ZmZpeBJRaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9zdmcvY2hldnJvbl9ib3R0b20uc3ZnIhsSGRAAGghzaXplZEJveCoLCgV3aWR0aBICMTIi3AES2QEQABoJY29tcG9uZW50KhEKAmlkEgtyb3VuZEJ1dHRvbioqCgVjb2xvchIhe3sgZGF0YS5jb2xvcnMuc2Vjb25kYXJ5QWNjZW50IH19Kg4KBHRleHQSBldlaWdodCoeCglvblByZXNzZWQSEXNuYWNrYmFyOiBXZWlnaHQhKlsKBnN1ZmZpeBJRaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9zdmcvY2hldnJvbl9ib3R0b20uc3ZnKhIKBGF4aXMSCmhvcml6b250YWwqDAoGaGVpZ2h0EgIzNBIrEikQABoIc2l6ZWRCb3gqGwoGaGVpZ2h0EhF7eyBkYXRhLmdhcC54NCB9fRKuAxKrAxAAGgdwYWRkaW5nIuYCEuMCEAAaCHJpY2hUZXh0IqkBEqYBEAAaCHRleHRTcGFuIlISUBABGg5wcm9wOnRleHRTdHlsZSoOCgZ3ZWlnaHQSBHc1MDAqDgoGaGVpZ2h0EgQxLjI1KhwKBGZvbnQSFHt7IGRhdGEuZm9udC5tYWluIH19KhEKBHRleHQSCUdyb2NlcmllcyoKCgRzaXplEgIxOColCgVjb2xvchIce3sgZGF0YS5jb2xvcnMudGV4dC5iYXNpYyB9fSKoARKlARAAGgh0ZXh0U3BhbiJSElAQARoOcHJvcDp0ZXh0U3R5bGUqDgoGd2VpZ2h0EgR3NTAwKg4KBmhlaWdodBIEMS4yNSocCgRmb250EhR7eyBkYXRhLmZvbnQubWFpbiB9fSoQCgR0ZXh0EgggKDEyLjNrKSoKCgRzaXplEgIxOColCgVjb2xvchIce3sgZGF0YS5jb2xvcnMudGV4dC5saWdodCB9fSoZCgRsZWZ0EhF7eyBkYXRhLmdhcC54MyB9fSoaCgVyaWdodBIRe3sgZGF0YS5nYXAueDMgfX0SKxIpEAAaCHNpemVkQm94KhsKBmhlaWdodBIRe3sgZGF0YS5nYXAueDMgfX0SthYSsxYQABoIc2l6ZWRCb3gilRYSkhYQABoIbGlzdFZpZXciKhIoEAAaCHNpemVkQm94KhoKBXdpZHRoEhF7eyBkYXRhLmdhcC54MyB9fSKuAhKrAhAAGgljb21wb25lbnQqEQoCaWQSC2dyb2NlcnlDYXJkKlQKBWltYWdlEktodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL2ltYWdlcy9hcHBsZS5wbmcqIAoIc3VidGl0bGUSFEZpbmFsIGNvc3QgYnkgd2VpZ2h0Kh0KBXRpdGxlEhRHYWxhIEFwcGxlcywgM2xiIEJhZyoOCgVwcmljZRIFJDQuNjIqGAoMcHJpY2VQZXJVbml0EggkMi4yNy9sYioPCgdpblN0b2NrEgR0cnVlKh0KCW9uUHJlc3NlZBIQc25hY2tiYXI6IEFwcGxlISoYCgtzcGxhc2hDb2xvchIJIzFGQ0YwMTFGIioSKBAAGghzaXplZEJveCoaCgV3aWR0aBIRe3sgZGF0YS5nYXAueDMgfX0iogISnwIQABoJY29tcG9uZW50KhEKAmlkEgtncm9jZXJ5Q2FyZCpUCgVpbWFnZRJLaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9pbWFnZXMvYnJlYWQucG5nKhIKCHN1YnRpdGxlEgZXb25kZXIqHQoFdGl0bGUSFFdvbmRlciBCcmVhZCBDbGFzc2ljKg4KBXByaWNlEgUkMi4zOSoaCgxwcmljZVBlclVuaXQSCjExLjkgwqIvb3oqDwoHaW5TdG9jaxIEdHJ1ZSodCglvblByZXNzZWQSEHNuYWNrYmFyOiBCcmVhZCEqGAoLc3BsYXNoQ29sb3ISCSMxRkQzOEI0RSIqEigQABoIc2l6ZWRCb3gqGgoFd2lkdGgSEXt7IGRhdGEuZ2FwLngzIH19IqYCEqMCEAAaCWNvbXBvbmVudCoRCgJpZBILZ3JvY2VyeUNhcmQqUwoFaW1hZ2USSmh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvaW1hZ2VzL21pbGsucG5nKhcKCHN1YnRpdGxlEgtGYWlybGlmZSAyJSocCgV0aXRsZRITVWx0cmEtRmlsdGVyZWQgTWlsayoOCgVwcmljZRIFJDMuOTgqHAoMcHJpY2VQZXJVbml0Egw3LjcgwqIvZmwgb3oqDwoHaW5TdG9jaxIEdHJ1ZSocCglvblByZXNzZWQSD3NuYWNrYmFyOiBNaWxrISoYCgtzcGxhc2hDb2xvchIJIzFGNjZCRUVDIioSKBAAGghzaXplZEJveCoaCgV3aWR0aBIRe3sgZGF0YS5nYXAueDMgfX0ioAISnQIQABoJY29tcG9uZW50KhEKAmlkEgtncm9jZXJ5Q2FyZCpWCgVpbWFnZRJNaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9pbWFnZXMvYmFuYW5hcy5wbmcqGQoIc3VidGl0bGUSDUZyZXNoIFByb2R1Y2UqFgoFdGl0bGUSDUJhbmFuYXMsIEVhY2gqDgoFcHJpY2USBSQwLjIxKhQKDHByaWNlUGVyVW5pdBIEZWFjaCoPCgdpblN0b2NrEgR0cnVlKh8KCW9uUHJlc3NlZBISc25hY2tiYXI6IEJhbmFuYXMhKhgKC3NwbGFzaENvbG9yEgkjMUZGNUU2NzMiKhIoEAAaCHNpemVkQm94KhoKBXdpZHRoEhF7eyBkYXRhLmdhcC54MyB9fSK1AhKyAhAAGgljb21wb25lbnQqEQoCaWQSC2dyb2NlcnlDYXJkKlsKBWltYWdlElJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL2ltYWdlcy9wZWFudXRfY3JlYW0ucG5nKh4KCHN1YnRpdGxlEhIxOCBveiwgR3JlYXQgVmFsdWUqHQoFdGl0bGUSFENyZWFteSBQZWFudXQgQnV0dGVyKg4KBXByaWNlEgUkMS43MioZCgxwcmljZVBlclVuaXQSCTkuNiDCoi9veioPCgdpblN0b2NrEgR0cnVlKh4KCW9uUHJlc3NlZBIRc25hY2tiYXI6IEJ1dHRlciEqGAoLc3BsYXNoQ29sb3ISCSMxRjM1MjIxRiIqEigQABoIc2l6ZWRCb3gqGgoFd2lkdGgSEXt7IGRhdGEuZ2FwLngzIH19IrMCErACEAAaCWNvbXBvbmVudCoRCgJpZBILZ3JvY2VyeUNhcmQqWAoFaW1hZ2UST2h0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvaW1hZ2VzL2ljZV9jcmVhbS5wbmcqIQoIc3VidGl0bGUSFVN0cmF3YmVycnkgQ2hlZXNlY2FrZSoWCgV0aXRsZRINQmVuICYgSmVycnkncyoOCgVwcmljZRIFJDQuNjIqGgoMcHJpY2VQZXJVbml0EgoyOC4wIMKiL296KhAKB2luU3RvY2sSBWZhbHNlKiEKCW9uUHJlc3NlZBIUc25hY2tiYXI6IEljZSBjcmVhbSEqGAoLc3BsYXNoQ29sb3ISCSMxRjJBMzg4RiIqEigQABoIc2l6ZWRCb3gqGgoFd2lkdGgSEXt7IGRhdGEuZ2FwLngzIH19IqYCEqMCEAAaCWNvbXBvbmVudCoRCgJpZBILZ3JvY2VyeUNhcmQqVwoFaW1hZ2USTmh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvaW1hZ2VzL2F2b2NhZG9zLnBuZyoZCghzdWJ0aXRsZRINRnJlc2ggUHJvZHVjZSoWCgV0aXRsZRINSGFzcyBBdm9jYWRvcyoOCgVwcmljZRIFJDMuNzgqGAoMcHJpY2VQZXJVbml0EggkMi4yNy9sYioPCgdpblN0b2NrEgR0cnVlKiAKCW9uUHJlc3NlZBITc25hY2tiYXI6IEF2b2NhZG9zISoYCgtzcGxhc2hDb2xvchIJIzFGNUQ3NDI4IioSKBAAGghzaXplZEJveCoaCgV3aWR0aBIRe3sgZGF0YS5nYXAueDMgfX0iqgISpwIQABoJY29tcG9uZW50KhEKAmlkEgtncm9jZXJ5Q2FyZCpWCgVpbWFnZRJNaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9pbWFnZXMvc3BpbmFjaC5wbmcqFgoIc3VidGl0bGUSCk1hcmtldHNpZGUqHQoFdGl0bGUSFEZyZXNoIFNwaW5hY2gsIDEwIG96Kg4KBXByaWNlEgUkMi4xOCoaCgxwcmljZVBlclVuaXQSCjIxLjggwqIvb3oqDwoHaW5TdG9jaxIEdHJ1ZSofCglvblByZXNzZWQSEnNuYWNrYmFyOiBTcGluYWNoISoYCgtzcGxhc2hDb2xvchIJIzFGMkU0MDA2IioSKBAAGghzaXplZEJveCoaCgV3aWR0aBIRe3sgZGF0YS5nYXAueDMgfX0qEgoEYXhpcxIKaG9yaXpvbnRhbCoNCgZoZWlnaHQSAzI1MhIrEikQABoIc2l6ZWRCb3gqGwoGaGVpZ2h0EhF7eyBkYXRhLmdhcC54NSB9fRKTARKQARAAGgdwYWRkaW5nIi8SLRAAGgljb21wb25lbnQqDgoCaWQSCHN1YnRpdGxlKg4KBHRleHQSBkJyYW5kcyoZCgRsZWZ0EhF7eyBkYXRhLmdhcC54MyB9fSoaCgVyaWdodBIRe3sgZGF0YS5nYXAueDMgfX0qGwoGYm90dG9tEhF7eyBkYXRhLmdhcC54NCB9fRKMChKJChAAGghzaXplZEJveCLsCRLpCRAAGghsaXN0VmlldyIqEigQABoIc2l6ZWRCb3gqGgoFd2lkdGgSEXt7IGRhdGEuZ2FwLngzIH19InIScBAAGgljb21wb25lbnQqCwoCaWQSBWJyYW5kKlQKBWltYWdlEktodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL3N2Zy9nYXBfbG9nby5zdmcidBJyEAAaCWNvbXBvbmVudCoLCgJpZBIFYnJhbmQqVgoFaW1hZ2USTWh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvc3ZnL2FwcGxlX2xvZ28uc3ZnInQSchAAGgljb21wb25lbnQqCwoCaWQSBWJyYW5kKlYKBWltYWdlEk1odHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL3N2Zy90b21teV9sb2dvLnN2ZyJzEnEQABoJY29tcG9uZW50KgsKAmlkEgVicmFuZCpVCgVpbWFnZRJMaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9zdmcvYm9zc19sb2dvLnN2ZyJ0EnIQABoJY29tcG9uZW50KgsKAmlkEgVicmFuZCpWCgVpbWFnZRJNaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9zdmcvbGV2aXNfbG9nby5zdmcidhJ0EAAaCWNvbXBvbmVudCoLCgJpZBIFYnJhbmQqWAoFaW1hZ2UST2h0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvc3ZnL25hdXRpY2FfbG9nby5zdmcidBJyEAAaCWNvbXBvbmVudCoLCgJpZBIFYnJhbmQqVgoFaW1hZ2USTWh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvc3ZnL2Jvb3RzX2xvZ28uc3ZnInMScRAAGgljb21wb25lbnQqCwoCaWQSBWJyYW5kKlUKBWltYWdlEkxodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL3N2Zy9pa2VhX2xvZ28uc3ZnIngSdhAAGgljb21wb25lbnQqCwoCaWQSBWJyYW5kKloKBWltYWdlElFodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL3N2Zy9jcm9jb2RpbGVfbG9nby5zdmcicxJxEAAaCWNvbXBvbmVudCoLCgJpZBIFYnJhbmQqVQoFaW1hZ2USTGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvc3ZnL25pa2VfbG9nby5zdmcqEgoEYXhpcxIKaG9yaXpvbnRhbCoMCgZoZWlnaHQSAjcyEisSKRAAGghzaXplZEJveCobCgZoZWlnaHQSEXt7IGRhdGEuZ2FwLng2IH19Eq8DEqwDEAAaB3BhZGRpbmci5wIS5AIQABoIcmljaFRleHQiqwESqAEQABoIdGV4dFNwYW4iUhJQEAEaDnByb3A6dGV4dFN0eWxlKg4KBndlaWdodBIEdzUwMCoOCgZoZWlnaHQSBDEuMjUqHAoEZm9udBIUe3sgZGF0YS5mb250Lm1haW4gfX0qEwoEdGV4dBILRWxlY3Ryb25pY3MqCgoEc2l6ZRICMTgqJQoFY29sb3ISHHt7IGRhdGEuY29sb3JzLnRleHQuYmFzaWMgfX0ipwESpAEQABoIdGV4dFNwYW4iUhJQEAEaDnByb3A6dGV4dFN0eWxlKg4KBndlaWdodBIEdzUwMCoOCgZoZWlnaHQSBDEuMjUqHAoEZm9udBIUe3sgZGF0YS5mb250Lm1haW4gfX0qDwoEdGV4dBIHICgzLjVrKSoKCgRzaXplEgIxOColCgVjb2xvchIce3sgZGF0YS5jb2xvcnMudGV4dC5saWdodCB9fSoZCgRsZWZ0EhF7eyBkYXRhLmdhcC54MyB9fSoaCgVyaWdodBIRe3sgZGF0YS5nYXAueDMgfX0SKxIpEAAaCHNpemVkQm94KhsKBmhlaWdodBIRe3sgZGF0YS5nYXAueDMgfX0SsxESsBEQABoIc2l6ZWRCb3gikhESjxEQABoIbGlzdFZpZXciKhIoEAAaCHNpemVkQm94KhoKBXdpZHRoEhF7eyBkYXRhLmdhcC54MyB9fSKuAhKrAhAAGgljb21wb25lbnQqFQoCaWQSD2VsZWN0cm9uaWNzQ2FyZCpUCgVpbWFnZRJLaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9pbWFnZXMvd2F0Y2gucG5nKhEKCHN1YnRpdGxlEgVBcHBsZSobCgV0aXRsZRISQXBwbGUgV2F0Y2ggU0UgR1BTKhAKBXByaWNlEgckMjc5LjAwKhcKDXByaWNlUGVyTW9udGgSBiQyNi9tbyodCglvblByZXNzZWQSEHNuYWNrYmFyOiBBcHBsZSEqGAoLc3BsYXNoQ29sb3ISCSMxRkNBQkVCNCoNCgZyYXRpbmcSAzQuNSoMCgVjb3VudBIDMTM1IioSKBAAGghzaXplZEJveCoaCgV3aWR0aBIRe3sgZGF0YS5nYXAueDMgfX0isgISrwIQABoJY29tcG9uZW50KhUKAmlkEg9lbGVjdHJvbmljc0NhcmQqVQoFaW1hZ2USTGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvaW1hZ2VzL2NhbWVyYS5wbmcqEQoIc3VidGl0bGUSBUNhbm9uKh0KBXRpdGxlEhRDYW5vbiBFT1MgUmViZWwgVDEwMCoQCgVwcmljZRIHJDM3OS4wMCoXCg1wcmljZVBlck1vbnRoEgYkMzYvbW8qHQoJb25QcmVzc2VkEhBzbmFja2JhcjogQ2Fub24hKhgKC3NwbGFzaENvbG9yEgkjMUY2MTJFNjUqDQoGcmF0aW5nEgMzLjEqDQoFY291bnQSBDEuNGsiKhIoEAAaCHNpemVkQm94KhoKBXdpZHRoEhF7eyBkYXRhLmdhcC54MyB9fSKyAhKvAhAAGgljb21wb25lbnQqFQoCaWQSD2VsZWN0cm9uaWNzQ2FyZCpWCgVpbWFnZRJNaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FscGhhbWlrbGUvYXNzZXRzL21hc3Rlci9pbWFnZXMvb25lcGx1cy5wbmcqEwoIc3VidGl0bGUSB09uZVBsdXMqGgoFdGl0bGUSEU9uZVBsdXMgTm9yZCBOMjAwKhAKBXByaWNlEgckMjIwLjAwKhcKDXByaWNlUGVyTW9udGgSBiQyMS9tbyofCglvblByZXNzZWQSEnNuYWNrYmFyOiBPbmVQbHVzISoYCgtzcGxhc2hDb2xvchIJIzFGMEMyQkJBKg0KBnJhdGluZxIDMy42KgsKBWNvdW50EgI3MCIqEigQABoIc2l6ZWRCb3gqGgoFd2lkdGgSEXt7IGRhdGEuZ2FwLngzIH19IrYCErMCEAAaCWNvbXBvbmVudCoVCgJpZBIPZWxlY3Ryb25pY3NDYXJkKlgKBWltYWdlEk9odHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL2ltYWdlcy9wcm9qZWN0b3IucG5nKhMKCHN1YnRpdGxlEgdCb21ha2VyKhoKBXRpdGxlEhFCb21ha2VyIFByb2plY3RvcioQCgVwcmljZRIHJDMyMC4wMCoXCg1wcmljZVBlck1vbnRoEgYkMTgvbW8qIQoJb25QcmVzc2VkEhRzbmFja2JhcjogUHJvamVjdG9yISoYCgtzcGxhc2hDb2xvchIJIzFGMzBBRkYzKg0KBnJhdGluZxIDMy4yKgsKBWNvdW50EgI4MCIqEigQABoIc2l6ZWRCb3gqGgoFd2lkdGgSEXt7IGRhdGEuZ2FwLngzIH19IrUCErICEAAaCWNvbXBvbmVudCoVCgJpZBIPZWxlY3Ryb25pY3NDYXJkKlkKBWltYWdlElBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWxwaGFtaWtsZS9hc3NldHMvbWFzdGVyL2ltYWdlcy9oZWFkcGhvbmVzLnBuZyoQCghzdWJ0aXRsZRIEQm9zZSoYCgV0aXRsZRIPUXVpZXRDb21mb3J0IDQ1KhAKBXByaWNlEgckMjc5LjAwKhcKDXByaWNlUGVyTW9udGgSBiQyNC9tbyoiCglvblByZXNzZWQSFXNuYWNrYmFyOiBIZWFkcGhvbmVzISoYCgtzcGxhc2hDb2xvchIJIzFGMzYzNjM2Kg4KBnJhdGluZxIENC4xNSoMCgVjb3VudBIDMjUwIioSKBAAGghzaXplZEJveCoaCgV3aWR0aBIRe3sgZGF0YS5nYXAueDMgfX0irAISqQIQABoJY29tcG9uZW50KhUKAmlkEg9lbGVjdHJvbmljc0NhcmQqVAoFaW1hZ2USS2h0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hbHBoYW1pa2xlL2Fzc2V0cy9tYXN0ZXIvaW1hZ2VzL2Ryb25lLnBuZyoTCghzdWJ0aXRsZRIHQ29udGl4byoYCgV0aXRsZRIPQ29udGl4byBGMTYgRlBWKhAKBXByaWNlEgckMTgwLjAwKhcKDXByaWNlUGVyTW9udGgSBiQxMC9tbyodCglvblByZXNzZWQSEHNuYWNrYmFyOiBEcm9uZSEqGAoLc3BsYXNoQ29sb3ISCSMxRjRGNTY1RCoNCgZyYXRpbmcSAzUuMCoLCgVjb3VudBICNDkiKhIoEAAaCHNpemVkQm94KhoKBXdpZHRoEhF7eyBkYXRhLmdhcC54MyB9fSoSCgRheGlzEgpob3Jpem9udGFsKg0KBmhlaWdodBIDMjUyEisSKRAAGghzaXplZEJveCobCgZoZWlnaHQSEXt7IGRhdGEuZ2FwLng1IH19Eh0SGxAAGghzaXplZEJveCoNCgZoZWlnaHQSAzEwMA==';
