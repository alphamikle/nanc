typedef Coordinates = (double lat, double long);

Coordinates getCoordinates() {
  return (30.513, 25.116);
}

interface class User {
  final String name = '';
}

class Mike implements User {
  Mike(this.name);

  @override
  final String name;
}

void main() {
  final Coordinates coordinates = getCoordinates();
  print(coordinates);
  print(coordinates.lat);
  print(coordinates.long);
  final mike = Mike('Alfa');
  print(mike);
}

extension NamedCoordinates on Coordinates {
  double get lat => this.$1;
  double get long => this.$2;
}