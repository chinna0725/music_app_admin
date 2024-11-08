import 'package:flutter/material.dart';
import 'package:music_app_admin/models/user_model.dart';

class UsersPageProvider extends ChangeNotifier {
 
 
  List<UserModel> userList = [];

  List<UserModel> selectedList = [];

  set setSelectedList(List<UserModel> model) {
    this.selectedList.addAll(model);
    notifyListeners();
  }

  int totalPages = 1;
  bool addUserSelected = false;
  bool get getAddUserSelected => this.addUserSelected;

  set setAddUserSelected(bool addUserSelected) {
    this.addUserSelected = addUserSelected;
    notifyListeners();
  }


  int selectedPage = 1;
  void getselectedList(int pageNumber) {
    selectedList.clear();
    int start = (pageNumber * 12) - 12;
    int end = (pageNumber * 12) - 1;
    print("--------start----$start");

    print("--------end----$end");
    print("--------pages----$totalPages");
    print("--------pages----${userList.length}");

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
    await Future.delayed(const Duration(seconds: 1), () {
      userList.clear();
      userList.addAll([
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        UserModel(
            name: "name",
            mobileNumber: "mobileNumber",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
      ]);
    });
    totalPages = 0;
    totalPages = (userList.length / 12).ceil();
    getselectedList(1);
    notifyListeners();
  }
}
