import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../pay/addcard.dart';

class Hoteldetels extends StatefulWidget {
  
  final int hotelId;
  const Hoteldetels({required this.hotelId});

  @override
  State<Hoteldetels> createState() => _HoteldetelsState();
}

class _HoteldetelsState extends State<Hoteldetels> {
  
  List<detelshotel> rooms = [];
  Future<void> getRooms() async {
    var response = await http.get(Uri.parse(
        "http://192.168.43.248:8080/api/hotels/${widget.hotelId}/hoteldetels"));

    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body) as List;
        rooms = data.map((room) => detelshotel.fromJson(room)).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getRooms();
  }

  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  int roomPricePerNight = 100;
  int totalPrice = 0;
  int roomPrice = 0;
  int stayDuration = 0;
  int totalCost = 0;
  void selectStartDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2023, 12, 31),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedStartDate = value;
          calculateStayDuration();
        });
      }
    });
  }

  void selectEndDate() {
    showDatePicker(
      context: context,
      initialDate:
          selectedStartDate != null ? selectedStartDate! : DateTime.now(),
      firstDate:
          selectedStartDate != null ? selectedStartDate! : DateTime.now(),
      lastDate:
          DateTime(2023, 12, 31), // تعديل التاريخ الأخير هنا بحسب احتياجاتك
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedEndDate = value;
          calculateStayDuration();
        });
      }
    });
  }

  void calculateStayDuration() {
    if (selectedStartDate != null && selectedEndDate != null) {
      final difference = selectedEndDate!.difference(selectedStartDate!);
      stayDuration =
          difference.inDays + 1; // يتم إضافة 1 لأن اليوم الأخير مشمول أيضًا
      totalCost = stayDuration * roomPricePerNight; // حساب الاجمالي
    }
  }

  @override
  Widget build(BuildContext context) {
    var room = '';
    var mdw = MediaQuery.of(context).size.width;
    return 
      Scaffold(
          backgroundColor: Colors.white70,
          body: SafeArea(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: rooms.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: mdw,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                              child: Stack(children: [
                            Container(
                                height: 400,
                                width: mdw,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/hotel2.jpg")),
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 250),
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                top: 340,
                              ),
                              padding: EdgeInsets.only(top: 40),
                              height: 400,
                              width: mdw,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "مواصفات الغرفه",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Lateef-Regular',
                                          color:
                                              Color.fromARGB(255, 255, 189, 7),
                                          fontSize: 25),
                                    ),
                                    MyWidget(
                                        txt: "رقم الغرفه   ",
                                        txt1: "${rooms[index].numRoom} "),
                                    MyWidget(
                                        txt: "الطابق",
                                        txt1: "${rooms[index].floor} "),
                                    MyWidget(
                                        txt: "نوع الغرف",
                                        txt1: rooms[index].typeroom),
                                    MyWidget(
                                        txt: "عدد الاسره",
                                        txt1: "${rooms[index].numFmaily} "),
                                    MyWidget(
                                      txt: "السعر",
                                      txt1: '${rooms[index].price}',
                                    ),
                                    Container(
                                        width: mdw / 5,
                                        height: 30,
                                        margin: EdgeInsets.only(
                                          right: 270,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: InkWell(
                                          onTap: () {
                                           Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Book(
                                            hotelId: rooms[index].id,allpr:totalPrice,state:stayDuration ,),
                                      ),
                                    );
                                          },
                                          child: Text(
                                            "احجز",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  ]),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 300),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  image(
                                    img: "assets/images/hotel2.jpg",
                                  ),
                                  image(
                                    img: "assets/images/hotel2.jpg",
                                  ),
                                  image(
                                    img: "assets/images/hotel2.jpg",
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 440, right: 200),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: selectStartDate,
                                    child: const Text(
                                      'اختر تاريخ بديه الحجز',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 167, 166, 165),
                                          fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: selectEndDate,
                                    child: const Text(
                                      "اختر تاريخ نهايه الحجز",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 167, 166, 165),
                                          fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'مدة الإقامة: $stayDuration أيام',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 167, 166, 165),
                                        fontSize: 15),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    ' الاجمالي: ${totalPrice=rooms[index].price * stayDuration} ريال',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 167, 166, 165),
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ])),
                          Container(
                              margin: EdgeInsets.only(top: 90, right: 290),
                              child: Buttonback(
                                buttontxt: "رجوع",
                                buttoncolor: Color.fromARGB(255, 170, 170, 170),
                                iconbutton: Icons.arrow_right,
                              ))
                        ],
                      ),
                    );
                  })));
    
  }
}

class MyWidget extends StatelessWidget {
  final txt;
  final txt1;
  final txt2;
  final Number;
  final txt3;
  final star;
  const MyWidget(
      {super.key,
      this.txt2,
      this.txt,
      this.txt3,
      this.Number,
      this.star,
      this.txt1});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 220,
      ),
      child: ListTile(
          leading: Text(
            txt,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 167, 166, 165),
                fontSize: 15),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Text(txt1), Icon(star)],
          )),
    );
  }
}

// ignore: camel_case_types
class image extends StatelessWidget {
  final img;
  const image({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 120,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 252, 251, 246),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("$img"),
        ),
      ),
    );
  }
}

class Buttonback extends StatelessWidget {
  final buttontxt;
  final onpres;
  final iconbutton;
  final buttoncolor;
  const Buttonback(
      {super.key,
      this.buttontxt,
      this.onpres,
      this.iconbutton,
      this.buttoncolor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onpres();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            buttontxt,
            style: TextStyle(color: buttoncolor, fontSize: 15),
          ),
          SizedBox(width: 5),
          Icon(
            iconbutton,
            color: Colors.black,
          ),
        ],
      ),
      height: 40,
      minWidth: 20,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

class detelshotel {
  final int id;
  final String numRoom;
  final String typeroom;
  final int floor;
  final int price;
  final int numFmaily;
  final String imgroomone;
  final String imgroomtow;
  final String imgroomthree;
  final String imgroomfour;

  detelshotel({
    required this.id,
    required this.price,
    required this.numRoom,
    required this.typeroom,
    required this.numFmaily,
    required this.floor,
    required this.imgroomone,
    required this.imgroomtow,
    required this.imgroomthree,
    required this.imgroomfour,
  });

  factory detelshotel.fromJson(Map<String, dynamic> json) {
    return detelshotel(
      id: json['id'],
      numFmaily: json['numFmaily'],
      numRoom: json['numRoom'],
      floor: json['floor'],
      price: json['price'],
      typeroom: json['typeroom'],
      imgroomone: json['imgroomone'],
      imgroomtow: json['imgroomtow'],
      imgroomthree: json['imgroomthree'],
      imgroomfour: json['imgroomfour'],
    );
  }
}
