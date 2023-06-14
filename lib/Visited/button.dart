import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:safer/pages/Home/Homethree.dart';
import 'package:safer/pages/Home/Hometow.dart';

class Boutton extends StatefulWidget {
  const Boutton({Key? key}) : super(key: key);

  @override
  State<Boutton> createState() => _BouttonState();
}

class _BouttonState extends State<Boutton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: DefaultTabController(
         length: 3,
         child: Column(
           children: <Widget>[
             Container(
               height: 60,
               color: Colors.white,
               child: ButtonsTabBar(
                 backgroundColor: Colors.red,
                 unselectedBackgroundColor: Colors.grey[300],
                 unselectedLabelStyle: TextStyle(color: Colors.black),
                 labelStyle:
                 TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                 tabs: [ Tab(

                 child: Container(
                   height: 50,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       border: Border.all(
                           color: Colors.yellow.shade700, width: 1),
                       boxShadow: const [
                         BoxShadow(
                           color: Colors.white,
                           spreadRadius: 2,
                           blurRadius: 2,
                           offset: Offset(2, 2),
                         ),
                         BoxShadow(
                             color: Colors.white,
                             spreadRadius: 2,
                             blurRadius: 2,
                             offset: Offset(-2, -2))
                       ]),
                   child: GestureDetector(
                     onTap: () {
                       //Navigator.of(context).push(MaterialPageRoute(
                       //  builder: (context) => const Home()));
                     },
                     child: Align(
                       alignment: Alignment.center,
                       child: Text(
                         "الرائج",
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: Colors.yellow.shade700,
                           fontSize: 17,
                         ),
                       ),
                     ),
                   ),
                 ),
               ),
                 Tab(
                   child: Container(
                     height: 50,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30),
                         border: Border.all(
                             color: Colors.yellow.shade700, width: 1),
                         boxShadow: const [
                           BoxShadow(
                             color: Colors.white,
                             spreadRadius: 2,
                             blurRadius: 2,
                             offset: Offset(2, 2),
                           ),
                           BoxShadow(
                               color: Colors.white,
                               spreadRadius: 2,
                               blurRadius: 2,
                               offset: Offset(-2, -2))
                         ]),
                     child: GestureDetector(
                       onTap: () {
                         Navigator.of(context).push(MaterialPageRoute(
                             builder: (context) =>  HomeThree()));
                       },
                       child: Align(
                         alignment: Alignment.center,
                         child: Text(
                           "أثري",
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.yellow.shade700,
                             fontSize: 17,
                           ),
                         ),
                       ),
                     ),
                   ),
                 ),
                 Tab(
                   child: Container(
                     height: 50,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(35),
                         border: Border.all(
                             color: Colors.yellow.shade700, width: 1),
                         boxShadow: const [
                           BoxShadow(
                             color: Colors.white,
                             spreadRadius: 2,
                             blurRadius: 2,
                             offset: Offset(2, 2),
                           ),
                           BoxShadow(
                               color: Colors.white,
                               spreadRadius: 2,
                               blurRadius: 2,
                               offset: Offset(-2, -2))
                         ]),
                     child: GestureDetector(
                       onTap: () {
                         Navigator.of(context).push(MaterialPageRoute(
                             builder: (context) => const HomeTow()));
                       },
                       child: Align(
                         alignment: Alignment.center,
                         child: Text(
                           "سياحي",
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.yellow.shade700,
                             fontSize: 17,
                           ),
                         ),
                       ),
                     ),
                   ),
                 ),],

               ),

               ),


           ],
         ),
       ),
     ),
    );
  }
}



