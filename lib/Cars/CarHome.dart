import 'package:flutter/material.dart';
import '../colors/AppColor.dart';
import '../mybutton/mybutton.dart';
import '../pages/Home/home.dart';
import '../pages/drawer/drawer.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: duplicate_import

import 'dart:convert';

import 'CarDetels.dart';

class Travil extends StatefulWidget {
  final int hotelId;
  const Travil({required this.hotelId});

  @override
  State<Travil> createState() => _TravilState();
}

class _TravilState extends State<Travil> {
  List<carmode> montionTourist = [];

  Future<void> getRooms() async {
    var response = await http.get(Uri.parse(
        "http://192.168.43.248:8080/api/hotels/${widget.hotelId}/carmode"));

    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body) as List;
        montionTourist =
            data.map((montion) => carmode.fromJson(montion)).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getRooms();
  }

  int counter = 0;
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void descrementCounter() {
    setState(() {
      counter--;
    });
  }

  var selectcountruy = "صنعاء";
  var select = "عدن";
  var vas;
  var contary = [
    "صنعاء",
    "تعز",
    "عدن",
    "الحديده",
    "حضرموت",
    "سيئون",
    "ذمار",
    "مارب",
    "ابين",
    "لحج"
  ];
  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: SafeArea(
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            drwer(),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Text("ألوجهه",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 172, 17),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
              padding: EdgeInsets.only(left: 80, right: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("من",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 172, 17),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text("ألى",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 172, 17),
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 70, right: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 12),
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 172, 17),
                        borderRadius: BorderRadius.circular(30)),
                    child: DropdownButton(
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      items: contary
                          .map((e) => DropdownMenuItem(
                                child: Text("$e"),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          // ignore: prefer_typing_uninitialized_variables
                          selectcountruy = val!;
                        });
                      },
                      value: selectcountruy,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 12),
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 172, 17),
                        borderRadius: BorderRadius.circular(30)),
                    child: DropdownButton(
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      items: contary
                          .map((e) => DropdownMenuItem(
                                child: Text("$e"),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          // ignore: prefer_typing_uninitialized_variables
                          select = val!;
                        });
                      },
                      value: select,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Text("نوع السياره",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 172, 17),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                        height: 650,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: montionTourist.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                 InkWell(
                                    child: Container(
                                        width: mdw,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            border: Border.all(
                                                color: Colors.orange.shade700,
                                                width: 1),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(2, 10),
                                                blurRadius: 10,
                                                color: Colors.black12,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        height: 120,
                                        child: Container(
                                            child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                              Container(
                                                height: 120,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    color: Colors.yellow,
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    image: const DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            "assets/images/pr3.jpg"))),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      montionTourist[index]
                                                          .name_car,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Color.fromARGB(
                                                              255, 255, 189, 6)),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                          child: Text(
                                                        "سنه الصنع",
                                                        style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255,
                                                                171,
                                                                172,
                                                                173)),
                                                      )),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                          child: Text(
                                                        "${montionTourist[index].years} ",
                                                        style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255,
                                                                171,
                                                                172,
                                                                173)),
                                                      )),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                          child: Text(
                                                        "مقاعد",
                                                        style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255,
                                                                171,
                                                                172,
                                                                173)),
                                                      )),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Container(
                                                          child: Text(
                                                        "${montionTourist[index].drap} ",
                                                        style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255,
                                                                171,
                                                                172,
                                                                173)),
                                                      )),
                                                    ],
                                                  ),
                                                  InkWell(
                                                    child: Text(
                                                      "أضغط لتفاصيل السيارات",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Color.fromARGB(
                                                              255, 255, 6, 6)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                      margin:
                                                          EdgeInsets.only(top: 5),
                                                      width: 60,
                                                      height: 23,
                                                      decoration: BoxDecoration(
                                                          color: Colors.yellow,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color: Colors.white,
                                                            size: 20,
                                                          ),
                                                          Text(
                                                            montionTourist[index]
                                                                .catgory,
                                                            textAlign:
                                                                TextAlign.center,
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.white),
                                                          )
                                                        ],
                                                      )),
                                                  Container(
                                                      width: 60,
                                                      height: 23,
                                                      margin: EdgeInsets.all(15),
                                                      padding: EdgeInsets.only(
                                                          right: 7),
                                                      decoration: BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255, 116, 113, 112),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12)),
                                                      child: Text(
                                                       '${montionTourist[index]
                                                            .price_day}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.white),
                                                      )),
                                                  Container(
                                                      width: 60,
                                                      height: 23,
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12)),
                                                      child: InkWell(
                                                          onTap: () => Navigator
                                                                  .of(context)
                                                              .pushReplacementNamed(
                                                                  "Card"),
                                                          child: Text(
                                                            "حجز",
                                                            textAlign:
                                                                TextAlign.center,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color:
                                                                    Colors.white),
                                                          ))),
                                                ],
                                              ),
                                            ]))),
                                            focusColor: AppColors.deep_orange,
                                             onTap: (){
                             Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>  Cardetels(
                                                hotelId: montionTourist[index].id),
                                          ),
                                        );
                          },
                                  )
                                ],
                              );
                            })),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 300, top: 550),
                      child: butoonrev(
                        txt: "تجاوز",
                        function: () {
                          Navigator.of(context)
                              .pushReplacementNamed("visited");
                        },
                      ))
                ],
              ),
            ),
          ]),
        ),
      )),
    );
  }
}

class carmode {
  final int id;
  final int drap;
  final int years;
  final String name_car;
  final String image;
  final int price_day;
  final String catgory;

  carmode(
      {required this.id,
      required this.drap,
      required this.years,
      required this.image,
      required this.name_car,
      required this.price_day,
      required this.catgory});

  factory carmode.fromJson(Map<String, dynamic> json) {
    return carmode(
      id: json['id'],
      drap: json['drap'],
      years: json['years'],
      price_day: json['price_day'],
      name_car: json['name_car'],
      image: json['image'],
      catgory: json['catgory'],
    );
  }
}
