import 'package:flutter/material.dart';
import 'appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Profile',
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.blue,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => BodyState();
}

class BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Welcome')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      color: const Color(0xfffafafa),
      child: Column(
        children: <Widget>[
          const Icon(
            Icons.account_circle,
            color: Colors.blue,
            size: 150,
          ),
          const Text(
            "Bhuvanesh",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text('Name '),
                    Text('Email '),
                    Text('Department '),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(': Bhuvanesh'),
                    Text(': bhuvanesh@acutecoder.ml'),
                    Text(': CSE'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
