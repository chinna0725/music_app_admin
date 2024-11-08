import 'package:flutter/material.dart';
import 'package:music_app_admin/presentation/landing_page/widgets/hover_builder.dart';
import 'package:music_app_admin/provider/landing_page_provider.dart';
import 'package:music_app_admin/utils/app_pallate.dart';
import 'package:provider/provider.dart';

class SideDrawerWidget extends StatelessWidget {
  const SideDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppPallate.whiteColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
              child: ListTile(
                selected: context
                        .watch<LandingPageProvider>()
                        .getSelectedTitleIndex ==
                    0,
                selectedTileColor: Colors.blue.shade50.withOpacity(0.5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                hoverColor: Colors.blue.shade50.withOpacity(0.5),
                splashColor: Colors.transparent,
                visualDensity:
                    const VisualDensity(vertical: -4, horizontal: -4),
                onTap: () {
                  context.read<LandingPageProvider>().setSelectedTitleIndex = 0;
                },
                leading: HoverBuilder(
                  builder: (isHovered) {
                    return Icon(
                      Icons.supervised_user_circle,
                      color: isHovered ||
                              context
                                      .watch<LandingPageProvider>()
                                      .getSelectedTitleIndex ==
                                  0
                          ? Colors.blue
                          : const Color.fromARGB(255, 6, 50, 87),
                      size: 20,
                    );
                  },
                ),
                title: HoverBuilder(
                  builder: (isHovered) {
                    return Text(
                      "User Management",
                      style: TextStyle(
                        color: isHovered ||
                                context
                                        .watch<LandingPageProvider>()
                                        .getSelectedTitleIndex ==
                                    0
                            ? Colors.blue
                            : const Color.fromARGB(255, 6, 50, 87),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    );
                  },
                ),
                dense: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
              child: ListTile(
                selected: context
                        .watch<LandingPageProvider>()
                        .getSelectedTitleIndex ==
                    1,
                selectedTileColor: Colors.blue.shade50.withOpacity(0.5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                hoverColor: Colors.blue.shade50.withOpacity(0.5),
                splashColor: Colors.transparent,
                visualDensity:
                    const VisualDensity(vertical: -4, horizontal: -4),
                onTap: () {
                  context.read<LandingPageProvider>().setSelectedTitleIndex = 1;
                },
                leading: HoverBuilder(
                  builder: (isHovered) {
                    return Icon(
                      Icons.queue_music_outlined,
                      color: isHovered ||
                              context
                                      .watch<LandingPageProvider>()
                                      .getSelectedTitleIndex ==
                                  1
                          ? Colors.blue
                          : const Color.fromARGB(255, 6, 50, 87),
                      size: 20,
                    );
                  },
                ),
                title: HoverBuilder(
                  builder: (isHovered) {
                    return Text(
                      "PLaylist",
                      style: TextStyle(
                        color: isHovered ||
                                context
                                        .watch<LandingPageProvider>()
                                        .getSelectedTitleIndex ==
                                    1
                            ? Colors.blue
                            : const Color.fromARGB(255, 6, 50, 87),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    );
                  },
                ),
                dense: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
              child: ListTile(
                selected: context
                        .watch<LandingPageProvider>()
                        .getSelectedTitleIndex ==
                    2,
                selectedTileColor: Colors.blue.shade50.withOpacity(0.5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                hoverColor: Colors.blue.shade50.withOpacity(0.5),
                splashColor: Colors.transparent,
                visualDensity:
                    const VisualDensity(vertical: -4, horizontal: -4),
                onTap: () {
                  context.read<LandingPageProvider>().setSelectedTitleIndex = 2;
                },
                leading: HoverBuilder(
                  builder: (isHovered) {
                    return Icon(
                      Icons.music_note_outlined,
                      color: isHovered ||
                              context
                                      .watch<LandingPageProvider>()
                                      .getSelectedTitleIndex ==
                                  2
                          ? Colors.blue
                          : const Color.fromARGB(255, 6, 50, 87),
                      size: 20,
                    );
                  },
                ),
                title: HoverBuilder(
                  builder: (isHovered) {
                    return Text(
                      "Songs",
                      style: TextStyle(
                        color: isHovered ||
                                context
                                        .watch<LandingPageProvider>()
                                        .getSelectedTitleIndex ==
                                    2
                            ? Colors.blue
                            : const Color.fromARGB(255, 6, 50, 87),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    );
                  },
                ),
                dense: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
