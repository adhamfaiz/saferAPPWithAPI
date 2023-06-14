import 'dart:developer';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import '../colors/AppColor.dart';
import '../pages/Home/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Montion extends StatefulWidget {
  final int hotelId;
  const Montion({required this.hotelId});

  @override
  State<Montion> createState() => _MontionState();
}

class _MontionState extends State<Montion> {
  List<montionTouristPlaces> montionTourist = [];

  Future<void> getRooms() async {
    var response = await http.get(Uri.parse(
        "http://192.168.43.248:8080/api/hotels/${widget.hotelId}/artisan"));

    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body) as List;
        montionTourist = data
            .map((montion) => montionTouristPlaces.fromJson(montion))
            .toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Color.fromARGB(221, 255, 255, 255),
          body: SafeArea(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: montionTourist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                            child: Stack(children: [
                          Container(
                            height: 400,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/images/12.jpg")),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 320),
                              child: drwer(),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 250),
                              height: 420,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: DefaultTabController(
                                length: 3,
                                child: ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    children: [
                                      Container(
                                        child: ButtonsTabBar(
                                            labelSpacing: 40,
                                            buttonMargin: EdgeInsets.all(10),
                                            unselectedBackgroundColor:
                                                Colors.white,
                                            backgroundColor: Colors.white,
                                            borderColor: Color.fromARGB(
                                                185, 219, 255, 59),
                                            unselectedBorderColor:
                                                AppColors.deep_orange,
                                            borderWidth: 1,
                                            radius: 20,
                                            elevation: 6,
                                            height: 50,
                                            contentPadding: EdgeInsets.only(
                                                left: 38, right: 27),
                                            tabs: [
                                              Tab(
                                                child: Text(
                                                  "شرح",
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Tab(
                                                child: Text(
                                                  "معلومات الرحله",
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Tab(
                                                child: Text(
                                                  "الموقع",
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ]),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          height: 320,
                                          width: double.infinity,
                                          child: TabBarView(
                                            children: [
                                              Text(montionTourist[index]
                                                  .explain),
                                              Text(montionTourist[index]
                                                  .informationtrip),
                                              Text(montionTourist[index]
                                                  .location),
                                            ],
                                          ),
                                        ),
                                      )
                                    ]),
                              )),
                        ])),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed("visited");
                                },
                                child: Text(
                                  "أنطلق",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
                                ),
                                height: 40,
                                minWidth: 100,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed("visited");
                                },
                                
                          )],
                          ),
                        )
                      ],
                    );
                  })),
        ));
  }
}

class montionTouristPlaces {
  final int id;
  final String informationtrip;
  final String location;
  final String explain;

  montionTouristPlaces(
      {required this.id,
      required this.location,
      required this.informationtrip,
      required this.explain});

  factory montionTouristPlaces.fromJson(Map<String, dynamic> json) {
    return montionTouristPlaces(
      id: json['id'],
      informationtrip: json['informationtrip'],
      location: json['location'],
      explain: json['explain'],
    );
  }
}
