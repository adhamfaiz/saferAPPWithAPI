import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safer/colors/AppColor.dart';
import 'package:safer/pages/Home/home.dart';
import '../../local/local_contorollr.dart';
class MyDrawer extends StatefulWidget {

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final BorderRadiusGeometry _borderRadiusGeometry=BorderRadius.circular(10);
 
  @override
  Widget build(BuildContext context) {
     Melocalcontrollr contrrollrlang = Get.find();

    
     
  
   @override
  void initState() {
  
    super.initState();
  }
    return  Container(
      child: Drawer(
        child: Directionality(
          textDirection: TextDirection.rtl,

          child: ListView(
            children: [
             UserAccountsDrawerHeader(
                 accountName:Text("wafi",
                   style: TextStyle(
                       color: Colors.black,
                       fontFamily: "Cairo-Regular",
                       fontWeight: FontWeight.w400),),
                 accountEmail: Text("wafy5639gmail.com",style: TextStyle(color: Colors.grey,)),
             currentAccountPicture: GestureDetector(
               child: CircleAvatar(
                 backgroundColor: Colors.yellow.shade700,
                 child: Icon(Icons.person, color: Colors.white,
                 ),

               ),
             ),
               decoration: BoxDecoration(
                 color: Colors.white,
               ),
             ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: InkWell(
                  onTap: (){},
                  child:  ListTile(
                    title: Text("homepage".tr,
                      style: TextStyle(color: Colors.black,
                          fontFamily: "Cairo-Regular",
                          fontSize: 15,
                      ),),
                    leading: Icon(Icons.home, color: Colors.orangeAccent),
                    trailing: Icon(Icons.arrow_forward, color: Colors.orangeAccent),
                  ),

                ),
              ),
              Divider(color: Colors.grey.shade700,),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>Home()));
                  },
                  child:  ListTile(
                    title: Text("Share".tr,
                      style: TextStyle(color: Colors.black,
                        fontFamily: "Cairo-Regular",
                        fontSize: 15,
                      ),),
                    leading: Icon(Icons.share, color: Colors.orangeAccent),
                    trailing: Icon(Icons.arrow_forward, color: Colors.orangeAccent,),

                  ),

                ),
              ),
              Divider(color: Colors.grey.shade700,),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: InkWell(
                  onTap: (){},
                  child:  ListTile(
                    title: Text("supor_center".tr,
                      style: TextStyle(color: Colors.black,
                        fontFamily: "Cairo-Regular",
                        fontSize: 15,
                      ),),
                    leading: Icon(Icons.phone, color: Colors.orangeAccent),
                    trailing: Icon(Icons.arrow_forward, color: Colors.orangeAccent),
                  ),

                ),
              ),
              Divider(color: Colors.grey.shade700,),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: InkWell(
                  onTap: ()async{
                    await FirebaseAuth.instance.signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacementNamed("login");
                  },
                  child:  ListTile(
                    title: Text("login_out".tr,
                      style: TextStyle(color: Colors.black,
                        fontFamily: "Cairo-Regular",
                        fontSize: 15,
                      ),),
                    leading: Icon(Icons.exit_to_app, color: Colors.orangeAccent),
                    trailing: Icon(Icons.arrow_forward, color: Colors.orangeAccent),
                  ),

                ),
              ),
              Divider(color: Colors.grey.shade700,),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: InkWell(
                  onTap: (){},
                  child: ListTile(
                    title: Text("more_of_aplocation".tr,
                      style: TextStyle(color: Colors.black,
                        fontFamily: "Cairo-Regular",
                        fontSize: 15,
                      ),),
                    leading: Icon(Icons.more, color: AppColors.deep_orange,),
                    trailing: Icon(Icons.arrow_forward, color: AppColors.deep_orange,),
                  ),

                ),
              ),
              Divider(color: Colors.grey.shade700,),
              ListTile(
            title: Text('2'.tr  ,style: TextStyle(color: Colors.black,
                        fontFamily: "Cairo-Regular",
                        fontSize: 15,),),
            leading: Icon(
              Icons.translate,
              color: AppColors.deep_orange,
            ),
              trailing: Icon(Icons.arrow_forward, color: Colors.orangeAccent),
            onTap: () {
              contrrollrlang.changelung("ar");
            },
          ),
           Divider(color: Colors.grey.shade700,),
          ListTile(
            title: Text('1'.tr  ,style: TextStyle(color: Colors.black,
                        fontFamily: "Cairo-Regular",
                        fontSize: 15,)),
            leading: Icon(
              Icons.translate,
              color: AppColors.deep_orange,
            ),
              trailing: Icon(Icons.arrow_forward, color: Colors.orangeAccent),
            onTap: (() => contrrollrlang.changelung("en")),
          ),

            ],
          ),
        ),
      ),
    );
  }
}
