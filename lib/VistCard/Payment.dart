import 'package:flutter/material.dart';
import 'package:safer/pages/drawer/drawer.dart';
class BookingConfirmationPage extends StatelessWidget {
  final String bookingId;
  final String paymentMethod;

  BookingConfirmationPage({required this.bookingId, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MyDrawer(),

      body:  Directionality(
        textDirection: TextDirection.rtl,

        child: ListView(
          children:[
              headerBuild(),

          Padding(

            padding: const EdgeInsets.only(top: 200),
            child: Column(
              children: [
                Center(
                  child:Container(
                    height: 190,
                    width: 200,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: IconButton(
                      onPressed: (){},
                      color:  Colors.yellow.shade700,
                      icon:Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade600,width: 3),
                            color: Colors.green.shade300,
                            borderRadius: BorderRadius.circular(150)
                        ),
                        child: const Icon(Icons.done,color: Colors.white,
                          size: 120,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text("تمت تاكيد الحجز بنجاح",
                  style: TextStyle(
                    color: Colors.yellow.shade800,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                ),
                 SizedBox(height: 20),
            Text(
              'رقم الحجز: $bookingId',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'وسيلة الدفع: $paymentMethod',
              style: TextStyle(fontSize: 16),
            ),
                Container(
                  width: 200,

                  margin: EdgeInsets.only(top: 80),
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade800,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child:InkWell (
                    onTap: (){
                       Navigator.of(context).pushReplacementNamed("home");
                    },
                    child: const Text("القائمة الرئيسية",style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "Lateef-Regular",
                    ),textAlign: TextAlign.center,),
                  ),

                )
              ],
            ),
          ),

          ],

        ),
      ),
    );
  }

  headerBuilder() {}
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

