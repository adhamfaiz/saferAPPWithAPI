import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../VistCard/Payment.dart';
import '../colors/AppColor.dart';
import '../pages/drawer/drawer.dart';
import 'confimbooking.dart';

class Book extends StatefulWidget {
  final int hotelId;
 final int state;
 final int allpr;
  const Book({required this.hotelId,required this.allpr,required this.state});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  Widget headerBuild() {
    return MyDrawer();
  }
  int price=0;
   String numroom='';
   String typeroom='';
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

  String generateBookingNumber() {
    var random = Random();
    var bookingNumber = '';
    for (var i = 0; i < 6; i++) {
      bookingNumber += random.nextInt(10).toString();
    }
    return bookingNumber;
  }

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
  Future<void> sendBookingData() async {
  final url = Uri.parse('http://192.168.173.181:8000/api/bookings'); // استبدل الرابط بنقطة النهاية API في Laravel
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({
    'username': 'وافي اليوسفي',
    'phone': typeroom,
    'email': 'wafy5639@gmail.com',
    'roomNumber': numroom,
    'allpr': widget.allpr,
    'stayDuration': widget.state,
    'pricePerNight': price,
    'num_Booking': generateBookingNumber(),
    
      
  });

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    print('تم إرسال بيانات الحجز بنجاح!');
  } else {
    print('فشل في إرسال بيانات الحجز. الرمز: ${response.statusCode}');
  }
}

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
                child: Text("تفاصيل الغرف ",  style: TextStyle(
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
                                DataColumn(label: Text('رقم الغرفة' , style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                    
                                      fontSize: 17))),
                                DataColumn(label: Text('نوع  الغرف',  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                 
                                      fontSize: 17))),
                                DataColumn(label: Text(' السعرلليله واحده',  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                  
                                      fontSize: 17))),   
                              
                                      
                                       
                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                    DataCell(Text("${numroom=rooms[index].numRoom} ",  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                    
                                      fontSize: 17))),
                                    DataCell(Text("${typeroom=rooms[index].typeroom} ",  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                     
                                      fontSize: 17))),
                                    DataCell(Text("${price=rooms[index].price} ",  style: TextStyle(
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
                               
                                   DataColumn(label: Text('مده الاقامه',  style: TextStyle(
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
                                   
                                        DataCell(Text('${widget.state}',  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lateef-Regular',
                                     
                                      fontSize: 17))),
                                      DataCell(Text('${widget.allpr}',  style: TextStyle(
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
                   sendBookingData();
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


