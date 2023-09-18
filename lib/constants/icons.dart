enum AppIcons {
  lock('lock'),
  check('check'),
  google('google'),
  close('close'),
  home('home'),
  profile('profile'),
  image('image'),
  message('message');

  const AppIcons(this._name);

  final String _name;

  String get path => 'assets/icons/$_name.svg';
}
