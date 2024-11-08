import 'package:flutter/material.dart';
import 'package:music_app_admin/models/user_model.dart';
import 'package:music_app_admin/presentation/users/widgets/add_user_widget.dart';
import 'package:music_app_admin/provider/users_page_provider.dart';

import 'package:music_app_admin/utils/app_pallate.dart';
import 'package:music_app_admin/utils/decoration_utils.dart';
import 'package:music_app_admin/utils/screen_utils.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  
  
  
  
  TextEditingController searchContrller = TextEditingController();
    bool onSearch = false;
  @override
  void initState() {
    context.read<UsersPageProvider>().getUsersLIst();
    //context.read<UsersPageProvider>().addUserSelected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return context.read<UsersPageProvider>().getAddUserSelected
        ? const AddUserWidget()
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Manage Users",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: AppPallate.darkBlue),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                          overlayColor: WidgetStatePropertyAll(Colors.blue),
                          backgroundColor:
                              WidgetStatePropertyAll(AppPallate.whiteColor),
                          side: WidgetStatePropertyAll(
                            BorderSide(
                              color: Colors.blue,
                            ),
                          )),
                      onPressed: () {
                        context.read<UsersPageProvider>().setAddUserSelected =
                            true;
                      },
                      child: const Text(
                        "Add User",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),

                // GridView.count(
                //   physics: const NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   crossAxisCount: ScreenUtils.isMobileView(context)
                //       ? 1
                //       : ScreenUtils.isTabletView(context)
                //           ? 2
                //           : 2,
                //   crossAxisSpacing: size.width * 0.020,
                //   mainAxisSpacing: size.width * 0.020,
                //   childAspectRatio: ScreenUtils.isMobileView(context)
                //       ? 3.1
                //       : ScreenUtils.isTabletView(context)
                //           ? 2.5
                //           : 3.5,
                //   children: [
                //     Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: getGridWidget("Playlists", Icons.album_outlined, 25,
                //             const Color.fromARGB(255, 65, 55, 211), context)),
                //     Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: getGridWidget("Songs", Icons.album_outlined, 25,
                //             const Color.fromARGB(255, 65, 55, 211), context)),
                //   ],
                // ),

                const SizedBox(
                  height: 20,
                ),

                Container(
                  height: 50,
                  width: ScreenUtils.isMobileView(context) ||
                          ScreenUtils.isTabletView(context)
                      ? size.width
                      : size.width * 0.6,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: AppPallate.whiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                Container(
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
                      const Text(
                        "Users",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppPallate.darkBlue),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer<UsersPageProvider>(
                        builder: (context, provider, child) {
                          return provider.selectedList.isEmpty
                              ? SizedBox(
                                  height: 100,
                                  width: size.width,
                                  child: const Center(
                                    child: Text(
                                      "No Users",
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  ),
                                )
                              : ScreenUtils.isMobileView(context)
                                  ? FittedBox(
                                      child: getDatatableWidget(provider, size))
                                  : getDatatableWidget(provider, size);
                        },
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<UsersPageProvider>(
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

  Widget getDatatableWidget(UsersPageProvider provider, Size size) {
    return SizedBox(
      width: size.width * 0.95,
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
                "Name",
                style: TextStyle(
                    fontWeight: FontWeight.w800, color: AppPallate.darkBlue),
              ),
            ),
            DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
              label: Text(
                "Mobile",
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
              return gettableRow(e);
            },
          ).toList()),
    );
  }







  _getSearchList(String value){



   
     if (value.isNotEmpty && value != "") {

      setState(() {
      onSearch = true;
});

                          print("in");
                          context
                              .read<UsersPageProvider>()
                              .selectedList
                              .clear();
                          List<UserModel> ul = [];
                          context.read<UsersPageProvider>().userList.forEach(
                            (e) {
                              if (e.name.contains(value) ||
                                  e.mobileNumber.contains(value)) {
                                ul.add(e);
                              }
                            },
                          );

                          context.read<UsersPageProvider>().setSelectedList =
                              ul;
                        } else {
                       setState(() {
      onSearch = false;
});
                          print("out");
                          context.read<UsersPageProvider>().getselectedList(
                              context.read<UsersPageProvider>().selectedPage);
                        }
  }

  List<Widget> getPageNumberWidget(int value) {
    List<Widget> widgets = [];

if (!onSearch) {
   for (int i = 1; i <= value; i++) {
      widgets.add(InkWell(
        onTap: () {
          context.read<UsersPageProvider>().selectedPage = i;

          context.read<UsersPageProvider>().getselectedList(i);
        },
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: AppPallate.scaffoldBackroundColor),
              color: context.watch<UsersPageProvider>().selectedPage == i
                  ? Colors.blue
                  : Colors.white),
          child: Center(
            child: Text(
              i.toString(),
              style: TextStyle(
                  color: context.watch<UsersPageProvider>().selectedPage == i
                      ? Colors.white
                      : Colors.blue),
            ),
          ),
        ),
      ));
   
    }

}else{
      widgets.add(Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: AppPallate.scaffoldBackroundColor),
            color: context.watch<UsersPageProvider>().selectedPage == 1
                ? Colors.blue
                : Colors.white),
        child: Center(
          child: Text(
            "1",
            style: TextStyle(
                color: context.watch<UsersPageProvider>().selectedPage == 1
                    ? Colors.white
                    : Colors.blue),
          ),
        ),
      ));
   

}
   
    return widgets;
  }

  DataRow gettableRow(UserModel model) {
    return DataRow(cells: [
      // DataCell(
      //   Center(
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: CircleAvatar(
      //         backgroundImage: NetworkImage(model.imageUrl),
      //         radius: 20,
      //       ),
      //     ),
      //   ),
      // ),
      DataCell(
        Center(
          child: Text(
            model.name,
            style: const TextStyle(color: AppPallate.darkBlue),
          ),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            model.mobileNumber,
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
                onPressed: () {},
                icon: const Icon(Icons.edit_document)),
            IconButton(
                color: Colors.blue,
                onPressed: () {},
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
