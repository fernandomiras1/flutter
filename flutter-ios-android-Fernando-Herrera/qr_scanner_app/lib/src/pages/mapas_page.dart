import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/providers/db_provider.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ScanModel>>(
        future: DBProvider.db.getAllScans(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final scans = snapshot.data;
          if (scans.length == 0) {
            return Center(child: Text('No hay información'));
          }

          return ListView.builder(
						itemCount: scans.length,
						// Dismissible desolizar izquierda o derecha y agregarle acciones. como btn
						itemBuilder: (context, i) => Dismissible(
							// creamos una llave unica mediate Flutter
							key: UniqueKey(),
							// de derecha a izquierda
							direction: DismissDirection.endToStart,
							onDismissed: (direction) => DBProvider.db.deleteScan(scans[i].id),
							background: Container(
								alignment: AlignmentDirectional.centerEnd,
								padding: EdgeInsets.only(right: 20.0),
								color: Colors.red,
								child: Icon(Icons.delete, color: Colors.white),
							),
							child: ListTile(
								leading: Icon(Icons.cloud_queue, color: Theme.of(context).primaryColor),
								title: Text(scans[i].valor),
								trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
							)
						)
						
						
						
						
					);
        });
  }
}
