import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_app_admin/app_secrets.dart';
import 'package:music_app_admin/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:music_app_admin/utils/common_methods.dart';

class UsersPageProvider extends ChangeNotifier {
  List<UserModel> userList = [];

  List<UserModel> selectedList = [];
  bool mainLoading = true;
  bool get getMainLoading => mainLoading;
  String errorMsg = "";

  set setMainLoading(bool mainLoading) {
    this.mainLoading = mainLoading;
    notifyListeners();
  }

  bool loading = false;
  int totalPages = 1;
  bool addUserSelected = false;

  UserModel selectedModel = UserModel(name: "", mobileNumber: '', id: "");
  bool isNew = true;
  get getIsNew => isNew;

  set setIsNew(bool isNew) {
    this.isNew = isNew;
    notifyListeners();
  }

  setSetectedModel(UserModel model) {
    selectedModel = model;
    notifyListeners();
  }

  set setSelectedList(List<UserModel> model) {
    selectedList.addAll(model);
    notifyListeners();
  }

  bool get getAddUserSelected => addUserSelected;

  set setAddUserSelected(bool addUserSelected) {
    this.addUserSelected = addUserSelected;
    notifyListeners();
  }

  int selectedPage = 1;
  Future<void> getselectedList(int pageNumber) async {
    selectedList.clear();
    int start = (pageNumber * 30) - 30;
    int end = (pageNumber * 30) - 1;

    if (end < userList.length) {
      for (var i = start; i < end; i++) {
        selectedList.add(userList.elementAt(i));
      }
    } else {
      for (var i = start; i < userList.length; i++) {
        selectedList.add(userList.elementAt(i));
      }
    }

    selectedPage = pageNumber;
    notifyListeners();
  }

  /// ///////
  Future<void> getUsersLIst() async {
    try {
      mainLoading = true;
      errorMsg = "";

      var url = Uri.parse(AppSecrets.getAllUsers);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        userList.clear();

        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == "success") {
          List<dynamic> data = jsonResponse['data'] as List<dynamic>;
          List<UserModel> model = [];
          for (var element in data) {
            model.add(UserModel.fromJson(element as Map<String, dynamic>));
          }
          userList.addAll(model);
          totalPages = 0;
          totalPages = (userList.length / 30).ceil();
          getselectedList(1);
          mainLoading = false;
        } else {
          mainLoading = false;
          errorMsg = jsonResponse['message'].toString();
          notifyListeners();
          //  throw "error: ${jsonResponse['message']}";
        }
      } else {
        mainLoading = false;
        errorMsg = response.statusCode.toString();
        notifyListeners();
        // throw "error: ${response.statusCode}";
      }
    } catch (e) {
      mainLoading = false;
      errorMsg = e.toString();
      notifyListeners();
      // throw "error: ${e.toString()}";
    }
  }

  Future<void> addUSer(
      String name, String mobileNumber, BuildContext context) async {
    loading = true;
    notifyListeners();

    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var body = json.encode({
        'name': name,
        'phone': mobileNumber,
      });

      var url = Uri.parse(AppSecrets.addUser);
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == "success") {
          loading = false;
          addUserSelected = false;
          notifyListeners();
          getUsersLIst();
        } else {
          loading = false;
          CommonMethods.showErrorAlertDialog(
            context,
            jsonResponse['message'].toString(),
          );

          notifyListeners();

          // throw "error: ${jsonResponse['message']}";
        }
      } else {
        loading = false;

        CommonMethods.showErrorAlertDialog(
          context,
          response.statusCode.toString(),
        );
        notifyListeners();
        // throw "error: ${response.statusCode}";
      }
    } catch (e) {
      loading = false;

      notifyListeners();
      CommonMethods.showErrorAlertDialog(
        context,
        e.toString(),
      );
      // throw "error: ${e.toString()}";
    }
  }

  Future<void> updateUser(UserModel model, BuildContext context) async {
    //final base = base64Encode(uint8list);

    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var body = json.encode({
        "id": model.id,
        "name": model.name,
        "phone": model.mobileNumber // Optional, only if updating the image
      });

      var url = Uri.parse(AppSecrets.updateUser);
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == "success") {
          loading = false;
          addUserSelected = false;
          notifyListeners();
          getUsersLIst();
        } else {
          loading = false;
          CommonMethods.showErrorAlertDialog(
            context,
            jsonResponse['message'].toString(),
          );

          notifyListeners();

          // throw "error: ${jsonResponse['message']}";
        }
      } else {
        loading = false;

        CommonMethods.showErrorAlertDialog(
          context,
          response.statusCode.toString(),
        );
        notifyListeners();
        // throw "error: ${response.statusCode}";
      }
    } catch (e) {
      loading = false;

      notifyListeners();
      CommonMethods.showErrorAlertDialog(
        context,
        e.toString(),
      );
      // throw "error: ${e.toString()}";
    }
  }

  Future<void> deleteUser(String id, BuildContext context) async {
    mainLoading = true;
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var body = json.encode({
        "id": id,
      });

      var url = Uri.parse(AppSecrets.deleteUser);
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == "success") {
          mainLoading = false;
          addUserSelected = false;
          notifyListeners();
          getUsersLIst();
        } else {
          mainLoading = false;
          CommonMethods.showErrorAlertDialog(
            context,
            jsonResponse['message'].toString(),
          );

          notifyListeners();

          // throw "error: ${jsonResponse['message']}";
        }
      } else {
        mainLoading = false;

        CommonMethods.showErrorAlertDialog(
          context,
          response.statusCode.toString(),
        );
        notifyListeners();
        // throw "error: ${response.statusCode}";
      }
    } catch (e) {
      mainLoading = false;

      notifyListeners();
      CommonMethods.showErrorAlertDialog(
        context,
        e.toString(),
      );
      // throw "error: ${e.toString()}";
    }
  }
}
