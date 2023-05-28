import 'package:fluro/fluro.dart';
import 'package:login_dashboard/ui/views/dashboard_view.dart';
import 'package:provider/provider.dart';

import 'package:login_dashboard/providers/auth_provider.dart';
import 'package:login_dashboard/ui/views/login_view.dart';
import 'package:login_dashboard/ui/views/register_view.dart';

class AdminHandlers {

  static final login = Handler(
    handlerFunc: (context, params) {

      final authProvider = Provider.of<AuthProvider>(context!);
      
      if(authProvider.authStatus == AuthStatus.notAuthenticated) {
        return const LoginView();
      } else {
        return const DashboardView();
      }

    }
  );

  static final register = Handler(
    handlerFunc: (context, params) {
      
      final authProvider = Provider.of<AuthProvider>(context!);
      
      if(authProvider.authStatus == AuthStatus.notAuthenticated) {
        return const RegisterView();
      } else {
        return const DashboardView();
      }
      
    }
  );

}

