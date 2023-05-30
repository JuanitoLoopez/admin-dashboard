
import 'package:flutter/material.dart';

class SidemenuProvider extends ChangeNotifier {

  static late AnimationController menuController;
  static bool isOpen = false;

  String _currentPage = '';

  String get currentPage {
    return _currentPage;
  }

  void setCurrentPageUrl(String routeName) {
    _currentPage = routeName;
    Future.delayed(const Duration(milliseconds: 10), () => notifyListeners()); 
  }

  static Animation<double> movement = Tween<double>(begin: -200, end: 0)
    .animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static Animation<double> opacity = Tween<double>(begin: -0, end: 1)
    .animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static void opneMenu() {
    isOpen = true;
    menuController.forward();
  }

  static void closeMenu() {
    isOpen = false;
    menuController.reverse();
  }

  static void toggleMenu() => isOpen ? closeMenu() : opneMenu();

}