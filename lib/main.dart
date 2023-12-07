import 'package:flutter/material.dart';
import 'package:musicee_app/routes/app_router.dart';
import 'package:musicee_app/routes/routes.dart';
import 'package:musicee_app/services/auth/auth_manager.dart';
import 'package:musicee_app/utils/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AuthManager.init();
  AppRouter.initialRoute =
      AuthManager.hasToken() ? Routes.homeScreen : Routes.welcomeScreen;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.lightTheme,
      title: 'Musicee App',
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
