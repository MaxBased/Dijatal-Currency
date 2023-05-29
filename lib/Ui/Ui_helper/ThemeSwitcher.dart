import 'package:digital_currency/Provider/ThemeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ThemeSwitcher extends StatefulWidget {
   ThemeSwitcher({Key? key}) : super(key: key);

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();

}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var switchIcon = Icon(themeProvider.isDarkMOde ? CupertinoIcons.moon_fill : CupertinoIcons.sun_max_fill);
    return IconButton(
        onPressed: (){
          themeProvider.ToggleTheme();
        },
        icon: switchIcon);
  }
}
