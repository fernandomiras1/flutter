part of 'helpers.dart';

Future<BitmapDescriptor> getMarkerInicioIcon(int segundos)  async {

  /*
    Basicamente tomamos un CustomPainter hecho en Canvas y lo devolovemos como una imagen.
   */

  final recorder = new PictureRecorder();
  final canvas   = Canvas(recorder);
  final size     = Size(350, 150);

  final minutos  = (segundos / 60).floor();

  final markerInicio = new MarkerInicioPainter(minutos);
  markerInicio.paint(canvas, size);

  final picture = recorder.endRecording();
  final image   = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData.buffer.asUint8List());
  
}

Future<BitmapDescriptor> getMarkerDestinoIcon(String descripcion, double metros)  async {

  final recorder = new PictureRecorder();
  final canvas   = Canvas(recorder);
  final size     = Size(350, 150);


  final markerDestino = new MarkerDestinoPainter(descripcion, metros);
  markerDestino.paint(canvas, size);

  final picture = recorder.endRecording();
  final image   = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData.buffer.asUint8List());
  


}