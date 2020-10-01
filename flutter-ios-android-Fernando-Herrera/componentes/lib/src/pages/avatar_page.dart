import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  static final iconName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.famousbirthdays.com/faces/lee-stan-image.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            // un margen a la derecha
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            image: NetworkImage(
                'https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_1000,h_600/https://wipy.tv/wp-content/uploads/2020/07/imagen-nunca-antes-vista-de-stan-lee.jpg')),
      ),
    );
  }
}
