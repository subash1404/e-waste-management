import 'dart:convert';

import 'package:e_waste/pages/home.dart';
import 'package:e_waste/pages/nav.dart';
import 'package:e_waste/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:e_waste/utlis/shared_preferences_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _usernameFocusNode =
      FocusNode(); // FocusNode for the username field
  final FocusNode _emailFocusNode =
      FocusNode(); // FocusNode for the email field
  final FocusNode _passFocusNode = FocusNode(); // FocusNode for the email field
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  SharedPreferences? prefs = SharedPreferencesManager.preferences;
  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(_updateLabelVisibility);
    _emailFocusNode.addListener(_updateLabelVisibility);
    _passFocusNode.addListener(_updateLabelVisibility);
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  bool _isEmailLabelVisible = true;
  bool _isPassLabelVisible = true;
  bool _isChecked = false;
  bool isLoading = false;

  void _updateLabelVisibility() {
    setState(() {
      _isEmailLabelVisible =
          !_emailFocusNode.hasFocus && _emailController.text.isEmpty;
      _isPassLabelVisible =
          !_passFocusNode.hasFocus && _passController.text.isEmpty;
    });
  }

  void login() async {
    if (!_loginFormKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      var response = await http.post(
          Uri.parse("${dotenv.env["BACKEND_BASE_API"]}/user/login"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "email": _emailController.text,
            "password": _passController.text
          }));

      var responseData = jsonDecode(response.body);
      if (response.statusCode > 399) {
        throw responseData["message"];
      }

      await prefs?.setString("email", responseData["email"]);
      await prefs?.setString("token", responseData["token"]);
      await prefs?.setString("userId", responseData["userId"]);
      await prefs?.setString("username", responseData["username"]);

      setState(() {
        isLoading = false;
      });
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => NavPage()));
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(err.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login to",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      height: 150,
                      width: 150,
                    )
                  ],
                ),
                // SizedBox(
                //   height: 12,
                // ),
                // const Text(
                //   "We\'re happy to see you back again",
                //   style: TextStyle(fontSize: 16),
                // ),

                Form(
                  key: _loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Email",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        onTap: () {
                          setState(() {
                            _isEmailLabelVisible = false;
                          });
                        },
                        onChanged: (_) => _updateLabelVisibility(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          labelText:
                              _isEmailLabelVisible ? "  Enter email" : "",
                          // prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email == null || email.trim().isEmpty) {
                            return "The email should not be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        controller: _passController,
                        focusNode: _passFocusNode,
                        onTap: () {
                          setState(() {
                            _isPassLabelVisible = false;
                          });
                        },
                        onChanged: (_) => _updateLabelVisibility(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),

                          labelText:
                              _isPassLabelVisible ? "  Enter password" : "",
                          // prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.name,
                        validator: (pass) {
                          if (pass == null || pass.trim().isEmpty) {
                            return "The password should not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (val) {
                              setState(() {
                                _isChecked = val!;
                              });
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          Text("Remember Me",
                              style: TextStyle(
                                  color: Color.fromARGB(187, 0, 0, 0))),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text("Forgot Password?",
                                style: TextStyle(
                                    color: Color.fromARGB(187, 0, 0, 0))),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ElevatedButton(
                        onPressed: isLoading ? () {} : login,
                        child: isLoading
                            ? CircularProgressIndicator(
                                color: Colors.green.shade200,
                              )
                            : const Text(
                                "Sign In",
                                style: TextStyle(fontSize: 16),
                              ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: const Color.fromARGB(167, 4, 77, 6),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          minimumSize: const Size(double.infinity, 0),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: Color.fromARGB(131, 0, 0, 0),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Or",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(207, 0, 0, 0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color.fromARGB(131, 0, 0, 0),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: const Color.fromARGB(167, 4, 77, 6))),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            foregroundColor:
                                const Color.fromARGB(167, 4, 77, 6),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            minimumSize: const Size(double.infinity, 0),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/google.jpg',
                                height: 30,
                                width: 80,
                              ),
                              const Text(
                                "Continue with Google",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don\'t have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => SignupPage()));
                            },
                            child: Text(
                              "Create One",
                              style: TextStyle(
                                  color: const Color.fromARGB(167, 4, 77, 6)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
