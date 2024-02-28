import 'package:e_waste/pages/login.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() {
    return _SignupPageState();
  }
}

class _SignupPageState extends State<SignupPage> {
  final FocusNode _usernameFocusNode =
      FocusNode(); // FocusNode for the username field
  final FocusNode _emailFocusNode =
      FocusNode(); // FocusNode for the email field
  final FocusNode _passFocusNode = FocusNode(); // FocusNode for the email field
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

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

  bool _isUsernameLabelVisible = true;
  bool _isEmailLabelVisible = true;
  bool _isPassLabelVisible = true;

  void _updateLabelVisibility() {
    setState(() {
      _isUsernameLabelVisible =
          !_usernameFocusNode.hasFocus && _usernameController.text.isEmpty;
      _isEmailLabelVisible =
          !_emailFocusNode.hasFocus && _emailController.text.isEmpty;
      _isPassLabelVisible =
          !_passFocusNode.hasFocus && _passController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Welcome to Pick-E",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
              ),
              const SizedBox(height: 60),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Full name",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      controller: _usernameController,
                      focusNode: _usernameFocusNode,
                      onTap: () {
                        setState(() {
                          _isUsernameLabelVisible = false;
                        });
                      },
                      onChanged: (_) => _updateLabelVisibility(),
                      decoration: InputDecoration(
                        labelText:
                            _isUsernameLabelVisible ? " Enter Full Name" : "",
                        // prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (name) {
                        if (name == null || name.trim().isEmpty) {
                          return "The username should not be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
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
                        labelText: _isEmailLabelVisible ? "  Enter email" : "",
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: const Color.fromARGB(167, 4, 77, 6),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
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
                        child: const Text(
                          "Continue with Google",
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: const Color.fromARGB(167, 4, 77, 6),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          minimumSize: const Size(double.infinity, 0),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            "Sign In",
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
    );
  }
}

// mixin mainAxisAlignment {}
