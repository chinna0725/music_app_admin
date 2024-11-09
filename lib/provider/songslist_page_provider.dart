import 'package:flutter/material.dart';
import 'package:music_app_admin/models/song_model.dart';

import '../models/playlist_model.dart';

class SongslistPageProvider extends ChangeNotifier {
  List<SongModel> songlistList = [];

  List<SongModel> selectedList = [];
  int selectedPage = 1;
  int totalPages = 1;
  bool addUserSelected = false;
  bool isNew = true;
  get getIsNew => isNew;

  set setIsNew(bool isNew) {
    this.isNew = isNew;
    notifyListeners();
  }

  SongModel selectedModel = SongModel(name: "", imageUrl: "", songUrl: '');

  setSetectedModel(SongModel model) {
    selectedModel = model;
    notifyListeners();
  }

  set setSelectedList(List<SongModel> model) {
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
    int start = (pageNumber * 12) - 12;
    int end = (pageNumber * 12) - 1;
    print("--------start----$start");

    print("--------end----$end");
    print("--------pages----$totalPages");
    print("--------pages----${songlistList.length}");

    if (end < songlistList.length) {
      for (var i = start; i < end; i++) {
        selectedList.add(songlistList.elementAt(i));
      }
    } else {
      for (var i = start; i < songlistList.length; i++) {
        selectedList.add(songlistList.elementAt(i));
      }
    }

    selectedPage = pageNumber;
    notifyListeners();
  }

  /// ///////
  Future<void> getUsersLIst() async {
    await Future.delayed(const Duration(seconds: 1), () {
      songlistList.clear();

      songlistList.addAll([
        SongModel(
            name: "name",
            songUrl: "songUrl",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        SongModel(
            name: "name",
            songUrl: "songUrl",
            imageUrl:
                "https://img.freepik.com/premium-photo/girl-listening-music-with-her-headphones_1041953-270.jpg"),
        SongModel(
            name: "name",
            songUrl: "songUrl",
            imageUrl:
                "https://img.freepik.com/premium-photo/girl-listening-music-with-her-headphones_1041953-270.jpg"),
        SongModel(
            name: "name",
            songUrl: "songUrl",
            imageUrl:
                "https://img.freepik.com/premium-photo/girl-listening-music-with-her-headphones_1041953-270.jpg"),
        SongModel(
            name: "name",
            songUrl: "songUrl",
            imageUrl:
                "https://img.freepik.com/premium-photo/girl-listening-music-with-her-headphones_1041953-270.jpg"),
        SongModel(
            name: "name",
            songUrl: "songUrl",
            imageUrl:
                "https://img.freepik.com/premium-photo/girl-listening-music-with-her-headphones_1041953-270.jpg"),
        SongModel(
            name: "name",
            songUrl: "songUrl",
            imageUrl:
                "https://img.freepik.com/premium-photo/girl-listening-music-with-her-headphones_1041953-270.jpg"),
      ]);
    });
    totalPages = 0;
    totalPages = (songlistList.length / 12).ceil();
    getselectedList(1);
    notifyListeners();
  }
}
