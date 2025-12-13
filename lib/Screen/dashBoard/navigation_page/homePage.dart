


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var searchController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    getEveryThings();
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only( left:8.0, right:8.0, bottom: 8.0, top:40),
        child: Column(
          children:[

            Container(
              height:45, width:double.infinity,
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(21)),
              child:Row(
                children:[

                  CircleAvatar(
                    radius:25,
                  ),
                  SizedBox(width:15),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text("Welcome"),

                      Text("John Richardson !",style:TextStyle(fontWeight:FontWeight.bold, fontSize:15))
                    ]
                  ),
                  Spacer(),

                  IconButton(onPressed: (){

                  }, icon: Icon(Icons.notifications_active_outlined)),
                ]
              )
            ),
            SizedBox(height:15),

            TextField(
              controller:searchController,
              decoration:InputDecoration(
                border:OutlineInputBorder(borderRadius:BorderRadius.circular(21),
                borderSide: BorderSide.none),
                enabledBorder:OutlineInputBorder(borderRadius:BorderRadius.circular(21),
                    borderSide: BorderSide.none),
                focusedBorder:OutlineInputBorder(borderRadius:BorderRadius.circular(21),
                    borderSide: BorderSide.none),

                filled:true,
                fillColor:Colors.white,
                prefixIcon:Icon(Icons.search,color:Colors.grey),
                hintText:"Let's see what happened today",
                hintStyle:TextStyle(color:Colors.grey,fontWeight:FontWeight.bold,fontSize:15)

              )
            ),
            SizedBox(height:15),

            SizedBox(
              height:200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return Card(
                      child:Container(
                        height:200,
                        width:330,
                        decoration:BoxDecoration(
                          // image:DecorationImage(image: NetworkImage("https://www.freepik.com/free-vector/climber-with-flag-conquering-top-mountain-hand_30734287.htm#fromView=keyword&page=1&position=0&uuid=e7858d59-a9c9-49ea-9837-7f768a4a0521&query=Achieve"),fit:BoxFit.cover),
                            color:Colors.blueAccent,
                            borderRadius:BorderRadius.circular(23)),
                      )

                  );
                },
              ),
            ),
            SizedBox(height:15),

            SizedBox(
              height:30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap:true,
                  itemBuilder:(context, index){
                    return Container(
                        height:40,
                        decoration:BoxDecoration(
                            color:Colors.red,
                            borderRadius:BorderRadius.circular(15)),
                        child:Center(child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("Education"),
                        ))
                    );
                  }

              ),
            )


          ]
        ),
      )
    );
  }

//*****************************************************************//

  void getEveryThings()async{
    String urlEveryThings = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=010d2329efdb4769a7840d2f953ad535";

    var res1 = await http.get(Uri.parse(urlEveryThings));
    var everyThing = jsonDecode(res1.body);

    if(res1.statusCode == 200){
      print(res1.body);
    }

  }
}