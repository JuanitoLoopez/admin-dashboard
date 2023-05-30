import 'package:flutter/material.dart';
import 'package:login_dashboard/providers/sidemenu_provider.dart';
import 'package:login_dashboard/ui/shared/navbar.dart';
import 'package:login_dashboard/ui/shared/sidebar.dart';

class DashboardLayout extends StatefulWidget {

  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    SidemenuProvider.menuController = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor: const Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              // Sidebar
              if(size.width >= 700)
                const Sidebar(),
              // Dashboard
              Expanded(
                child: Column(
                  children: [
                    // Appbar
                    const Navbar(),
                    // View
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: widget.child,
                      )
                    )
                  ],
                ),
              ),
            ],
          ),
              
          if(size.width < 700)
            AnimatedBuilder(
              animation: SidemenuProvider.menuController,
              builder: (BuildContext context, _) => Stack(
                children: [

                  if(SidemenuProvider.isOpen)
                    Opacity(
                      opacity: SidemenuProvider.opacity.value, 
                      child: GestureDetector(
                        onTap: () => SidemenuProvider.closeMenu(),
                        child: Container(
                          width: size.width,
                          height: size.height,
                          color: Colors.black26.withOpacity(0.5),
                        ),
                      ),
                    ),

                  Transform.translate(
                    offset: Offset(SidemenuProvider.movement.value, 0),
                    child: const Sidebar()
                  ),
                ],
              ) 
            ),
        ],
      )
    );
  }
}