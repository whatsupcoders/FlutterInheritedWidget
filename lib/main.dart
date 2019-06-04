import 'package:flutter/material.dart';
import 'homepage.dart';
import 'statecontainer.dart';

void main(){
runApp(StateContainer(
      child:MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Inherited Widget',
      theme: ThemeData(
        primaryColor: Color(0xffE81035),
      ),
      home: HomePage(),
    );
  }
}