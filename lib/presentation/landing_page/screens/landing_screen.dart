import 'package:flutter/material.dart';
import 'package:music_app_admin/presentation/playlist_page/screens/playlist_page.dart';
import 'package:music_app_admin/presentation/users/screens/users_page.dart';
import 'package:music_app_admin/presentation/landing_page/widgets/side_drawer_widget.dart';
import 'package:music_app_admin/presentation/users/widgets/add_user_widget.dart';
import 'package:music_app_admin/provider/landing_page_provider.dart';
import 'package:music_app_admin/utils/app_pallate.dart';
import 'package:music_app_admin/utils/decoration_utils.dart';
import 'package:provider/provider.dart';

import '../../../utils/screen_utils.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallate.scaffoldBackroundColor,
      appBar: AppBar(
        surfaceTintColor: AppPallate.whiteColor,
        //foregroundColor: AppPallate.whiteColor,
        backgroundColor: Colors.white,
        shadowColor: AppPallate.scaffoldBackroundColor.withOpacity(0.5),

        title: const Text("Admin"),
        elevation: 2,
        // shadowColor: AppPallate.scaffoldBackroundColor,
      ),
      drawer:
          ScreenUtils.isMobileView(context) || ScreenUtils.isTabletView(context)
              ? const Drawer(
                  shape: RoundedRectangleBorder(),
                  child: SideDrawerWidget(),
                )
              : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!(ScreenUtils.isMobileView(context) ||
                  ScreenUtils.isTabletView(context)) &&
              context.watch<LandingPageProvider>().isExpanded)
            Flexible(
              flex: 1,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  boxShadow: DecorationUtils.boxShadow,
                  color: AppPallate.whiteColor,
                ),
                child: const SideDrawerWidget(),
              ),
            ),
          Flexible(
            flex: 4,
            child:
                Padding(padding: const EdgeInsets.all(28.0), child: _getBody()),
          )
        ],
      ),
    );
  }

  Widget _getBody() {
    switch (context.watch<LandingPageProvider>().getSelectedTitleIndex) {
      case 0:
    
        return const UsersPage();

        case 1:
        return const Playlistpage();

      default:
        return Container(
          decoration: BoxDecoration(
            boxShadow: DecorationUtils.boxShadow,
            color: AppPallate.whiteColor,
          ),
        );
    }
  }
}