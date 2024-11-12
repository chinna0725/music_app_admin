import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController =
      TextEditingController(text: 'keerthana@ignitelabs.in');
  final TextEditingController _passwordController =
      TextEditingController(text: "Keerthana@123");
  final _formKey = GlobalKey<FormState>();
  bool _obscureTextPassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 8 || value.length > 16) {
      return 'Password must be between 8 and 16 characters';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  void _showSnackBar(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(SnackBar(content: Text(message)));
    });
  }

  @override
  Widget build(BuildContext context) {
    //  double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/background_image.jpg'), // Replace with your image asset
                  fit: BoxFit.cover, // Cover the entire screen
                ),
              ),
            ),
          ),
          // Form Container
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  decoration: BoxDecoration(
                    color:
                        Colors.white, // Background color for the form container
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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Center(
                            child: Icon(
                              Icons.flash_on,
                              color: Colors.blueAccent,
                              size: 50,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // const Center(
                          //   child: Text(
                          //     'Explore our SaaS product!',
                          //     style: TextStyle(
                          //         fontSize: 16, color: Colors.grey),
                          //   ),
                          // ),
                          const SizedBox(height: 30),
                          // ElevatedButton.icon(
                          //   onPressed: () {},
                          //   icon: const  Icon(
                          //     FontAwesomeIcons.google,
                          //     color: Color(0xFF4285F4), // Google blue color
                          //   ),
                          //   label: const Text(
                          //     'Sign in with Google',
                          //     style: TextStyle(color: Colors.black),
                          //   ),
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor:
                          //         Colors.white, // White background
                          //     foregroundColor: Colors.black, // Black text
                          //     side: const BorderSide(
                          //         color: Colors.black), // Black border
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(10),
                          //     ),
                          //     padding: const EdgeInsets.symmetric(
                          //         vertical: 16.0),
                          //   ),
                          // ),
                          const SizedBox(height: 10),
                          const Center(
                            child: Text(
                              'or Sign in with Email',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'mail@website.com',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: _validateEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Min. 8 character',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureTextPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: _togglePasswordVisibility,
                              ),
                            ),
                            validator: _validatePassword,
                            onEditingComplete: () {},
                            obscureText: _obscureTextPassword,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: _rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value!;
                                      });
                                    },
                                  ),
                                  const Text('Remember me'),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10),

                          const SizedBox(height: 30),
                          const Center(
                            child: Text(
                              '©2024 IgniteLabs All rights reserved.',
                              style: TextStyle(color: Colors.grey),
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
        ],
      ),
    );
  }
}
