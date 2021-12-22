// ignore_for_file: prefer_const_declarations, file_names, unnecessary_new, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

Future<List<Data>> fetchData() async {
  final response = await http.get(
    'https://jsonplaceholder.typicode.com/todos',
  );

  if (response.statusCode == 200) {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    List jsonResponse = json.decode(response.body);
    // localStorage.setString('DataApi', json.decode(response.body));
    // print(jsonResponse);
    return jsonResponse.map((data) => new Data.fromJson(data)).toList();
  } else {
    throw Exception('Error');
  }
}

class Data {
  final int id;
  final String title;

  Data({this.id, this.title});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
    );
  }
}
