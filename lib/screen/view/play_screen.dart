import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/Video_Provider.dart';

class Play extends StatefulWidget {
  const Play({Key? key}) : super(key: key);

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  @override
  @override
  VideoProvider? moj, mojf;

  Widget build(BuildContext context) {
    var m1 = ModalRoute.of(context)!.settings.arguments;
    moj= Provider.of(context, listen: false);
    mojf = Provider.of(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Container(child: Chewie(controller: moj!.song!,)),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    mojf!.pausesong();
  }

}