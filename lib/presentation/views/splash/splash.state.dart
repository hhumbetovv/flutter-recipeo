part of 'splash.view.dart';

sealed class _SplashState extends State<SplashView> {
  Color linearBegin = Colors.white;
  final Color linearEnd = Colors.white;

  @override
  void initState() {
    super.initState();
    _animate();
  }

  void _animate() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        linearBegin = AppColors.primary;
      });
    });
    await Future.delayed(const Duration(milliseconds: 3000));
    _checkAuth();
  }

  void _checkAuth() async {
    AuthService authService = locator<AuthService>();
    String? userId = authService.currentUserId;
    if (userId == null && mounted) {
      context.go(Routes.onboard);
    } else if (await authService.isFirstRun && mounted) {
      context.go(Routes.createProfile);
    }
    if (userId != null) context.go(Routes.home);
  }
}
