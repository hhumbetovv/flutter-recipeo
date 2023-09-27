enum AppImages {
  orbitCenter('orbit-center'),
  orbit('orbit'),
  success('success');

  const AppImages(this._name);

  final String _name;

  String get png => 'assets/images/$_name.png';
  String get jpg => 'assets/images/$_name.jpg';
  String get svg => 'assets/images/$_name.svg';

  String at(int index) => 'assets/images/$_name-$index.jpg';
}
