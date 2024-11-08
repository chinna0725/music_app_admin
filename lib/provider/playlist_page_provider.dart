import 'package:flutter/material.dart';
import 'package:music_app_admin/models/playlist_model.dart';

class PlaylistPageProvider extends ChangeNotifier {
  List<PlaylistModel> playlistList = [];

  List<PlaylistModel> selectedList = [];
   int selectedPage = 1;
  int totalPages = 1;
   bool addUserSelected = false;


  PlaylistModel selectedModel =PlaylistModel(name: "",imageUrl: "");


setSetectedModel(PlaylistModel model){
  selectedModel= model;
  notifyListeners();
}

  set setSelectedList(List<PlaylistModel> model) {
    this.selectedList.addAll(model);
    notifyListeners();
  }


 
  bool get getAddUserSelected => this.addUserSelected;

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
    print("--------pages----${playlistList.length}");

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

  /// ///////
  Future<void> getUsersLIst() async {
    await Future.delayed(const Duration(seconds: 1), () {
      playlistList.clear();
      playlistList.addAll([
       
      
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
        PlaylistModel(
            name: "name",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAusHk8prvj8i_jBTp_c-ViMgjSGEum7kFw&s"),
      ]);
    });
    totalPages = 0;
    totalPages = (playlistList.length / 12).ceil();
    getselectedList(1);
    notifyListeners();
  }
}
