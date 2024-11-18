import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:music_app_admin/app_secrets.dart';
import 'package:music_app_admin/models/playlist_model.dart';
import 'package:music_app_admin/models/song_model.dart';
import 'package:music_app_admin/utils/common_methods.dart';

class SongslistPageProvider extends ChangeNotifier {
  List<SongModel> songlistList = [];

  List<SongModel> selectedList = [];
  int selectedPage = 1;
  int totalPages = 1;
  bool addUserSelected = false;
  bool isNew = true;
  get getIsNew => isNew;
  bool loading = false;
  bool mainLoading = true;
  bool get getMainLoading => mainLoading;

  set setMainLoading(bool mainLoading) {
    this.mainLoading = mainLoading;
    notifyListeners();
  }

  PlaylistModel selectedPlaylistName =
      PlaylistModel(id: "", name: "", imageUrl: "");

  set setSelectedPlaylistName(selectedPlaylistName) {
    this.selectedPlaylistName = selectedPlaylistName;
    notifyListeners();
  }

  set setIsNew(bool isNew) {
    this.isNew = isNew;
    notifyListeners();
  }

  SongModel selectedModel =
      SongModel(name: "", imageUrl: "", songUrl: '', id: '');

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
    int start = (pageNumber * 30) - 30;
    int end = (pageNumber * 30) - 1;
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
  Future<void> getSongList(String playListName) async {
    print("---------name -------$playListName");

    mainLoading = true;
    try {
      var body = json.encode({"playlistName": playListName});
      var url = Uri.parse(AppSecrets.getAllSongs);
      var response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == "success") {
          songlistList.clear();

          List<dynamic> data = jsonResponse['songs'] as List<dynamic>;

          List<SongModel> model = [];
          for (var element in data) {
            model.add(SongModel.fromJson(element as Map<String, dynamic>));
          }
          songlistList.addAll(model);
          totalPages = 0;
          totalPages = (songlistList.length / 30).ceil();
          getselectedList(1);
          mainLoading = false;
          notifyListeners();
        } else {
          mainLoading = false;
          songlistList = [];
          selectedList = [];
          notifyListeners();

          //   throw "error: ${jsonResponse['message']}";
        }
      } else {
        songlistList = [];
        selectedList = [];
        mainLoading = false;
        notifyListeners();

        // throw "error: ${response.statusCode}";
      }
    } catch (e) {
      songlistList = [];
      selectedList = [];
      mainLoading = false;
      notifyListeners();

      // throw "error: ${e.toString()}";
    }
  }

  Future<void> addSong({
    required String songName,
    required String playlistName,
    required Uint8List image,
    required Uint8List song,
  }) async {
    loading = true;
    notifyListeners();
    final image_64 = base64Encode(image);
    final song_64 = base64Encode(song);

    try {
      var body = json.encode({
        'name': songName,
        'imageData': image_64,
        'songData': song_64,
        "playlistName": playlistName
      });

      var url = Uri.parse(AppSecrets.addSong);
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == "success") {
          loading = false;
          addUserSelected = false;
          notifyListeners();
          getSongList(playlistName);
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
      //  throw "error: ${e.toString()}";
    }
  }

  Future<void> updateSong(SongModel model, String playlistName, Uint8List song,
      Uint8List image) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var body = json.encode({
        "id": model.id,
        "name": model.name,
        "playlistName": playlistName,
        if (image.isNotEmpty) "imageData": base64Encode(image),
        if (song.isNotEmpty) "songData": base64Encode(song)
      });

      var url = Uri.parse(AppSecrets.updateSong);
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == "success") {
          loading = false;
          addUserSelected = false;
          notifyListeners();
          getSongList(playlistName);
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

  Future<void> deleteSong(
      String id, String playlistName, BuildContext context) async {
    print("------$playlistName");
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var body = json.encode({
        "id": id,
      });

      var url = Uri.parse(AppSecrets.deleteSong);
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == "success") {
          addUserSelected = false;
          getSongList(playlistName);
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
