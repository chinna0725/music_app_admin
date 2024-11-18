import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:music_app_admin/app_secrets.dart';
import 'package:music_app_admin/models/playlist_model.dart';
import 'package:http/http.dart' as http;
import 'package:music_app_admin/utils/common_methods.dart';

class PlaylistPageProvider extends ChangeNotifier {
  List<PlaylistModel> playlistList = [];
  List<PlaylistModel> selectedList = [];
  int selectedPage = 1;
  int totalPages = 1;
  bool addUserSelected = false;
  bool mainLoading = false;
  bool loading = false;

  PlaylistModel selectedModel = PlaylistModel(name: "", imageUrl: "", id: "");
  bool isNew = true;
  get getIsNew => isNew;

  set setIsNew(bool isNew) {
    this.isNew = isNew;
    notifyListeners();
  }

  setSetectedModel(PlaylistModel model) {
    selectedModel = model;
    notifyListeners();
  }

  set setSelectedList(List<PlaylistModel> model) {
    selectedList.addAll(model);
    notifyListeners();
  }

  bool get getAddUserSelected => addUserSelected;

  set setAddUserSelected(bool addUserSelected) {
    this.addUserSelected = addUserSelected;
    notifyListeners();
  }

  void getselectedList(int pageNumber) {
    selectedList.clear();
    int start = (pageNumber * 30) - 30;
    int end = (pageNumber * 30) - 1;

    if (end < playlistList.length) {
      for (var i = start; i < end; i++) {
        selectedList.add(playlistList.elementAt(i));
      }
    } else {
      for (var i = start; i < playlistList.length; i++) {
        selectedList.add(playlistList.elementAt(i));
      }
    }

    selectedPage = pageNumber;
    notifyListeners();
  }

  Future<void> getPlayList() async {
    mainLoading = true;

    try {
      var url = Uri.parse(AppSecrets.getAllPlaylist);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == "success") {
          playlistList.clear();

          List<dynamic> data = jsonResponse['data'] as List<dynamic>;

          List<PlaylistModel> model = [];
          for (var element in data) {
            model.add(PlaylistModel.fromJson(element as Map<String, dynamic>));
          }
          playlistList.addAll(model);
          totalPages = 0;
          totalPages = (playlistList.length / 30).ceil();
          getselectedList(1);
          mainLoading = false;
          notifyListeners();
        } else {
          mainLoading = false;
          notifyListeners();

          // throw "error: ${jsonResponse['message']}";
        }
      } else {
        mainLoading = false;
        notifyListeners();

        // throw "error: ${response.statusCode}";
      }
    } catch (e) {
      mainLoading = false;
      notifyListeners();

      //throw "error: ${e.toString()}";
    }
  }

  Future<void> addPlaylist(String name, Uint8List uint8list) async {
    loading = true;
    notifyListeners();
    final base = base64Encode(uint8list);

    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var body = json.encode({
        'name': name,
        'imageData': base,
      });

      var url = Uri.parse(AppSecrets.addPlaylist);
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == "success") {
          loading = false;
          addUserSelected = false;
          notifyListeners();
          getPlayList();
        } else {
          loading = false;
          notifyListeners();
          //  throw "error: ${jsonResponse['message']}";
        }
      } else {
        loading = false;
        notifyListeners();
        // throw "error: ${response.statusCode}";
      }
    } catch (e) {
      loading = false;
      notifyListeners();
      // throw "error: ${e.toString()}";
    }
  }

  Future<void> updatePlaylist(PlaylistModel model, Uint8List uint8list) async {
    //final base = base64Encode(uint8list);

    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var body = json.encode({
        "id": model.id,
        "name": model.name,
        if (uint8list.isNotEmpty)
          "imageData":
              base64Encode(uint8list) // Optional, only if updating the image
      });

      var url = Uri.parse(AppSecrets.updatePlaylist);
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == "success") {
          loading = false;
          addUserSelected = false;
          notifyListeners();
          getPlayList();
        } else {
          loading = false;
          notifyListeners();
          // throw "error: ${jsonResponse['message']}";
        }
      } else {
        loading = false;
        notifyListeners();
        //  throw "error: ${response.statusCode}";
      }
    } catch (e) {
      loading = false;
      notifyListeners();
      //throw "error: ${e.toString()}";
    }
  }

  Future<void> deletePlaylist(String id, BuildContext context) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var body = json.encode({
        "id": id,
      });

      var url = Uri.parse(AppSecrets.deletePlaylist);
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == "success") {
          addUserSelected = false;
          getPlayList();
          //notifyListeners();
        } else {
          mainLoading = false;

          notifyListeners();

          CommonMethods.showErrorAlertDialog(
            context,
            jsonResponse['message'].toString(),
          );
          // throw "error: ${jsonResponse['message']}";
        }
      } else {
        mainLoading = false;

        notifyListeners();
        CommonMethods.showErrorAlertDialog(
          context,
          response.statusCode.toString(),
        );
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
