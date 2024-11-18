import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:music_app_admin/models/playlist_model.dart';
import 'package:music_app_admin/provider/playlist_page_provider.dart';
import 'package:music_app_admin/utils/common_methods.dart';
import 'package:music_app_admin/utils/decoration_utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import '../../../utils/app_pallate.dart';

class AddPlaylistWidget extends StatefulWidget {
  const AddPlaylistWidget({super.key});

  @override
  State<AddPlaylistWidget> createState() => _AddPlaylistWidgetState();
}

class _AddPlaylistWidgetState extends State<AddPlaylistWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  Uint8List? pickedFile;

  @override
  void initState() {
    _imageController.text =
        context.read<PlaylistPageProvider>().selectedModel.imageUrl == ""
            ? "No File Choosen"
            : context.read<PlaylistPageProvider>().selectedModel.imageUrl;
    _nameController.text =
        context.read<PlaylistPageProvider>().selectedModel.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppPallate.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: DecorationUtils.boxShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                context.read<PlaylistPageProvider>().setSetectedModel(
                    PlaylistModel(id: "", name: "", imageUrl: ""));
                context.read<PlaylistPageProvider>().setAddUserSelected = false;
              },
              icon: const Icon(Icons.arrow_back, color: AppPallate.darkBlue),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.watch<PlaylistPageProvider>().isNew
                      ? const Text(
                          "Add Playlist",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppPallate.darkBlue),
                        )
                      : const Text(
                          "Edit Playlist",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppPallate.darkBlue),
                        ),
                  const SizedBox(
                    height: 30,
                  ),

                  ///  name section------------------------------------------
                  const Text(
                    "Name",
                    style: TextStyle(fontSize: 14, color: AppPallate.darkBlue),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: customTextField(_nameController),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /// pick image part------------------------------------------
                  const Text(
                    "Select Image",
                    style: TextStyle(fontSize: 14, color: AppPallate.darkBlue),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        readOnly: true,
                        onTap: () {
                          _getImage();
                        },
                        style: const TextStyle(fontSize: 12),
                        controller: _imageController,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIconColor: AppPallate.scaffoldBackroundColor,
                          prefixIcon: Container(
                            margin: const EdgeInsets.only(
                                top: 1, left: 1, bottom: 1, right: 10),
                            height: 40,
                            width: 160,
                            decoration: const BoxDecoration(
                              color: AppPallate.scaffoldBackroundColor,
                              border: Border(
                                  right: BorderSide(color: Colors.black12)),
                              // border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)),
                            ),
                            child: const Center(
                              child: Text(
                                "Choose file",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black12,
                              width: 1,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  pickedFile != null
                      ? Container(
                          margin: const EdgeInsets.only(left: 10, top: 20),
                          height: 200,
                          width: 200,
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                          ),
                          child: Image.memory(pickedFile!, fit: BoxFit.contain),
                        )
                      : _imageController.text.toString() != "No File Choosen"
                          ? Container(
                              margin: const EdgeInsets.only(left: 10, top: 20),
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          _imageController.text.toString()))),
                            )
                          : Container(
                              margin: const EdgeInsets.only(left: 10, top: 20),
                              height: 200,
                              width: 200,
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                              ),
                            ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: const WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)))),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue.shade500),
                          ),
                          onPressed: () {
                            if (_nameController.text.isNotEmpty &&
                                _imageController.text.isNotEmpty &&
                                _imageController.text != "No File Choosen") {
                              if (context.read<PlaylistPageProvider>().isNew) {
                                try {
                                  context
                                      .read<PlaylistPageProvider>()
                                      .addPlaylist(
                                          _nameController.text.toString(),
                                          pickedFile!);
                                } catch (e) {
                                  CommonMethods.showErrorAlertDialog(
                                      context, e.toString());
                                }
                              } else {
                                if (_nameController.text.isNotEmpty &&
                                    _imageController.text.isNotEmpty) {
                                  PlaylistModel model = PlaylistModel(
                                      id: context
                                          .read<PlaylistPageProvider>()
                                          .selectedModel
                                          .id,
                                      name: _nameController.text,
                                      imageUrl: "");

                                  if (pickedFile != null) {
                                    context
                                        .read<PlaylistPageProvider>()
                                        .updatePlaylist(model, pickedFile!);
                                  } else {
                                    context
                                        .read<PlaylistPageProvider>()
                                        .updatePlaylist(model, Uint8List(0));
                                  }
                                }

                                print("--save pressed----");
                              }
                            } else {
                              CommonMethods.showErrorAlertDialog(
                                  context, "Enter all fields!");
                            }
                          },
                          child: context.watch<PlaylistPageProvider>().isNew
                              ? (context.watch<PlaylistPageProvider>().loading
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : const Text(
                                      "Add",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppPallate.whiteColor),
                                    ))
                              : const Text(
                                  "Save",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppPallate.whiteColor),
                                ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: const ButtonStyle(
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 20)),
                            //  overlayColor: WidgetStatePropertyAll(Colors.blue),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)))),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.black38),
                          ),
                          onPressed: () {
                            setState(() {
                              _nameController.text = "";
                              _imageController.text = "No File Choosen";
                              pickedFile = null;
                            });
                          },
                          child: const Text(
                            "Reset",
                            style: TextStyle(
                                fontSize: 14, color: AppPallate.whiteColor),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
      ],
    );

    if (result != null) {
      // Get the directory to save the file
      setState(() {
        pickedFile = result.files.first.bytes;
        _imageController.text = result.files.first.name;
      });
    }
  }

  Widget customTextField(TextEditingController controller) {
    return SizedBox(
        height: 40,
        child: TextField(
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black12,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppPallate.whiteColor),
            ),
          ),
        ));
  }
}
