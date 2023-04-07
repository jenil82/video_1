import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_1/screen/provider/Video_Provider.dart';
import 'package:video_1/screen/view/play_screen.dart';
import 'package:video_1/screen/view/video_screen.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VideoProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => Video(),
          '1':(context) => Play(),
        },
      ),
    ),
  );
}