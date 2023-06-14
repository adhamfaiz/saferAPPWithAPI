
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class RoomsPage extends StatefulWidget {
  final int hotelId;
  RoomsPage({required this.hotelId});

  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  List<Room> rooms = [];

  Future<void> getRooms() async {
    
var response = await http.get(Uri.parse("http://192.168.43.248:8080/api/hotels/${widget.hotelId}/rooms"));

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
      appBar: AppBar(
        title: Text("Rooms"),
      ),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
              ),
              title: Text(rooms[index].typeroom),
            ),
          );
        }
      ));
  }
 }

 class Room {
  final int id;
  final String typeroom;
  final String contentHotel;

  Room(
      {required this.id,
      required this.typeroom,
      required this.contentHotel});

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      typeroom: json['typeroom'],
      contentHotel: json['contentHotel'],
    );
  }
}