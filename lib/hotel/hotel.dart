import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../mybutton/mybutton.dart';
import '../pages/Home/home.dart';
import '../pay/addcard.dart';
import 'HotelDetels.dart';

class Homeroom extends StatefulWidget {
  final int hotelId;
  const Homeroom({required this.hotelId});

  @override
  State<Homeroom> createState() => _HomeroomState();
}

class _HomeroomState extends State<Homeroom> {
  List<Room> rooms = [];

  Future<void> getRooms() async {
    var response = await http.get(Uri.parse(
        "http://192.168.43.248:8080/api/hotels/${widget.hotelId}/hoteldetels"));

    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body) as List;
        rooms = data.map((room) => Room.fromJson(room)).toList();
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
    return Scaffold(
        body:
         SafeArea(
          child: Column(
        children: [
          drwer(),
          Expanded(
            child: Stack(
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: rooms.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
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
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 110,
                            child: Stack(children: [
                              Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.orange, width: 1),
                                    color: Colors.black26,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/images/hotel2.jpg",
                                        ))),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 150),
                                child: Column(
                                  children: [
                                    Text(
                                      rooms[index].typeroom,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 255, 189, 6)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "الخدمات",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  171, 172, 173, 1)),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Icon(Icons.star,
                                            color: Colors.yellow, size: 13),
                                        Icon(Icons.star,
                                            color: Colors.yellow, size: 13),
                                        Icon(Icons.star,
                                            color: Colors.yellow, size: 13),
                                        Icon(Icons.star,
                                            color: Colors.yellow, size: 13),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'عددالاسره',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  171, 172, 173, 1)),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Text("${rooms[index].numFmaily}")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    right: 330, top: 10, bottom: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 50,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                171, 172, 173, 1),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Text(
                                          '${rooms[index].price}',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                    Container(
                                      width: 50,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    "addcard");
                                          },
                                          child: const Text(
                                            "حجز",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(
                                      right: 150, top: 55),
                                  width: 130,
                                  child: const Divider(
                                    color: Color.fromRGBO(171, 172, 173, 1),
                                  )),
                              Container(
                                margin: EdgeInsets.only(right: 220, top: 80),
                                child: InkWell(
                                  child: const Text(
                                    "تفاصيل الغرف",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 255, 6, 6)),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Hoteldetels(
                                            hotelId: rooms[index].id),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ]),
                          );
                        })),
                Container(
                    margin: const EdgeInsets.only(right: 300, top: 750),
                    child: butoonrev(
                      txt: "تجاوز",
                      function: () {
                        Navigator.of(context)
                            .pushReplacementNamed("cars");
                      },
                    ))
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class Room {
  final int id;
  final int numFmaily;
  final int price;
  final String typeroom;
  final String contentHotel;

  Room(
      {required this.id,
      required this.numFmaily,
      required this.price,
      required this.typeroom,
      required this.contentHotel});

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      typeroom: json['typeroom'],
      price: json['price'],
      numFmaily: json['numFmaily'],
      contentHotel: json['contentHotel'],
    );
  }
}
