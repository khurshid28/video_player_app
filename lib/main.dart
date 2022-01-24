
import 'package:flutter/material.dart';
import 'package:video_download_app/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image download',
      theme: ThemeData(
      ),
      home:const HomePage(),
    );
  }
}






                //   // final byteData = await rootBundle.load('assets/'+names[index]+".jpg");
                //   Directory? _dir = await getExternalStorageDirectory();

                //   var dbPath = join(_dir!.path, 'assets/'+names[index]+".jpg");
                //   ByteData data = await rootBundle.load('assets/'+names[index]+".jpg");
                //   List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
                //   final my_image_file= await File(dbPath).writeAsBytes(bytes);
                //    // String appDocPath = _dir.path;

                //   // print(appDocPath);
          
                //  await GallerySaver.saveImage(my_image_file.path,albumName: "footballers");
                //  print('Image is saved');