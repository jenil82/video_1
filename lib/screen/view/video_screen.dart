import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Video_Provider.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
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
                width: 100,
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius
                              .circular(20), topRight: Radius.circular(20)),
                          child: Image.asset("${videoProvider!.Images[index]}",
                            fit: BoxFit.cover,)),
                    ),
                  ],
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
