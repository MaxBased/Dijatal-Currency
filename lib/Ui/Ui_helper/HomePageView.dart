import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  HomePageView({Key? key, required this.controller}) : super(key: key);
  var controller;

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  List images = [
    "images/a1.png",
    "images/a2.png",
    "images/a3.png",
    "images/a4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: true,
      controller: widget.controller,
      children: [
        myPages(images[0]),
        myPages(images[1]),
        myPages(images[2]),
        myPages(images[3]),
      ],
    );
  }

  Widget myPages(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Image.asset(image),
    );
  }
}
