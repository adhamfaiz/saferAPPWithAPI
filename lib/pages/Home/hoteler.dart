import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:safer/pages/Home/room.dart';
class HotelsPage extends StatefulWidget {
  @override
  _HotelsPageState createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage> {
  List<Hotel> hotels = [];

  Future<void> getHotels() async {
    var response = await http.get(Uri.parse("http://192.168.43.248:8080/api/add"));
    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body) as List;
        hotels = data.map((hotel) => Hotel.fromJson(hotel)).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotels"),
      ),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
               backgroundColor: Colors.amber,
              ),
              title: Text(hotels[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RoomsPage(hotelId: hotels[index].id),
                  ),
                );
                      },
            ),
          );
        },
      ),
    );
  }
}
class Hotel {
  final int id;
  final String name;
  final String image;
  final String file_path;

  Hotel({required this.id, required this.name, required this.image, required this.file_path});

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      file_path: json['file_path'],
    );
  }
}