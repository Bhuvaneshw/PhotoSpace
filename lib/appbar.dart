import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar extends AppBar {
  MyAppBar(
      {super.key,
      VoidCallback? onBackPressed,
      required String title,
      Widget? leading})
      : super(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white),
            title: Text(title),
            titleTextStyle: const TextStyle(color: Colors.blue),
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              color: const Color(0xfffafafa),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.blue.withOpacity(0.25),
                    ),
                  ],
                ),
              ),
            ),
            elevation: 0,
            leading: leading);
}
