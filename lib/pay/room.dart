
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../pages/drawer/drawer.dart';

class Romm extends StatefulWidget {
  const Romm({required this.hotelId});
 final String hotelId;
  @override
  State<Romm> createState() => _RommState();
}

class _RommState extends State<Romm> {
  
  @override
    Widget headerBuild() {
    return MyDrawer();
  }

  List<detelshotel> rooms = [];

  Future<void> getRooms() async {
    var response = await http.get(Uri.parse(
        "http://192.168.43.248:8080/api/hotels/${widget.hotelId}/rooms"));

    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body) as List;
        rooms = data.map((room) => detelshotel.fromJson(room)).toList();
      });
    }
  }
  Widget build(BuildContext context) {
    return Container();
  }
}


class detelshotel {
  final int id;

  final String typeroom;
  final String price;

  detelshotel({
    required this.id,

    required this.typeroom,
    required this.price,
  });

  factory detelshotel.fromJson(Map<String, dynamic> json) {
    return detelshotel(
      id: json['id'],
      price: json['price'],
      typeroom: json['typeroom'],
    );
  }
}
