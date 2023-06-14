
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:safer/pay/booking.dart';

import 'dart:convert';

import '../pay/addcard.dart';
import 'CarHome.dart';

class Cardetels extends StatefulWidget {
  final int hotelId;
  const Cardetels({required this.hotelId});

  @override
  State<Cardetels> createState() => _CardetelsState();
}

class _CardetelsState extends State<Cardetels> {
  List<car> rooms = [];
  Future<void> getRooms() async {
    var response = await http.get(Uri.parse(
        "http://192.168.43.248:8080/api/hotels/${widget.hotelId}/carmode"));

    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body) as List;
        rooms = data.map((room) => car.fromJson(room)).toList();
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                                      image: AssetImage( "assets/images/hotel2.jpg")),
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 250),
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                top: 340,
                              ),
                              padding: EdgeInsets.only(top: 40),
                              height: 440,
                              width: mdw,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListView(
                              
                                  children: [
                                    Text(
                                      "مواصفات السياره",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Lateef-Regular',
                                          color:
                                              Color.fromARGB(255, 255, 189, 7),
                                          fontSize: 25),
                                    ),
                                    MyWidget(
                                        txt: "اسم السياره   ",
                                        txt1: "${rooms[index].name_car} "),
                                    MyWidget(
                                        txt: "الموديل",
                                        txt1: "${rooms[index].Car_Model} "),
                                    MyWidget(
                                        txt: "سنه الصنع",
                                        txt1: '${rooms[index].years}'),
                                    MyWidget(
                                        txt: "عدد الابواب",
                                        txt1: "${rooms[index].num_doors} "),
                                         MyWidget(
                                        txt: " الامتعه",
                                        txt1: "${rooms[index].luggage} "),
                                    MyWidget(
                                      txt: "السعر",
                                      txt1: '${rooms[index].price_day}',
                                    ),
                                    Container(
                                        width: mdw / 5,
                                        height: 30,
                                        margin: const EdgeInsets.only(right: 270,bottom: 50),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: InkWell(
                                          onTap: () {
                                           Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Books(
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
                                          ),
                                        )
                                  ]),
                            ),
                              Container(
                              margin: EdgeInsets.only(top: 440, right: 200),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: selectStartDate,
                                    child: const Text(
                                      'من',
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
                                      "الى",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 167, 166, 165),
                                          fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'مده حجز السياره: $stayDuration أيام',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 167, 166, 165),
                                        fontSize: 15),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    ' الاجمالي: ${totalPrice=rooms[index].price_day * stayDuration} ريال',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 167, 166, 165),
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            )])),
                            Container(
                              margin: EdgeInsets.only(top: 300),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                // ignore: prefer_const_literals_to_create_immutables
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
                              margin: EdgeInsets.only(top: 50, right: 290),
                              child: const Buttonback(
                                buttontxt: "رجوع",
                                buttoncolor: Color.fromARGB(255, 170, 170, 170),
                              ))
                        ],
                      ),
                    );
                  }))),
    );
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

class car {
  final int id;
    final int drap;
  final int years;
  final String name_car;
  final String Car_Model;
  final int price_day;
  final int MAnfacturing_year;
  final int num_doors;
  final String luggage;
  final String Motion_vector;
  final String catgory;


  car({
    required this.id,
     required this.drap,
      required this.years,
    required this.name_car,
    required this.Car_Model,
    required this.price_day,
    required this.num_doors,
    required this.MAnfacturing_year,
    required this.luggage,
    required this.Motion_vector,
    required this.catgory
   
  });

  factory car.fromJson(Map<String, dynamic> json) {
    return car(
      id: json['id'],
       drap: json['drap'],
      years: json['years'],
      num_doors: json['num_doors'],
      name_car: json['name_car'],
      price_day: json['price_day'],
      luggage: json['luggage'],
      Motion_vector: json['Motion_vector'],
      MAnfacturing_year: json['MAnfacturing_year'],
      Car_Model: json['Car_Model'],
       catgory: json['catgory'],
     
    );
  }
}
