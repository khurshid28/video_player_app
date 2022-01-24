
import 'dart:convert';
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_download_app/screens/screen-2.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> names=[
    "messi",
    "ronaldo",
    "neymar",
    "salah",


  ];
  bool IsDownloading=false;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: Scaffold(
            backgroundColor: Colors.blueGrey,
            body: Container(
              margin:const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(names.length, (index)=>Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                  height: 400,
                  width: size.width-50,
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2(names[index])));
                     
                      }, icon: Icon(Icons.fit_screen_outlined),color: Colors.white,iconSize: 40,),
                      IconButton(
                        onPressed: ()async{

   
                          print("boshlandi");
                          IsDownloading =true;
                          setState(() {
                          });
                          Directory documentDirectory = await getApplicationDocumentsDirectory();
                          ByteData imageData1 = await rootBundle.load("asset_videos/"+names[index]+".mp4",);
                          // print(imageData1.buffer.asUint8List());
                          File file =  File(join(documentDirectory.path,names[index] +'.mp4'));
                         await file.writeAsBytes(imageData1.buffer.asUint8List(imageData1.offsetInBytes, imageData1.lengthInBytes));
                         await  GallerySaver.saveVideo(file.path,toDcim: true,headers: {},albumName: "Xurshid videos");
                         await file.delete();
                         IsDownloading =false;
                         setState(() {
                           
                         });
                         print("tugadi");                      
                          await Flushbar(
                            backgroundColor: Colors.blueGrey,
                            flushbarPosition: FlushbarPosition.TOP,
                            dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                            title: 'video_download_app',
                            message:
                                names[index]+".mp4 is saved to gallery",
                                messageSize: 17,
                                titleSize: 17,
                            duration:const Duration(seconds: 2),
                          ).show(context);
                      }, icon:const Icon(Icons.file_download_rounded),color: Colors.white,iconSize: 40,),
                    ],
                  ),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius:const BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(image:AssetImage("assets/"+names[index]+".jpg") ,fit: BoxFit.cover,)
                  ),
              )),
                ),
                )),
          ),
        ),
        Positioned(
          top: IsDownloading ? 0 :size.height,
          child: Container(
          width: size.width,
          height: size.height,
          color: Colors.black.withOpacity(0.2),
          child: Center(
            child: SpinKitFadingCircle(
              duration: Duration(milliseconds: 500),
              color: Colors.white,
              size: 120,
            ),
          ),
        ), )
      ],
    );
  }
}

