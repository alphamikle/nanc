# Nanc: Fields

The field is one of the most important components of Nanc. Each field is responsible for storing one value in the document (string in SQL, Document in NoSQL, etc.). However, the field value can be either the simplest types, such as a string or a number, or complex ones - typed arrays, objects, or entire screens of a mobile application.

Below is a list of fields available for use in Nanc:

### Boolean field

Responsible for setting any boolean flag. Can take a default value if no value is given.

### Color field

Controls color. A handy color-picker is available to you for choosing colors and controlling transparency, and you can also set it manually in hex format.

### DateTime field

Stores time and date in ISO format `2023-06-24T00:00:00.000Z` and can also manage fields like `created_at` and `updated_at` by automatically updating the appropriate values in your data object when you do something operations with it using Nanc.

### Dynamic field

A field that is best described as "typed JSON". You can add any other field to this field (including the **Dynamic field** itself), with all the features of each of the added fields, as well as manage the sorting of these fields.

### Enum field

A field for selecting a single value from a set of values. It is assumed that this set will not be too large - up to several tens of values. Although there is no formal meaning in terms of the number of values. Each value in the set has a name and content, such as `String`.

### Font field

This field is responsible for selecting the font family. At the data level, this is a normal string of type `String`. Using this field, you can search and select any of the available **Google Fonts** fonts, and you can also add your own fonts and they will be available for selection in this field. The purpose of this field's existence is to make it easier to choose a font for text when you're creating interfaces with Nanc using the **Screen field**, however, you can think of other uses for it.

### Header field

It's not exactly a field, in the usual sense. This *field* serves as a separator between fields or as a heading for a group of fields. For example - you can group fields related to color management and give them a common title *Color palette*. This field does not affect your data in any way and will not be stored in it.

###Icon field

The field that stores the name of the icon, in the `String` format. You can choose from several thousand built-in icons, and in the future the ability to expand this list will be added. Icons, like fonts, are mostly useful when building application interfaces with Nanc.

### ID field

The only required field for any **Model**. It is of type `String` and serves as a unique identifier for each document. A document can have multiple `Id fields`, however, the first one specified will be used as the unique identifier. The preferred value for this field is UUID, however you can use any value.

### Multi Selector field

A field used to display one-to-many relationships between documents. A document that has this field specified can store links to other documents. These links will be the values of this field, however, the way of storing links by many (and ourselves) will be called "relational". The API of this field assumes that you have at least three collections (tables) in your database.

**First collection** is a collection of parent documents - documents *that* will select other documents.

**Second collection** - documents *of which* parent documents will be selected as a value.

**Third collection** - stores document identifiers from **first** and **second** collections. Preferably, if the third collection will not only store two identifiers, but also have its own record identifier, which will uniquely identify the relationship of two documents (this is necessary, since not all data providers can have composite keys and select from them, therefore, for a unique single document definitions, currently, a single identifier is used.

### Number field

A field that stores a numeric value. The data type is `num` (can be either `int` or `double`).

### Screen field

The field responsible for creating the interface of a mobile application written in Flutter. The data type is `String`. This line can be quite large, so be careful about the limits you place on the size of this field in your document. The value of this field can be of two types - `Scrollable` and `Stack`. This field and Nanc's ability to create interfaces will be discussed in more detail in the chapter on Backend Driven UI.

### Selector field

A field that is also responsible for links between documents. But in this case it is a one-to-one or many-to-one relationship. In order for you could use this field, you must have at least two collections (tables):

**First collection** - collection of parent documents. You will add a `Selector field` to the documents of this particular collection. And when editing the documents of this particular collection, you will *choose*.

**Second collection** - a collection of child documents from which you will choose the only one for the documents of the parent collection.

The data type of this field is `String`. The preferred value is the UUID, however, it can be any unique string (which is the ID of another document). By selecting a child document in the parent document, you set the child document ID as the value of the corresponding field in the parent document.

### String field

A simple field for storing data of type `String`.

### Structured field

A field for storing an array of values of a predefined type. Or to store a single value, also of a predefined type. When you describe this field in code or create it in the interface, you will have to describe / create the type of value structure that will be stored in this field. The structure can be of any complexity and include other **Structured fields**.