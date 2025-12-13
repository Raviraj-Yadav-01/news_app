
import 'package:flutter/material.dart';
import 'package:news_app/Screen/dashBoard/dashboard.dart';

import 'Screen/dashBoard/navigation_page/homePage.dart';

class GetStartPage extends StatelessWidget{
  const GetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children:[
          Container(
            height: double.infinity,
            width: double.infinity,
            color:Colors.blueAccent,
          child:Image.asset("assets/image/news image.jpg",fit:BoxFit.cover,
           filterQuality:FilterQuality.high)
          ),

          Positioned(
            bottom: 50,
            right: 10, left: 10,
              child:Column(
                children:[

                  SizedBox(
                    width:500,
                    child: Text("Don't Miss What Happen in Another Part of The World",
                    maxLines:2,
                    style:TextStyle(fontSize: 20,color:Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 11,),

                  SizedBox(
                    width:500,
                    child: Text("hear, see, watch something in the world using Tiding and share it with your family or friend",
                        maxLines:2,
                        style:TextStyle(fontSize: 12,color:Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 11,),

                  SizedBox(
                    width:500,
                    child: OutlinedButton(
                        style:OutlinedButton.styleFrom(
                          backgroundColor:Colors.blueAccent,
                          //side:BorderSide(color:Colors.white,width: 2),
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                        )
                     ,onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>DashBoardPage()));
                    }, child: Text("Get Started")),
                  )


                ]
              )
            )



        ]
      )
    );
  }

}