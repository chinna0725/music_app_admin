import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:music_app_admin/app_secrets.dart';
import 'package:music_app_admin/utils/common_methods.dart';

class LoginPageProvider extends ChangeNotifier {
  bool loading = false;
  bool pass_loading = false;

  Future<void> loginUSer(
      String name, String mobileNumber, BuildContext context) async {
    loading = true;
    notifyListeners();

    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var body = json.encode({
        'email': name,
        'password': mobileNumber,
      });

      var url = Uri.parse(AppSecrets.login);
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == "success") {
          loading = false;
          await CommonMethods.saveUser();
          context.pushReplacement("/landingScreen");
          notifyListeners();
        } else {
          loading = false;
          print("--------1--${response.toString()}------${response.statusCode}");
          CommonMethods.showErrorAlertDialog(
            context,
            jsonResponse['message'].toString(),
          );

          notifyListeners();
        }
      } else {
        loading = false;
print("--------2--${response.toString()}------${response.statusCode}");
        CommonMethods.showErrorAlertDialog(
          context,
          response.statusCode.toString(),
        );
        notifyListeners();
      }
    } catch (e) {
      loading = false;
      notifyListeners();
      print("--------2--${e.toString()}------");
      CommonMethods.showErrorAlertDialog(
        context,
        e.toString(),
      );
    }
  }

  Future<void> sendEmail(BuildContext context) async {
    loading = true;
    notifyListeners();

    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      // var body = json.encode({
      //   'name': name,
      //   'phone': mobileNumber,
      // });

      var url = Uri.parse(AppSecrets.sendEmail);
      var response = await http.post(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['success'].toString() == "true") {
          loading = false;
          notifyListeners();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Success"),
                content: Text(jsonResponse['message'].toString()),
                actions: [
                  TextButton(
                    child: const Text("ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            },
          );
        } else {
          loading = false;
          print("---1----${jsonResponse['message']}------");
          CommonMethods.showErrorAlertDialog(
            context,
            jsonResponse['message'].toString(),
          );

          notifyListeners();
        }
      } else {
        loading = false;
        print("---1----${response.statusCode.toString()}------");
        CommonMethods.showErrorAlertDialog(
          context,
          response.statusCode.toString(),
        );
        notifyListeners();
      }
    } catch (e) {
      loading = false;
      notifyListeners();
      print("---1----${e.toString()}------");
      CommonMethods.showErrorAlertDialog(
        context,
        e.toString(),
      );
    }
  }

  Future<void> changePassword(
      String token, String password, BuildContext context) async {
    pass_loading = true;
    notifyListeners();
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var body = json.encode({
        'token': token,
        'new_password': password,
      });

      var url = Uri.parse(AppSecrets.changePassword);
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['success'] == "true") {
          pass_loading = false;
          context.push("/login");
          notifyListeners();
        } else {
          pass_loading = false;
          CommonMethods.showErrorAlertDialog(
            context,
            jsonResponse['message'].toString(),
          );

          notifyListeners();
        }
      } else {
        pass_loading = false;
        CommonMethods.showErrorAlertDialog(
          context,
          response.statusCode.toString(),
        );
        notifyListeners();
      }
    } catch (e) {
      pass_loading = false;
      notifyListeners();
      CommonMethods.showErrorAlertDialog(
        context,
        e.toString(),
      );
    }
  }
}
