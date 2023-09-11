part of 'login.view.dart';

sealed class LoginState extends State<LoginView> with LoadingState {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool emailHasError = false;
  bool passwordHasError = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onFormSubmit() async {
    toggleLoading();
    setError();
    if (loginFormKey.currentState!.validate()) {
      AuthService authService = locator<AuthService>();
      try {
        await authService.login(
          email: emailController.text,
          password: passwordController.text,
        );
        if (await authService.isFirstRun && mounted) {
          context.go(Routes.createProfile);
        } else if (mounted) {
          context.go(Routes.home);
        }
      } on FirebaseAuthException catch (e) {
        setError(e.code);
        debugPrint(e.code);
        if (context.mounted) showAppSnackBar(context, FirebaseFailures.getAuthFailure(e.code));
      }
    }
    toggleLoading();
  }

  void setError([String? code]) {
    setState(() {
      switch (code) {
        case 'user-not-found':
          emailHasError = true;
          break;
        case 'wrong-password':
          passwordHasError = true;
          break;
        default:
          emailHasError = false;
          passwordHasError = false;
          break;
      }
    });
  }
}
