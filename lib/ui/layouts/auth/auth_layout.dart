import 'package:flutter/material.dart';

import 'package:login_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:login_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:login_dashboard/ui/layouts/auth/widgets/twitter_background.dart';

class AuthLayout extends StatelessWidget {

  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            
            size.width >= 980
              ? _DesktopBody(child: child) 
              : _MobileBody(child: child),
      
            const LinksBar()
          ],
        ),
      )
    );
  }
}

class _MobileBody extends StatelessWidget {
  
  final Widget child;

  const _MobileBody({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          const SizedBox(
            width: double.infinity,
            height: 400,
            child: TwitterBackground(),
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  
  final Widget child;
  
  const _DesktopBody({required this.child});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; 

    return SizedBox(
      width: size.width,
      height: size.height * 0.95,
      child: Row(
        children: [
          // Twitter background
          const Expanded(
            child: TwitterBackground()
          ),

          // View container
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const CustomTitle(),
                const SizedBox(height: 20),
                Expanded(child: child),
              ],
            ),
          )
        ],
      ),
    );
  }
}