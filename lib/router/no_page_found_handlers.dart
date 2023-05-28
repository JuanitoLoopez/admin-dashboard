import 'package:fluro/fluro.dart';

import 'package:login_dashboard/ui/views/no_page_found_view.dart';

class NoPageFoundHandlers {

  static final noPageFound = Handler(
    handlerFunc: (context, params) {
      return const NoPageFoundView();
    }
  );

}

