enum AppIcons {
  lock('lock'),
  check('check'),
  google('google'),
  message('message');

  const AppIcons(this._name);

  final String _name;

  String get path => 'assets/icons/$_name.svg';
}
