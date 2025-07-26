import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/configs.dart';
import 'package:flutter_application_1/features/auth/presentation/ui/helpers/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
  await Environment.initEnvironment();
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: AppTheme().getTheme(true),
      scaffoldMessengerKey: MessagesService.scaffoldMessengerKey,
    );
  }
}
