import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Video_Provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoProvider? videoProvider, videoProvidert;

  @override
  Widget build(BuildContext context) {
    videoProvider = Provider.of<VideoProvider>(context, listen: true);
    videoProvidert = Provider.of<VideoProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Video", style: TextStyle(color: Colors.white
          )),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                var m1 = videoProvidert!.videoload(index);
                Navigator.pushNamed(context, '1');
              },
              child: Container(
                margin: EdgeInsets.only(left:160, right:160, top:40, bottom:10),
                height: 180,
                width: 180,
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius
                              .circular(8), topRight: Radius.circular(8)),
                          child: Image.asset("${videoProvider!.Images[index]}",
                            fit: BoxFit.cover,)),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 4,
                        spreadRadius: -1,
                      ),
                    ]
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    videoProvidert!.pausesong();
  }
}
