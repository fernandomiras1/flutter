import 'package:flutter/material.dart';
import 'package:preferencias_user_app/src/share_prefs/preferencias_user.dart';
import 'package:preferencias_user_app/src/widgets/menu_widget.dart';


class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  TextEditingController _textController;
  final prefs = new PreferenciasUsuario();
  // cuando se inicializa el componente, antes del build
  @override
  void initState() {
    super.initState();
    // guardamos la pagina acutal en el storage
    prefs.ultimaPag = SettingsPage.routeName;
    // va a traer las preferecias guardadas en el storage del telefono. y le va asginar el valor. 
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    // cuando se inicializa el componente le agregamos el texto fer al input.
    _textController = new TextEditingController(text: prefs.nombreUser);
  }

  _setSelectedRadio(int value) {
    //vamos a guardar este entero
    prefs.genero = value;
    setState(() {
      _genero = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value) {
              setState(() {
                _colorSecundario = value;
                // va hacer la modificacion en el storage del mobile
                prefs.colorSecundario = value;
              });
            }
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono',
              ),
              onChanged: (String value) {
                prefs.nombreUser = value;
              },
            ),
          )
        ],
      )
    );
  }
}