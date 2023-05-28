import 'package:flutter/material.dart';
import 'package:login_dashboard/router/router.dart';
import 'package:login_dashboard/services/local_storage.dart';
import 'package:login_dashboard/services/navigation_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier {

  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    //TODO: Peticion HTTP
    _token = 'asdfdsaasdfkljsdlfjie.fmewfoas.dfkjewosl';
    LocalStorage.prefs.setString('token', _token!);

    //TODO: Navegar al dashboard

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    // isAuthenticated();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);
 
  }

  Future<bool> isAuthenticated() async {

    final token = LocalStorage.prefs.getString('token');

    if(token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //TODO: Ir al backend y comprobar si el JWT es valido
    await Future.delayed(const Duration(milliseconds: 1000));

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }

}