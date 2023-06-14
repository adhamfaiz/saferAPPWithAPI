import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import '../colors/AppColor.dart';
import '../mybutton/mybutton.dart';
import '../pages/Home/home.dart';
import 'hotel.dart';

class Visited extends StatefulWidget {
  const Visited({Key? key}) : super(key: key);

  @override
  State<Visited> createState() => _VisitedState();
}

class _VisitedState extends State<Visited> {
  List<Hotel> hotels = [];

  Future<void> getHotels() async {
    var response =
        await http.get(Uri.parse("http://192.168.43.248:8080/api/set"));
    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body) as List;
        hotels = data.map((hotel) => Hotel.fromJson(hotel)).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getHotels();
  }

  Widget headerBuild() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(1, 1),
                    ),
                    BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(-1, -1))
                  ],
                  borderRadius: BorderRadius.circular(40)),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.yellow.shade700,
                  size: 25,
                ),
                onPressed: () {},
              )),
          const Expanded(child: Text("")),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(1, 1),
                    ),
                    BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(-1, -1))
                  ],
                  borderRadius: BorderRadius.circular(40)),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.yellow.shade700,
                  size: 25,
                ),
                onPressed: () {},
              )),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _keyDrawer = GlobalKey<ScaffoldState>();

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyDrawer,
      body: 
      SafeArea(
          child: ListView(
            children: [
              drwer(),
              DefaultTabController(
                length: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text("الترشيحات",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lateef-Regular',
                              color: AppColors.deep_orange,
                              fontSize: 30)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Stack(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        child: Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: hotels.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Stack(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        margin: EdgeInsets.all(5),
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
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/images/hotel2.jpg"))),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 100, left: 60),
                                          child: Text(
                                            hotels[index].name,
                                            style: TextStyle(
                                                color: AppColors.deep_orange,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 10,
                  left: 250,
                ),
                padding: const EdgeInsets.only(left: 20, right: 10),
                decoration: const BoxDecoration(),
                child: Container(
                  child: Row(
                    children: [
                      Text("الاكثر زيارة",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lateef-Regular',
                              color: Colors.yellow.shade700,
                              fontSize: 30)),
                    ],
                  ),
                ),
              ),
              Container(
                height: 500,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: hotels.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: InkWell(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                border: Border.all(
                                    color: Colors.orange.shade700, width: 1),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(2, 10),
                                    blurRadius: 10,
                                    color: Colors.black12,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                // images section
                                Container(
                                  width: 110,
                                  height: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.orange, width: 1),
                                      color: Colors.black26,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            "assets/images/hotel2.jpg",
                                          ))),
                                ),
                                // text Container
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 50),
                                          child: Text(
                                            hotels[index].name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Lateef-Regular',
                                              color: Colors.yellow.shade700,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Stack(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 220, top: 20),
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.yellow.shade700,
                                                  border: Border.all(
                                                      color: Colors.black26,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      spreadRadius: 2,
                                                      blurRadius: 2,
                                                      offset: Offset(2, 2),
                                                    ),
                                                    BoxShadow(
                                                        color: Colors.white70,
                                                        spreadRadius: 2,
                                                        blurRadius: 2,
                                                        offset: Offset(-2, -2))
                                                  ]),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                  ),
                                                  const Text(
                                                    "4.1",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: 30, bottom: 20),
                                              child: Text(
                                                hotels[index].file_path,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Lateef-Regular',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 30, right: 70),
                                              child: InkWell(
                                                child: Text(
                                                  "أضغط لقائمه الغرف",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'Lateef-Regular',
                                                      color: Color.fromARGB(
                                                          255, 255, 6, 6)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Homeroom(hotelId: hotels[index].id),
                              ),
                            );
                          },
                        ),
                      );
                    }),
              ),
              Container(
                  margin: EdgeInsets.only(right: 300, bottom: 10),
                  child: butoonrev(
                    txt: "تجاوز",
                    function: () {
                      Navigator.of(context).pushReplacementNamed("cars");
                    },
                  ))
            ],
          ),
        ),
      );
  
  }
}

class Hotel {
  final int id;
  final String name;
  final String image;
  final String file_path;

  Hotel(
      {required this.id,
      required this.name,
      required this.image,
      required this.file_path});

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      file_path: json['file_path'],
    );
  }
}
