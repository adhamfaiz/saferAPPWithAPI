import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:safer/hotel/search.dart';
import 'package:safer/pages/Home/Homethree.dart';
import 'package:safer/pages/Home/Hometow.dart';
import 'dart:convert';
import '../../colors/AppColor.dart';
// ignore: depend_on_referenced_packages
import 'package:buttons_tabbar/buttons_tabbar.dart';

import '../../mybutton/vistDetels.dart';
import '../drawer/drawer.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget headerBuild() {
    return drwer();
  }

  final GlobalKey<ScaffoldState> _keyDrawer = GlobalKey<ScaffoldState>();
  List<Popular> torestes = [];

  Future<void> getHotels() async {
    var response =
        await http.get(Uri.parse("http://192.168.43.248:8080/api/torest"));
    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body) as List;
        torestes = data.map((torests) => Popular.fromJson(torests)).toList();
      });
    }
  }
  @override
  void initState() {
    super.initState();
    getHotels();
  }

  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Expanded(
              child: Container(
                height: 170,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: torestes.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                  offset: Offset(4, 10),
                                  blurRadius: 10,
                                  color: Colors.white,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/11.jpg"))),
                          child: Container(
                            margin: EdgeInsets.only(top: 90, right: 10),
                            child: Text(
                              torestes[index].name_TouristPlaces,
                              style: TextStyle(
                                  color: AppColors.deep_orange,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lateef-Regular',
                                  fontSize: 20),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 120, right: 10),
                          child: Text(
                            torestes[index].address,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lateef-Regular',
                                fontSize: 14),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text("الترشيحات",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lateef-Regular',
                    color: AppColors.deep_orange,
                    fontSize: 30)),
          ),
          Container(
            height: 900,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: torestes.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.orange.shade700, width: 1),
                      ),
                      child: Row(
                        children: [
                          // images section
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed("myhome");
                            },
                            child: Container(
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.orange, width: 1),
                                  color: Colors.yellow.shade700,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("assets/images/11.jpg"))),
                            ),
                          ),
                          // text Container
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Stack(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: 70, bottom: 70),
                                    child: Text(
                                      torestes[index].name_TouristPlaces,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lateef-Regular',
                                        color: AppColors.deep_orange,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 13),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 10),
                                    child: Text(
                                      torestes[index].description,
                                      style: const TextStyle(
                                        fontFamily: 'Lateef-Regular',
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 60, right: 200),
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.yellow.shade700,
                                        border: Border.all(
                                            color: Colors.yellow.shade700),
                                        borderRadius: BorderRadius.circular(10),
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
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 70, right: 60),
                                    child: InkWell(
                                      child: Text(
                                        "المزيد من التفاصيل",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Lateef-Regular',
                                          color:
                                              Color.fromRGBO(255, 146, 57, 1),
                                          fontSize: 15,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Myhome(
                                                hotelId: torestes[index].id),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class drwer extends StatelessWidget {
  drwer({super.key});
  Widget headerBuild() {
    return drwer();
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyDrawer()));
                },
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
                onPressed: () {
                 HotelSearchPage();
                },
              )),
        ],
      ),
    );
  }
}

class Homes extends StatefulWidget {
  const Homes({super.key});

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  Widget headerBuild() {
    return drwer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              headerBuild(),
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          child: ButtonsTabBar(
                              splashColor: AppColors.deep_orange,
                              unselectedBackgroundColor: Colors.white,
                              backgroundColor: Colors.white,
                              borderColor: Color.fromARGB(185, 219, 255, 59),
                              unselectedBorderColor: AppColors.deep_orange,
                              borderWidth: 1,
                              radius: 20,
                              elevation: 6,
                              height: 50,
                              contentPadding:
                                  EdgeInsets.only(left: 38, right: 40),
                              tabs: [
                                Tab(
                                  child: Text(
                                    "الرئج",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.deep_orange,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "اثري",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.deep_orange,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "سياحي",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.deep_orange,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Expanded(
                            child: TabBarView(
                          children: [HomeTow(), HomeThree(), Home()],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Popular {
  final int id;
  final String description;
  final String address;
  // ignore: non_constant_identifier_names
  final String name_TouristPlaces;

  // ignore: non_constant_identifier_names
  Popular(
      {required this.id,
      required this.description,
      required this.address,
      required this.name_TouristPlaces});

  factory Popular.fromJson(Map<String, dynamic> json) {
    return Popular(
      id: json['id'],
      description: json['description'],
      address: json['address'],
      name_TouristPlaces: json['name_TouristPlaces'],
    );
  }
}
