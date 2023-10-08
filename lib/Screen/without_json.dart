import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WIthoutJsonScreen extends StatefulWidget {
  const WIthoutJsonScreen({super.key});

  @override
  State<WIthoutJsonScreen> createState() => _WIthoutJsonScreenState();
}

class _WIthoutJsonScreenState extends State<WIthoutJsonScreen> {
  var data;
  Future<void> fetchData()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if(response.statusCode==200){
      data = jsonDecode(response.body.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Without Json'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: fetchData(),
                builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              else{
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context,index){
                  return Card(
                    child: Column(
                      children: [
                        Text(data[index]['id'].toString()),
                      ],
                    ),
                  );
                });
              }

            }),
          )
        ],
      ),
    );
  }
}
