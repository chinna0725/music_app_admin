import 'package:flutter/material.dart';
import 'package:music_app_admin/models/user_model.dart';
import 'package:music_app_admin/utils/common_methods.dart';
import 'package:provider/provider.dart';

import '../../../provider/users_page_provider.dart';
import '../../../utils/app_pallate.dart';
import '../../../utils/decoration_utils.dart';

class AddUserWidget extends StatefulWidget {
  const AddUserWidget({super.key});

  @override
  State<AddUserWidget> createState() => _AddUserWidgetState();
}

class _AddUserWidgetState extends State<AddUserWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    _nameController.text = context.read<UsersPageProvider>().selectedModel.name;
    _phoneController.text =
        context.read<UsersPageProvider>().selectedModel.mobileNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
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
              context.read<UsersPageProvider>().setSetectedModel(
                  UserModel(id: "", name: "", mobileNumber: ""));
              context.read<UsersPageProvider>().setAddUserSelected = false;
            },
            icon: const Icon(Icons.arrow_back, color: AppPallate.darkBlue),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.read<UsersPageProvider>().isNew
                    ? const Text(
                        "Add User",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppPallate.darkBlue),
                      )
                    : const Text(
                        "Edit User",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppPallate.darkBlue),
                      ),
                const SizedBox(
                  height: 30,
                ),
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
                const Text(
                  "Mobile",
                  style: TextStyle(fontSize: 14, color: AppPallate.darkBlue),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: customTextField(_phoneController),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          //  overlayColor: WidgetStatePropertyAll(Colors.blue),
                          shape: const WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)))),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blue.shade500),
                        ),
                        onPressed: () {
                          if (_nameController.text.isNotEmpty &&
                              _phoneController.text.isNotEmpty) {
                            if (context.read<UsersPageProvider>().isNew) {
                              try {
                                context.read<UsersPageProvider>().addUSer(
                                    _nameController.text.toString().trim(),
                                    _phoneController.text.toString().trim(),
                                    context);
                              } catch (e) {
                                CommonMethods.showErrorAlertDialog(
                                    context, e.toString());
                              }
                            } else {
                              if (_nameController.text.isNotEmpty &&
                                  _phoneController.text.isNotEmpty) {
                                UserModel model = UserModel(
                                  id: context
                                      .read<UsersPageProvider>()
                                      .selectedModel
                                      .id,
                                  name: _nameController.text,
                                  mobileNumber: _phoneController.text,
                                );

                                context
                                    .read<UsersPageProvider>()
                                    .updateUser(model, context);
                              }

                              print("--save pressed----");
                            }
                          } else {
                            CommonMethods.showErrorAlertDialog(
                                context, "Enter all fields!");
                          }
                        },
                        child: context.read<UsersPageProvider>().isNew
                            ? const Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 14, color: AppPallate.whiteColor),
                              )
                            : const Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 14, color: AppPallate.whiteColor),
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
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.black38),
                        ),
                        onPressed: () {},
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
    );
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
