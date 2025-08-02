import 'package:flutter_application_1/features/auth/presentation/ui/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/jobs/presentation/ui/screens/screens.dart';


part 'app_router.g.dart';

const splashScreen = '/splash-screen';
const introScreen = '/intro-screen';
const signInScreen = '/sign-in-screen';
const signUpScreen = '/sign-up-screen';
const homeScreen = '/home-screen';
const detailsScreen = '/details-screen';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
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
          return SigninScreen();
        },
      ),
      GoRoute(
        path: signUpScreen,
        builder: (context, state) {
          return const SignupScreen();
        },
      ),
      GoRoute(
        path: homeScreen,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: detailsScreen,
        builder: (context, state) {
          final refJob = state.extra as String;
          return JobDetailsScreen(refJob: refJob);
        },
      ),
    ],
  );
}
