import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_pro_app/src/pages/launcher_page.dart';
import 'package:ui_pro_app/src/theme/theme.dart';

void main() => runApp(
  ChangeNotifierProvider(
    /** Temas
     * 1 -ligh
     * 2 - dark
     * 3 - custom
     */
    create: (_) => ThemeChanger(1),
    child: MyApp()
  )
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: appTheme.currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: LauncherPage(),
    );
  }
}