
import 'package:fluro/fluro.dart';

import 'package:login_dashboard/router/admin_handlers.dart';
import 'package:login_dashboard/router/dashboard_handlers.dart';
import 'package:login_dashboard/router/no_page_found_handlers.dart';

class Flurorouter {

  static final FluroRouter router = FluroRouter();

  static String rootRoute     = '/';

  // Auth routes
  static String loginRoute    = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard routes
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';

  static void configureRoutes() {
    // Auto Routes
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none);

    // Dashboard Routes
    router.define(dashboardRoute, handler: DashboardHandlers.dashboard, transitionType: TransitionType.none);
    router.define(iconsRoute, handler: DashboardHandlers.icons, transitionType: TransitionType.none);
    router.define(blankRoute, handler: DashboardHandlers.blank, transitionType: TransitionType.none);

    // 404 
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
  

}