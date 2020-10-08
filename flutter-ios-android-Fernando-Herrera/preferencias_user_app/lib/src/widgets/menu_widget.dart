import 'package:flutter/material.dart';
import 'package:preferencias_user_app/src/pages/home_page.dart';
import 'package:preferencias_user_app/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // para tener un scroll ListView
      child: ListView(
        // comienze desde cero. sin padding
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu-img.jpg'),
                // para q se expanda todo el ancho posible
                fit: BoxFit.cover
              )
            ),
          ),

          // Opciones de menu
          ListTile(
            leading: Icon(Icons.home, color: Colors.blue),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue),
            title: Text('Pary Mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Settings'),
            onTap: () => Navigator.pushReplacementNamed(context, SettingsPage.routeName),
          ),
        ],
      ),
    );
  }
}