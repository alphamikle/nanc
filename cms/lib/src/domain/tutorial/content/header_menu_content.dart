const String collectionDescription = '''
A "Collection" is a recurring entity that you're going to manage. As an example, let's take a library, a website or an application for which we have to make. The collections in it will be:
- Book
- Author
- User
- Reader
- Librarian
...and more
''';

const String soloDescription = '''
"Solo" is a unique entity that exists in a single copy. Using the library as an example, Solo models could be:
- An entity with information about the library itself, such as "Library Info"
- Since we've already mentioned that we're making an app, but what about in it without Feature Toggles? Let's call this Solo Entity as "App Feature Toggles"
- And what library today would be without its own website? Let's add "Web Feature Toggles" as well

And finally, to bring a little subject specifics - the library app contains a dynamic home screen, which is very often changed for various holidays and library events (a very active library, which every week holds different contests). This home screen can be changed once a week and almost beyond recognition. What to do? It is quite useful to create a Solo entity "App Main View", which will allow to fulfill all the whims. Read on to find out how this will be done.
''';

const String editorDescription = '''
The Editor is responsible for the creation and editing of models - Solo and Collections.
''';

const String rolesDescription = '''
The Roles section, for now, is in development and will be available a little bit later 🛠
In short - with Roles, you will change any aspect of the security - atomized level of settings for each field of any model. With no limit of roles count
''';

const String settingsDescription = '''
The Settings is in development too ⚙️
But in the future with this section, you will be allowed to change, for example, your specific settings, such a theme of the NANC or requests params, which will affect only you.
''';
