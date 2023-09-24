enum AppIcons {
  lock('lock'),
  check('check'),
  google('google'),
  close('close'),
  home('home'),
  profile('profile'),
  gallery('gallery'),
  camera('camera'),
  add('add'),
  drag('drag'),
  message('message');

  const AppIcons(this._name);

  final String _name;

  String get path => 'assets/icons/$_name.svg';
}
