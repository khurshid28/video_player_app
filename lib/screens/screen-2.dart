
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';


class Screen2 extends StatefulWidget {
  String tag;
  Screen2(this.tag);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2>{
 bool isPlay=false;
VideoPlayerController? videoPlayerController;
ChewieController? chewieController;


Future initializeVideoPlayer() async {
videoPlayerController = VideoPlayerController.asset("asset_videos/"+widget.tag+".mp4" );
await Future.wait([
    videoPlayerController!.initialize()
]);
chewieController = ChewieController(
    videoPlayerController: videoPlayerController!,
    autoPlay: true,
    looping: true,
    allowFullScreen: true,
    materialProgressColors: ChewieProgressColors(playedColor: Colors.white,handleColor: Colors.white),
    fullScreenByDefault: true

);

   return 1;
}
  @override
  void dispose() {
    super.dispose();
    chewieController!.dispose();
    videoPlayerController!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
 
     return   FutureBuilder(
          future: initializeVideoPlayer(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
           if(snapshot.hasData){
              return Scaffold(
            body:     
        Container( 
                width: size.width,
                height: size.height,
                child: Stack(
                  children: [
                     SizedBox(
                    height: size.height,
                    child: AspectRatio(
            aspectRatio:chewieController!.videoPlayerController.value.aspectRatio,
            child: Chewie(
                    controller: chewieController!,
                    ),
                 ),
                    
                  ),
                    
                    Positioned(
                      top: 60,
                      child: Row(
                        children: [
                          
                          IconButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, icon: Icon(Icons.arrow_back_ios_new_rounded,),color: Colors.white,iconSize: 30,),
                         const Text("Back",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)
                        ],
                      ),
                    ),

                  ],
                ),
                decoration:  BoxDecoration(
                  color: Colors.blueGrey,

    ),
              
    ),);
           }
           else{
             return const Scaffold(
               backgroundColor: Colors.blueGrey,
               body:Center(
                 child:SpinKitFadingCircle(
               duration: Duration(milliseconds: 500),
               color: Colors.white,
               size: 120,
            )
               ),
             );
           }
            },
         );
 
 
  }
}



