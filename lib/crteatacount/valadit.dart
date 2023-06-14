
import 'package:flutter/material.dart';
import 'package:safer/crteatacount/Rigester.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import '../colors/AppColor.dart';
class Valadit extends StatelessWidget {
  const Valadit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
     
      body:Directionality(
        textDirection: TextDirection.rtl,
        child:  SafeArea(
          child:
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                          child: DefaultTabController(
                                length: 2,
                                child:
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ButtonsTabBar( 
                                      unselectedBackgroundColor:AppColors.deep_orange,
                                      radius: 5,
                                      contentPadding: EdgeInsets.only(left: 50,right: 70),
                                      
                            tabs:
                             [
                              Tab(
                                    child: Text(
                                      "البريد الكتروني",
                                      style: TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                              ),
                              Tab(
                                    child: Text(
                                      "رقم الهاتف",
                                      style: TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                              ),
                            ]),
                               Expanded(
                              child: TabBarView(
                            children: [
                             
                              Email(),
                              Phonenumber()
                            ],
                          )),
                                  ],
                                ),
                                  
                            
                      
                              
                                ),
                        ),
                             
                       
           ),));
  }
}