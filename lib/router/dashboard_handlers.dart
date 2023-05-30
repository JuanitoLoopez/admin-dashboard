import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:login_dashboard/router/router.dart';

import 'package:login_dashboard/providers/auth_provider.dart';
import 'package:login_dashboard/providers/sidemenu_provider.dart';

import 'package:login_dashboard/ui/views/views.dart';

class DashboardHandlers {

  static final dashboard = Handler(
    handlerFunc: (context, params) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidemenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);
      
      if(authProvider.authStatus == AuthStatus.authenticated) {
        return const DashboardView();
      } else {
        return const LoginView();
      }
    }
  );

  static final icons = Handler(
    handlerFunc: (context, params) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidemenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsRoute);
      
      if(authProvider.authStatus == AuthStatus.authenticated) {
        return const IconsView();
      } else {
        return const LoginView();
      }
    }
  );
  
  static final blank = Handler(
    handlerFunc: (context, params) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidemenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.blankRoute);
      
      if(authProvider.authStatus == AuthStatus.authenticated) {
        return const BlankView();
      } else {
        return const LoginView();
      }
    }
  );

}
