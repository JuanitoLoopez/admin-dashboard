import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  
  const NavbarAvatar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: 30,
        height: 30,
        child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOSIZ6hZseAPKb42yOVWSqt00bWSi8yusbMQ&usqp=CAU'),
      ),
    );
  }
}