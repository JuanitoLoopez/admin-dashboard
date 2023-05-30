import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:login_dashboard/router/router.dart';
import 'package:login_dashboard/providers/sidemenu_provider.dart';
import 'package:login_dashboard/services/navigation_service.dart';

import 'package:login_dashboard/ui/shared/widgets/logo.dart';
import 'package:login_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:login_dashboard/ui/shared/widgets/text_separator.dart';

class Sidebar extends StatelessWidget {
  
  const Sidebar({Key? key}) : super(key: key);

  void switchPage(String route) {
    SidemenuProvider.closeMenu();
    NavigationService.navigateTo(route);
  }
  
  @override
  Widget build(BuildContext context) {

    final sideMenuProvider = Provider.of<SidemenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),

          const SizedBox(height: 50),
          const TextSeparator(text: 'Main'),
          
          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined, 
            onPressed: () => switchPage(Flurorouter.dashboardRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
          ),

          MenuItem(text: 'Orders',     icon: Icons.shopping_cart_outlined, onPressed: () {}),
          MenuItem(text: 'Analytics',  icon: Icons.show_chart_outlined,    onPressed: () {}),
          MenuItem(text: 'Categories', icon: Icons.layers_outlined,        onPressed: () {}),
          MenuItem(text: 'Products',   icon: Icons.dashboard_outlined,     onPressed: () {}),
          MenuItem(text: 'Discount',   icon: Icons.attach_money_outlined,  onPressed: () {}),
          MenuItem(text: 'Customers',  icon: Icons.people_alt_outlined,    onPressed: () {}),

          const SizedBox(height: 25),
          const TextSeparator(text: 'UI Elements'),
          MenuItem(
            text: 'Icons',     
            icon: Icons.list_alt_outlined,        
            onPressed: () => switchPage(Flurorouter.iconsRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
          ),
          MenuItem(text: 'Marketing', icon: Icons.mark_email_read_outlined, onPressed: () {}),
          MenuItem(text: 'Campaign',  icon: Icons.note_add_outlined,        onPressed: () {}),
          MenuItem(
            text: 'Blank', 
            icon: Icons.post_add_outlined,
            onPressed: () => switchPage(Flurorouter.blankRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
          ),

          const SizedBox(height: 25),
          const TextSeparator(text: 'Account'),
          MenuItem(text: 'Log out',   icon: Icons.exit_to_app_outlined,     onPressed: () {}),

        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xff092044),
          Color(0xff092042),
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
        ),
      ],
    );
  }
}