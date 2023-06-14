import 'dart:math';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import '../VistCard/Payment.dart';
import '../colors/AppColor.dart';
import '../pages/drawer/drawer.dart';
import 'confimbooking.dart';

class Books extends StatefulWidget {
  final int hotelId;
   final int state;
 final int allpr;
  const Books({required this.hotelId,required this.allpr, required this.state});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  Widget headerBuild() {
    return MyDrawer();
  }

  List<car_Detels> rooms = [];

  Future<void> getRooms() async {
    var response = await http.get(Uri.parse(
        "http://192.168.43.248:8080/api/hotels/${widget.hotelId}/carmode"));

    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body) as List;
        rooms = data.map((room) => car_Detels.fromJson(room)).toList();
      });
    }
  }

  String generateBookingNumber() {
    var random = Random();
    var bookingNumber = '';
    for (var i = 0; i < 6; i++) {
      bookingNumber += random.nextInt(10).toString();
    }
    return bookingNumber;
  }

void sendNotificationToControlPanel() async {
  var url = Uri.parse('http://example.com/api/send-notification');
  var response = await http.post(url);
  if (response.statusCode == 200) {
    print('تم إرسال الإشعار بنجاح');
  } else {
    print('حدث خطأ أثناء إرسال الإشعار');
  }
}
  @override
  void initState() {
    super.initState();
    getRooms();
  }

  List<String> group = [
    'ام فلوس',
    'الكريمي',
    'وان كاش',
    'موبايل موني',
    'ارسال حواله',
    'جوالي',
  ];

  List<bool> 
  checkedItems = [false, false, false, false, false, false];
 String cont='';
 bool checked=false;
  @override
  Widget build(BuildContext context) {
     
    String generateBookingNumber() {
      var random = Random();
      var bookingNumber = '';
      for (var i = 0; i < 6; i++) {
        bookingNumber += random.nextInt(10).toString();
      }
      return bookingNumber;
    }

    return Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
            child: Scaffold(
                body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Container(
                child: ListTile(
                  leading: Icon(Icons.arrow_back),
                  trailing: Container(
                      margin: EdgeInsets.only(left: 140),
                      child: Text(
                        "تاكيد الحجز",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 20, color: AppColors.deep_orange),
                      )),
                ),
              ),
              Divider(color: Colors.blue,),
              Center(
                child: Text("تفاصيل العميل ",  style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lateef-Regular',
                               
                                fontSize: 20)),
              ),
              Divider(color: Colors.blue,),
              ListTile(
                leading: Text("اسم العميل :",  style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lateef-Regular',
                               
                                fontSize: 17)),
                title: Text("وافي اليوسفي",  style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lateef-Regular',
                               
                                fontSize: 17)),
              ),
              Divider(color: Colors.blue,),
              ListTile(
                leading: const Text("البريد الكتروني :",  style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lateef-Regular',
                               
                                fontSize: 17)),
                title: Text("wafi5639@gmail.com",  style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lateef-Regular',
                               
                                fontSize: 17)),
              ),
              Divider(color: Colors.blue,),
              const ListTile(
                leading: Text("رقم العميل :",  style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lateef-Regular',
                               
                                fontSize: 17)),
                title: Text("778067937",  style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lateef-Regular',
                               
                                fontSize: 17)),
              ),
              Divider(color: Colors.blue,),
              const ListTile(
                leading: Text("الاجمالي:",  style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lateef-Regular',
                               
                                fontSize: 17)),
                title: Text("15000",  style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lateef-Regular',
                               
                                fontSize: 17)),
              ),
              Divider(color: Colors.blue,),
              const Center(
                child: Text("تفاصيل السياره ",  style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lateef-Regular',
                               
                                fontSize: 20)),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: rooms.length,
                  itemBuilder: (context, index) {
                    return Container(
                       decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.deep_orange,
                            ),
                            
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Container(
                           child: DataTable(
                              columns: [
                                DataColumn(label: Text('اسم السياره' , style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                    
                                      fontSize: 17))),
                                DataColumn(label: Text('الموديل',  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                 
                                      fontSize: 17))),
                                DataColumn(label: Text(' السعر لليوم الواحد ',  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                  
                                      fontSize: 17))),   
                              
                                      
                                       
                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                    DataCell(Text("${rooms[index].Company_Name} ",  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                    
                                      fontSize: 17))),
                                    DataCell(Text( "${rooms[index].Car_Model}  ",  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                     
                                      fontSize: 17))),
                                    DataCell(Text("${rooms[index].price_day}",  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                     
                                      fontSize: 17))),
                                      
                                       
                                  ],
                                ),
                              ],
                            ),
                          ),
                         Container(
                          
                            child: DataTable(
                              columns: [
                               
                                   DataColumn(label: Text('مده حجز السياره',  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                  
                                      fontSize: 17))),
                                        DataColumn(label: Text('الاجمالي ',  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                  
                                      fontSize: 17))),
                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                   
                                        DataCell(Text("5",  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                     
                                      fontSize: 17))),
                                      DataCell(Text("10000",  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                     
                                      fontSize: 17))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                child: Center(
                    child: const Text(
                  "وسيله الدفع",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lateef-Regular',
                  ),
                )),
                decoration: BoxDecoration(
                    color: AppColors.deep_orange,
                    borderRadius: BorderRadius.circular(20)),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: group.length,
                itemBuilder: (context, x) {
                  return RadioListTile(
                    title: Text(group[x]),
                    groupValue: cont,
                    value:group[x],
                    onChanged: (val) {
                      setState(() {
                        cont = val!;
                      });
                    },
                  );
                },
              ),
              InkWell(
                onTap: () {
                
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingConfirmationPage(bookingId: generateBookingNumber(),paymentMethod: cont,),
                      ),
                    );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20)),
                      child: const Center(child: Text("تاكيد الحجز"))),
                  ],
                ),
              ),
            ],
          ),
        ))));
  }
}

class car_Detels {
  final int id;
  final String Company_Name;
  final String Car_Model;
  final int price_day;
  final int MAnfacturing_year;
  final int num_doors;
  final String luggage;
  final String Motion_vector;


  car_Detels({
    required this.id,
    required this.Company_Name,
    required this.Car_Model,
    required this.price_day,
    required this.num_doors,
    required this.MAnfacturing_year,
  
    required this.luggage,
    required this.Motion_vector,
   
  });

  factory car_Detels.fromJson(Map<String, dynamic> json) {
    return car_Detels(
      id: json['id'],
      num_doors: json['num_doors'],
      Company_Name: json['Company_Name'],
      price_day: json['price_day'],
      luggage: json['luggage'],
      Motion_vector: json['Motion_vector'],
      MAnfacturing_year: json['MAnfacturing_year'],
      Car_Model: json['Car_Model'],
     
    );
  }
}
