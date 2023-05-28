import 'package:flutter/material.dart';
import 'package:login_dashboard/ui/buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; 

    return Container(
      color: Colors.black,
      height: (size.width > 980) ? size.height * 0.1 : null,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: const [
          LinkText( text: 'About'),
          LinkText( text: 'Help Center'),
          LinkText( text: 'Terms of Service'),
          LinkText( text: 'Privacy Policy'),
          LinkText( text: 'Cookie Policy'),
          LinkText( text: 'Ads Info'),
          LinkText( text: 'Blog'),
          LinkText( text: 'Status'),
          LinkText( text: 'Carrers'),
          LinkText( text: 'Brand Resources'),
          LinkText( text: 'Advertising'),
          LinkText( text: 'Marketing'),
        ],
      ),
    );
  }
}