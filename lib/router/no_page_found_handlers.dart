import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:login_dashboard/providers/sidemenu_provider.dart';
import 'package:login_dashboard/ui/views/no_page_found_view.dart';

class NoPageFoundHandlers {

  static final noPageFound = Handler(
    handlerFunc: (context, params) {

      Provider.of<SidemenuProvider>(context!, listen: false)
        .setCurrentPageUrl('/404');
      
      return const NoPageFoundView();
    }
  );

}

