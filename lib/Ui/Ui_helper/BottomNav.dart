import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key, required this.Controller}) : super(key: key);
  PageController Controller;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      height: 63,
      color: Colors.amber,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 -20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: (){
                        Controller.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                      },
                      icon: const Icon(Icons.home)),
                  IconButton(onPressed: (){
                    Controller.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  }, icon: const Icon(Icons.bar_chart)),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                    Controller.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  }, icon: const Icon(Icons.person)),
                  IconButton(
                      onPressed: (){
                        Controller.animateToPage(3, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                      },
                      icon: const Icon(Icons.bookmark)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
