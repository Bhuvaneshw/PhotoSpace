import 'package:flutter/material.dart';

import 'signup.dart';
import 'appbar.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Photo Space'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      password = TextEditingController();
  bool passwordState = false;

  LoginFormState() {
    username.text = 'Bhuvanesh';
    password.text = '1234';
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
                "Login",
                style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff0076d2),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
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
                  if (username.text == 'Bhuvanesh' && password.text == '1234') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Invalid username or password!")));
                  }
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
                child: const Text('Login'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage(
                                    title: "Signup",
                                  ))),
                    },
                    child: const Text(
                      "Signup",
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
