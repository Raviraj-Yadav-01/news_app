import 'package:flutter/Material.dart';
import 'navigation_page/explore_page.dart';
import 'navigation_page/homePage.dart';
import 'navigation_page/save_page.dart';
import 'navigation_page/setting_page.dart';

class DashBoardPage extends StatefulWidget{
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  int selectedIndex = 1;

  List<Widget> navPages = [
    HomePage(),
    ExplorePage(),
    NotificationPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar:AppBar(
        title:Text("News DashBoard"),
      ),*/

      body:navPages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade50,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blue.shade300,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,

        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
          iconSize: 30,
        items:[
          BottomNavigationBarItem(icon:Icon(Icons.home),label:"Home"),
          BottomNavigationBarItem(icon:Icon(Icons.explore),label:"Home"),
          BottomNavigationBarItem(icon:Icon(Icons.notifications_active_outlined),label:"Home"),
          BottomNavigationBarItem(icon:Icon(Icons.settings),label:"Home"),

        ]
      ),

    );
  }
}