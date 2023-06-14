import 'dart:math';
import 'package:flutter/material.dart';
import '../colors/AppColor.dart';
import '../mybutton/mybutton.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../pages/drawer/drawer.dart';
import 'CarHome.dart';
import 'CarDetels.dart';
class Cars extends StatefulWidget {
  const Cars({super.key});

  @override
  State<Cars> createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  Widget headerBuild() {
    return MyDrawer();
  }

  List<companycar> rooms = [];

  Future<void> getRooms() async {
    var response =
        await http.get(Uri.parse("http://192.168.43.248:8080/api/car"));

    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body) as List;
        rooms = data.map((room) => companycar.fromJson(room)).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getRooms();
  }

  @override
  var x = 10;
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: SafeArea(
                child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: 30, bottom: 15, right: 10),
                child: const Text("شركات السيارات",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lateef-Regular',
                        color: AppColors.deep_orange,
                        fontSize: 30))),
            Expanded(
              child: Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: rooms.length,
                      itemBuilder: (context, index) {
                        return   InkWell(
                          onTap: (){
                             Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>Travil(
                                                hotelId: rooms[index].id),
                                          ),
                                        );
                          },
                          splashColor:AppColors.deep_orange,
                          child:Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(2, 10),
                                  blurRadius: 10,
                                  color: Colors.black12,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              border:
                            Border.all(color: Colors.orange.shade700, width: 1),),
                          height: 110,
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage("assets/images/images.png"),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(bottom: 70, right: 100),
                                        child: Text(
                                          rooms[index].name_company,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                                fontFamily: 'Lateef-Regular',
                                              fontSize: 25,
                                              color:
                                                  Color.fromARGB(246, 253, 173, 1)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10, top: 35),
                                          child: Text(rooms[index].description, style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                  fontFamily: 'Lateef-Regular',
                                                fontSize: 18,
                                                ),),
                                        ),
                                      ),
                                      Container(
                                          margin:
                                              EdgeInsets.only(top: 80, right: 210),
                                          width: 50,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              Text("4.3")
                                            ],
                                          )),
                                             Container(
                                               margin: EdgeInsets.only(top: 80,right: 60),
                                              
                                                        child: Text(
                                                          "أضغط لقائمه السيارات",
                                                          style: TextStyle(
                                                            fontFamily: 'Lateef-Regular',
                                                              fontSize: 17,
                                                              color: Color.fromARGB(
                                                                  255, 255, 6, 6)),
                                                        ),
                                                      ),
                                             
                                                  ],
                                    
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          ),
                        );
                      })),
            ),
            Container(
                margin: EdgeInsets.only(right: 300, bottom: 20),
                child: butoonrev(
                  txt: "تجاوز",
                  function: () {
                    Navigator.of(context).pushReplacementNamed("visited");
                  },
                ))
          ],
        ))));
  }
}

class companycar {
  final int id;
  final String name_company;
  final String image;
  final String address;
  final String description;

  companycar(
      {required this.id,
      required this.image,
      // ignore: non_constant_identifier_names
      required this.name_company,
      required this.address,
      required this.description});

  factory companycar.fromJson(Map<String, dynamic> json) {
    return companycar(
      id: json['id'],
      address: json['address'],
      name_company: json['name_company'],
      image: json['image'],
      description: json['description'],
    );
  }
}
