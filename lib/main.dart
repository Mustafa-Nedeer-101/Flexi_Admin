import 'package:admin/core/service_locator/get_it.dart';
import 'package:admin/core/theme/app_theme.dart';
import 'package:admin/firebase_options.dart';
import 'package:admin/routing/app_router.dart';
import 'package:admin/routing/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  // Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Getit
  await setupDependencyInjecion();

  // Main app starts here...
  runApp(const AdminApp());
}

class AdminApp extends StatelessWidget {
  const AdminApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      themeMode: ThemeMode.light,
      theme: CustomAppTheme.lightTheme,
      darkTheme: CustomAppTheme.darkTheme,
      initialRoute: Routes.login,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
