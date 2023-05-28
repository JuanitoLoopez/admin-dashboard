import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:login_dashboard/providers/auth_provider.dart';
import 'package:login_dashboard/ui/views/login_view.dart';
import 'package:login_dashboard/ui/views/dashboard_view.dart';

class DashboardHandlers {

  static final dashboard = Handler(
    handlerFunc: (context, params) {

      final authProvider = Provider.of<AuthProvider>(context!);
      
      if(authProvider.authStatus == AuthStatus.authenticated) {
        return const DashboardView();
      } else {
        return const LoginView();
      }
    }
  );

}
