import 'package:flutter/material.dart';
import 'package:login_dashboard/providers/sidemenu_provider.dart';

import 'package:login_dashboard/ui/shared/widgets/search_text.dart';
import 'package:login_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:login_dashboard/ui/shared/widgets/notifications_indicator.dart';


class Navbar extends StatelessWidget {
  
  const Navbar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [

          if(size.width < 700) 
            IconButton(
              icon: const Icon(Icons.menu_outlined),
              onPressed: () => SidemenuProvider.opneMenu(), 
            ),

          // Search
          const SizedBox(width: 5),

          if(size.width > 400)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const SearchText(),
            ),

          const Spacer(),
          const NotificationsIndicator(),

          const SizedBox(width: 10),
          const NavbarAvatar(),

          const SizedBox(width: 10),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 5),
    ]
  );
}