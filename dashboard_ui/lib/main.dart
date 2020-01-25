import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import 'MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData.light(),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: "Dashboard UI",
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: MyHomePage(),
        );
      }
    );
  }
}