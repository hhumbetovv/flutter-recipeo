enum AppImages {
  orbitCenter('orbit-center'),
  orbit('orbit');

  const AppImages(this._name);

  final String _name;

  String get jpg => 'assets/images/$_name.jpg';
  String get svg => 'assets/images/$_name.svg';

  String at(int index) => 'assets/images/$_name-$index.jpg';
}
