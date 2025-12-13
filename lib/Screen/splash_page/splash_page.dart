
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/getstart_page.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:4), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GetStartPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        height: double.infinity,
        width: double.infinity,
          color:Colors.blueAccent,
        child:Image.network("https://media.istockphoto.com/id/528681565/vector/newspaper-vector-set.jpg?s=612x612&w=0&k=20&c=q1EmcOq3Gu1LfcoWNPXhLxIsiUpJ1ITUvdeISDZNmxo=",
            fit:BoxFit.cover,filterQuality: FilterQuality.high)
      )
      
    );
  }
}