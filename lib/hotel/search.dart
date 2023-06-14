import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HotelSearchPage extends StatefulWidget {
  @override
  _HotelSearchPageState createState() => _HotelSearchPageState();
}

class _HotelSearchPageState extends State<HotelSearchPage> {
  List<String> hotels = [];

  @override
  void initState() {
    super.initState();
    fetchHotels();
  }

  Future<void> fetchHotels() async {
    final response = await http.get(Uri.parse('http://192.168.43.248:8080/api/set'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<String> hotelNames = [];
      for (var hotel in data) {
        hotelNames.add(hotel['name']);
      }
      setState(() {
        hotels = hotelNames;
      });
    } else {
      print('Failed to fetch hotels');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: TypeAheadField(
            textFieldConfiguration: const TextFieldConfiguration(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'ابحث عن فندق',
              ),
            ),
            suggestionsCallback: (pattern) async {
        
              final suggestions = hotels.where((hotel) =>
                  hotel.toLowerCase().contains(pattern.toLowerCase())).toList();
              return suggestions;
            },
            itemBuilder: (context, suggestion) {
              // عرض كل فندق مقترح في القائمة
              return ListTile(
                title: Text(suggestion),
              );
            },
            onSuggestionSelected: (suggestion) {
            
              navigateToHotelDetails(suggestion);
            },
          ),
        ),
      ),
    );
  }

  void navigateToHotelDetails(String hotelName) {

    print('تم اختيار فندق: $hotelName');
  }
}
