import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app_admin/models/playlist_model.dart';
import 'package:music_app_admin/presentation/songs/widgets/add_song_widget.dart';
import 'package:music_app_admin/provider/playlist_page_provider.dart';
import 'package:music_app_admin/provider/songslist_page_provider.dart';
import 'package:music_app_admin/utils/animation_loader.dart';
import 'package:music_app_admin/utils/common_methods.dart';
import 'package:provider/provider.dart';
import '../../../models/song_model.dart';
import '../../../utils/app_pallate.dart';
import '../../../utils/decoration_utils.dart';
import '../../../utils/screen_utils.dart';

class SongslistPage extends StatefulWidget {
  const SongslistPage({super.key});

  @override
  State<SongslistPage> createState() => _SongslistPageState();
}

class _SongslistPageState extends State<SongslistPage> {
  TextEditingController searchContrller = TextEditingController();
  bool onSearch = false;
  // PlaylistModel? selectedModel;

  @override
  void initState() {
    if (context.read<PlaylistPageProvider>().playlistList != [] &&
        context.read<PlaylistPageProvider>().playlistList.isNotEmpty) {
      context.read<SongslistPageProvider>().getSongList(
            context.read<PlaylistPageProvider>().playlistList.first.name,
          );
    } else {
      context.read<SongslistPageProvider>().mainLoading = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return context.watch<SongslistPageProvider>().getAddUserSelected
        ? const AddSongWidget()
        : context.watch<SongslistPageProvider>().mainLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Manage Songs",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: AppPallate.darkBlue),
                        ),
                        if (context.read<PlaylistPageProvider>().playlistList !=
                                [] &&
                            context
                                .read<PlaylistPageProvider>()
                                .playlistList
                                .isNotEmpty)
                          ElevatedButton(
                            style: const ButtonStyle(
                                overlayColor:
                                    WidgetStatePropertyAll(Colors.blue),
                                backgroundColor: WidgetStatePropertyAll(
                                    AppPallate.whiteColor),
                                side: WidgetStatePropertyAll(
                                  BorderSide(
                                    color: Colors.blue,
                                  ),
                                )),
                            onPressed: () {
                              context
                                  .read<SongslistPageProvider>()
                                  .setAddUserSelected = true;
                              context.read<SongslistPageProvider>().setIsNew =
                                  true;
                            },
                            child: const Text(
                              "Add Songs",
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    if (context.read<PlaylistPageProvider>().playlistList !=
                            [] &&
                        context
                            .read<PlaylistPageProvider>()
                            .playlistList
                            .isNotEmpty)
                      Container(
                        height: 50,
                        width: ScreenUtils.isMobileView(context) ||
                                ScreenUtils.isTabletView(context)
                            ? size.width
                            : size.width * 0.6,
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: AppPallate.whiteColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          boxShadow: DecorationUtils.boxShadow,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            controller: searchContrller,
                            onSubmitted: (value) => _getSearchList(value),
                            onChanged: (value) => _getSearchList(value),
                            decoration: const InputDecoration(
                              hintText: "Search",
                              contentPadding: EdgeInsets.all(12),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),

                    const SizedBox(
                      height: 20,
                    ),

                    //  userlist container

                    context.watch<PlaylistPageProvider>().playlistList != [] &&
                            context
                                .watch<PlaylistPageProvider>()
                                .playlistList
                                .isNotEmpty
                        ? Container(
                            width: size.width,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: AppPallate.whiteColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: DecorationUtils.boxShadow,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                if (context
                                    .watch<PlaylistPageProvider>()
                                    .playlistList
                                    .isNotEmpty)
                                  Row(
                                    children: [
                                      const Text(
                                        "Select Playlist",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black38),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Theme(
                                        data: Theme.of(context).copyWith(
                                            hoverColor: Colors.transparent,
                                            canvasColor: AppPallate.whiteColor),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0),
                                          child: FittedBox(
                                            child: DropdownButtonFormField<
                                                PlaylistModel>(
                                              value: context
                                                          .watch<
                                                              SongslistPageProvider>()
                                                          .selectedPlaylistName
                                                          .name !=
                                                      ""
                                                  ? context
                                                      .watch<
                                                          SongslistPageProvider>()
                                                      .selectedPlaylistName
                                                  : context
                                                      .read<
                                                          PlaylistPageProvider>()
                                                      .playlistList
                                                      .first,
                                              isExpanded: true,
                                              decoration: InputDecoration(
                                                  fillColor: AppPallate
                                                      .scaffoldBackroundColor,
                                                  filled: true,
                                                  focusColor: Colors
                                                      .amberAccent,
                                                  constraints: BoxConstraints(
                                                    maxHeight: 40,
                                                    maxWidth: ScreenUtils
                                                                .isMobileView(
                                                                    context) ||
                                                            ScreenUtils
                                                                .isTabletView(
                                                                    context)
                                                        ? size.width * 0.5
                                                        : size.width * 0.3,
                                                  ),
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black12,
                                                                  width: 0.5)),
                                                  border:
                                                      const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black12,
                                                                  width: 0.5)),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 20,
                                                          vertical: 0)),
                                              style: const TextStyle(
                                                  color: Colors.black),
                                              items: context
                                                  .watch<PlaylistPageProvider>()
                                                  .playlistList
                                                  .map((PlaylistModel value) {
                                                return DropdownMenuItem<
                                                    PlaylistModel>(
                                                  value: value,
                                                  child: Text(value.name),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                context
                                                    .read<
                                                        SongslistPageProvider>()
                                                    .setSelectedPlaylistName = value!;
                                                context
                                                    .read<
                                                        SongslistPageProvider>()
                                                    .getSongList(value.name);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Consumer<SongslistPageProvider>(
                                  builder: (context, provider, child) {
                                    return provider.selectedList.isEmpty
                                        ? const CustomAnimationLoaderWidget(
                                            text: "No Songs",
                                            animation:
                                                "assets/53207-empty-file.json",
                                          )
                                        : ScreenUtils.isMobileView(context)
                                            ? FittedBox(
                                                child: getDatatableWidget(
                                                provider,
                                                size,
                                                "context",
                                              ))
                                            : getDatatableWidget(
                                                provider, size, "context");
                                  },
                                )
                              ],
                            ),
                          )
                        : const CustomAnimationLoaderWidget(
                            text: "You should have atleast one playlist",
                            animation: "assets/53207-empty-file.json",
                          ),

                    //  SizedBox(
                    //     height: 100,
                    //     width: size.width * 8,
                    //     child: const Center(
                    //       child: Text(
                    //         "You should have atleast one playlist",
                    //         style: TextStyle(color: Colors.black45),
                    //       ),
                    //     ),
                    //   ),

                    if (context
                        .read<PlaylistPageProvider>()
                        .playlistList
                        .isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Consumer<SongslistPageProvider>(
                          builder: (context, value, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: getPageNumberWidget(value.totalPages),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              );
  }

  Widget getDatatableWidget(
      SongslistPageProvider provider, Size size, String playlistName) {
    return SizedBox(
      width: size.width * 0.8,
      child: DataTable(
          horizontalMargin: 1,
          dataRowHeight: 100,
          columns: const [
            // DataColumn(
            //   headingRowAlignment: MainAxisAlignment.center,
            //   label: Text(
            //     "Image",
            //     style: TextStyle(
            //         fontWeight: FontWeight.w800, color: AppPallate.darkBlue),
            //   ),
            // ),
            DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
              label: Text(
                "Image",
                style: TextStyle(
                    fontWeight: FontWeight.w800, color: AppPallate.darkBlue),
              ),
            ),
            DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
              label: Text(
                "Name",
                style: TextStyle(
                    fontWeight: FontWeight.w800, color: AppPallate.darkBlue),
              ),
            ),
            DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
              label: Text(
                "Action",
                style: TextStyle(
                    fontWeight: FontWeight.w800, color: AppPallate.darkBlue),
              ),
            ),
          ],
          rows: provider.selectedList.map(
            (e) {
              return gettableRow(e, playlistName);
            },
          ).toList()),
    );
  }

  _getSearchList(String value) {
    if (value.isNotEmpty && value != "") {
      setState(() {
        onSearch = true;
      });

      print("in");
      context.read<SongslistPageProvider>().selectedList.clear();
      List<SongModel> ul = [];
      context.read<SongslistPageProvider>().songlistList.forEach(
        (e) {
          if (e.name.contains(value)) {
            ul.add(e);
          }
        },
      );

      context.read<SongslistPageProvider>().setSelectedList = ul;
    } else {
      setState(() {
        onSearch = false;
      });
      print("out");
      context
          .read<SongslistPageProvider>()
          .getselectedList(context.read<SongslistPageProvider>().selectedPage);
    }
  }

  List<Widget> getPageNumberWidget(int value) {
    List<Widget> widgets = [];

    if (!onSearch) {
      for (int i = 1; i <= value; i++) {
        widgets.add(InkWell(
          onTap: () {
            context.read<SongslistPageProvider>().selectedPage = i;

            context.read<SongslistPageProvider>().getselectedList(i);
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: AppPallate.scaffoldBackroundColor),
                color: context.watch<SongslistPageProvider>().selectedPage == i
                    ? Colors.blue
                    : Colors.white),
            child: Center(
              child: Text(
                i.toString(),
                style: TextStyle(
                    color:
                        context.watch<SongslistPageProvider>().selectedPage == i
                            ? Colors.white
                            : Colors.blue),
              ),
            ),
          ),
        ));
      }
    } else {
      widgets.add(Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: AppPallate.scaffoldBackroundColor),
            color: context.watch<SongslistPageProvider>().selectedPage == 1
                ? Colors.blue
                : Colors.white),
        child: Center(
          child: Text(
            "1",
            style: TextStyle(
                color: context.watch<SongslistPageProvider>().selectedPage == 1
                    ? Colors.white
                    : Colors.blue),
          ),
        ),
      ));
    }
    return widgets;
  }

  DataRow gettableRow(SongModel model, String playlistName) {
    return DataRow(cells: [
      DataCell(
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(model.imageUrl), fit: BoxFit.fill),
              ),
            ),
          ),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            model.name,
            style: const TextStyle(color: AppPallate.darkBlue),
          ),
        ),
      ),
      DataCell(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                color: Colors.blue,
                onPressed: () {
                  context.read<SongslistPageProvider>().setSetectedModel(model);
                  context.read<SongslistPageProvider>().addUserSelected = true;
                  context.read<SongslistPageProvider>().setIsNew = false;
                },
                icon: const Icon(Icons.edit_document)),
            IconButton(
                color: Colors.red,
                onPressed: () {
                  CommonMethods.showAlertDialog(context, () {
                    context.read<SongslistPageProvider>().deleteSong(
                        model.id,
                        context
                                    .read<SongslistPageProvider>()
                                    .selectedPlaylistName
                                    .name !=
                                ""
                            ? context
                                .read<SongslistPageProvider>()
                                .selectedPlaylistName
                                .name
                            : context
                                .read<PlaylistPageProvider>()
                                .playlistList
                                .first
                                .name,
                        context);
                    context.pop();
                  });
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
      )
    ]);
  }

  Widget getGridWidget(String title, IconData icon, int count, Color color,
      BuildContext context) {
    return Container(
      padding: ScreenUtils.isMobileView(context)
          ? const EdgeInsets.all(28)
          : ScreenUtils.isTabletView(context)
              ? const EdgeInsets.all(10)
              : const EdgeInsets.all(10),

      //  const EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: AppPallate.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: DecorationUtils.boxShadow),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppPallate.darkBlue),
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: color.withOpacity(0.2),
                  child: Icon(
                    icon,
                    color: color,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  count.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppPallate.darkBlue,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      // constraints: BoxConstraints(
      //   minWidth: 100,
      //   maxHeight: 150,
      //   maxWidth: 400,
      // ),
    );
  }
}
