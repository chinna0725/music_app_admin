import 'package:flutter/material.dart';
import 'package:music_app_admin/provider/login_page_provider.dart';
import 'package:provider/provider.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  final String? token;
  const ConfirmPasswordScreen({super.key, required this.token});

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureTextPassword1 = true;
  bool _obscureTextPassword2 = true;

  @override
  Widget build(BuildContext context) {
    // final Uri uri = Uri.base;
    // final String? token = uri.queryParameters['token'];

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            decoration: BoxDecoration(
              color: Colors.white, // Background color for the form container
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Confirm Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 280,
                          child: TextFormField(
                            controller: _passwordController1,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Min. 8 character',
                              border: const UnderlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureTextPassword1
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: _togglePasswordVisibility1,
                              ),
                            ),
                            validator: _validatePassword1,
                            onEditingComplete: () {},
                            obscureText: _obscureTextPassword1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 280,
                          child: TextFormField(
                            controller: _passwordController2,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              hintText: 'Min. 8 character',
                              border: const UnderlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureTextPassword2
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: _togglePasswordVisibility2,
                              ),
                            ),
                            validator: _validatePassword2,
                            onEditingComplete: () {},
                            obscureText: _obscureTextPassword2,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      context.watch<LoginPageProvider>().pass_loading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 70.0,
                              ),
                              child: Container(
                                height: 50,
                                width: 300,

                                // margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                  // gradient: LinearGradient(
                                  //   colors: [Colors.blue, Colors.blue.shade100],
                                  // ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<LoginPageProvider>()
                                          .changePassword(
                                            widget.token ?? "",
                                            _passwordController2.text,
                                            context,
                                          );
                                    }
                                  },
                                  child: const Center(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  void _togglePasswordVisibility1() {
    setState(() {
      _obscureTextPassword1 = !_obscureTextPassword1;
    });
  }

  String? _validatePassword1(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 8 || value.length > 16) {
      return 'Password must be between 8 and 16 characters';
    }
    if (!RegExp(r'[!@#$%^&*(),.?";:{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  void _togglePasswordVisibility2() {
    setState(() {
      _obscureTextPassword2 = !_obscureTextPassword2;
    });
  }

  String? _validatePassword2(String? value) {
    if (_passwordController1.text != _passwordController2.text) {
      return "passwords doesn't match";
    }
    return null;
  }
}
