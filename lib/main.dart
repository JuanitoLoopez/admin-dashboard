import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:login_dashboard/router/router.dart';
import 'package:login_dashboard/providers/sidemenu_provider.dart';
import 'package:login_dashboard/providers/auth_provider.dart';
import 'package:login_dashboard/services/navigation_service.dart';
import 'package:login_dashboard/services/local_storage.dart';

import 'package:login_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:login_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:login_dashboard/ui/layouts/splash/splash_layout.dart';

void main() async {
  await LocalStorage.configurePrefs(); 
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => SidemenuProvider(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: Flurorouter.rootRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      builder: (_, child) {

        final authProvider = Provider.of<AuthProvider>(context);
        // LocalStorage.prefs.getString('token');

        if(authProvider.authStatus == AuthStatus.checking) {
          return const SplashLayout();
        }

        if(authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }

      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.4))
        )
      ),
    );
  }
}