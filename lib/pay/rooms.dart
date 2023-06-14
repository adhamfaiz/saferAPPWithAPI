import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل الحجز'),
      ),
      body: 
        ListView(
          children: [
            Expanded(
              child: Container(
               
                child: DataTable(
                
                  columns: [
                    DataColumn(label: Text('رقم الغرفة')),
                    DataColumn(label: Text('عدد الأسرة')),
                    DataColumn(label: Text('السعر')),
              
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(Text('101')),
                        DataCell(Text('2')),
                        DataCell(Text('200')),
                     
                      ],
                    ),
                  
                  ],
                ),
              ),
            ),
          ],
        ),
      
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BookingPage(),
  ));
}
