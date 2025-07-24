import 'package:flutter_application_1/features/auth/ui/screens/screens.dart';
import 'package:go_router/go_router.dart';

const splashScreen = '/splash-screen';
const introScreen = '/intro-screen';
const signInScreen = '/sign-in-screen';
const signUpScreen = '/sign-up-screen';

final router = GoRouter(
  initialLocation: splashScreen,
  routes: [
    GoRoute(
      path: splashScreen,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: introScreen,
      builder: (context, state) {
        return const IntroScreen();
      },
    ),
    GoRoute(
      path: signInScreen,
      builder: (context, state) {
        return const SigninScreen();
      },
    ),
    GoRoute(
      path: signUpScreen,
      builder: (context, state) {
        return const SignupScreen();
      },
    ),
  ],
);
