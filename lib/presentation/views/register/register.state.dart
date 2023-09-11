part of 'register.view.dart';

sealed class RegisterState extends State<RegisterView> with LoadingState {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onFormSubmit() async {
    toggleLoading();
    if (registerFormKey.currentState!.validate()) {
      AuthService authService = locator<AuthService>();
      try {
        await authService.register(
          email: emailController.text,
          password: passwordController.text,
        );
        if (mounted) context.go(Routes.createProfile);
      } on FirebaseAuthException catch (e) {
        if (context.mounted) showAppSnackBar(context, FirebaseFailures.getAuthFailure(e.code));
      }
    }
    toggleLoading();
  }
}
