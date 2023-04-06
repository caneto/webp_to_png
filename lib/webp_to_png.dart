import 'dart:io';
import 'package:image/image.dart' as img;


// Ideia do Professor Rodrigo Rahman
void main() {

  final dir = Directory('./images');
  final files = dir.listSync();

  for(var file in files) {
    final fileFullName = file.path.split(Platform.pathSeparator).last;
    final fileName = fileFullName.split('.').first;

    // forma por thread
    img.Command()
    ..decodeWebPFile(file.path)
    ..encodePng() // Pode ser varios como encodeGif, encodeIco, encodeJpg
    ..writeToFile('./images/$fileName.png')
    ..executeThread()
    ;

  // Forma mais didatica
  /*   final imageWebP = img.decodeWebP(File(file.path).readAsBytesSync());
    if(imageWebP != null) {
      final imagePng = img.encodePng(imageWebP);
      File('./images/$fileName.png').writeAsBytesSync(imagePng);
    } */
  }


}