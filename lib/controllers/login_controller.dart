import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_manufacturing_platform/models/login_model/login_model.dart';
import 'package:smart_manufacturing_platform/models/logout_model/logout_model.dart';
import 'package:smart_manufacturing_platform/services/api_service.dart';
import 'package:smart_manufacturing_platform/views/dashboard/dashboard_page.dart';
import 'package:smart_manufacturing_platform/views/login/login_screen.dart';

class LoginController extends ChangeNotifier {
  LoginModel login = LoginModel();
  LogoutModel logout = LogoutModel();
  bool isLoading = false;
  String? accessToken = '';

  /// Login to the app if [username and password] correct.
  Future<void> appLogin(context, String username, String password) async {
    var params = {
      "username": username,
      "password": password,
    };
    isLoading = true;
    try {
      /// Returns the response on success.
      var reponse = await RestClient.init().login(json.encode(params));
      login = reponse;
      debugPrint(login.message);
      if (login.status == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
      }
      accessToken = login.data!.accessToken;
      // Obtain shared preferences.
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('accesstoken', login.data!.accessToken!);

      debugPrint("login" + login.data!.accessToken! + '\n');
      notifyListeners();
    } on DioError catch (e) {
      /// Prints error message if input is not valid or not entered.
      debugPrint(e.response!.data["message"] as String);
      notifyListeners();
    } catch (e, stackTrace) {
      isLoading = false;
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
      notifyListeners();
    }
  }

  Future<void> appLogout(context) async {
    var params = {
      "accessToken": login.data!.accessToken,
      "refreshToken": login.data!.refreshToken,
    };
    debugPrint("logout" + login.data!.accessToken! + '\n');
    try {
      /// Returns the response on success.
      var reponse = await RestClient.initWithToken(login.data!.accessToken!)
          .logout(json.encode(params));
      logout = reponse;
      debugPrint(logout.message);
      if (logout.status == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
      notifyListeners();
    } on DioError catch (e) {
      /// Prints error message if input is not valid or not entered.
      debugPrint(e.message);
      notifyListeners();
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
      notifyListeners();
    }
  }
}
