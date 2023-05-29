import 'package:flutter/material.dart';
class MarketViewPage extends StatefulWidget {
   MarketViewPage({Key? key}) : super(key: key);

  @override
  State<MarketViewPage> createState() => _MarketViewPageState();
}

class _MarketViewPageState extends State<MarketViewPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("MarketViewPage"),
      ),
    );
  }
}
