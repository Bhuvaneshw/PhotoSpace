import 'package:flutter/material.dart';

import 'appbar.dart';
import 'home.dart';
import 'main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.title});

  final String title;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: widget.title,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const LoginForm(),
                profileIcon(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  TextEditingController username = TextEditingController(),
      password = TextEditingController(),
      email = TextEditingController();
  bool passwordState = false;

  LoginFormState() {
    username.text = '';
    password.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100, bottom: 100, left: 20, right: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.25),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const Center(
              child: Text(
                "Create Account",
                style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff0076d2),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Stack(
                children: [
                  TextField(
                    controller: password,
                    obscureText: !passwordState,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17, right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        constraints: const BoxConstraints(maxHeight: 14),
                        padding: EdgeInsets.zero,
                        onPressed: () => {
                          setState(() => {passwordState = !passwordState})
                        },
                        icon: Icon(
                          passwordState
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: ElevatedButton(
                onPressed: () {
                  AlertDialog d = AlertDialog(
                    title: const Text("Data"),
                    content: Text(
                        "Username: ${username.text}\nPassword: ${password.text}"),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    actions: [
                      TextButton(
                          onPressed: () => {Navigator.pop(context)},
                          child: const Text('Okay'))
                    ],
                  );
                  // showDialog(
                  // context: context, builder: (BuildContext context) => d);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Account created successfully!")));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 22),
                ),
                child: const Text('Signup'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage(
                                    title: 'Login',
                                  ))),
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget profileIcon() {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 55),
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withOpacity(0.25),
                          blurRadius: 8,
                          offset: const Offset(0, -4)),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 100,
                    height: 35,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.account_circle_rounded,
                    color: Colors.blue,
                    size: 80,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
