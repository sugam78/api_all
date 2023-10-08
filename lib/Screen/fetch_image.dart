import 'dart:convert';
import 'package:api_all/Models/ImageModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchImage extends StatefulWidget {
  const FetchImage({super.key});

  @override
  State<FetchImage> createState() => _FetchImageState();
}

class _FetchImageState extends State<FetchImage> {
  List<ImageModel> image = [];
  Future<List<ImageModel>> fetchData()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        image.add(ImageModel.fromJson(i));
      }
      return image;
    }
    else{
      return image;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: fetchData(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: image.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Text(image[index].url.toString()),
                      ],
                    );
                  });
            }
            else{
              return CircularProgressIndicator();
            }
    },
      ),
          )],
      ),
    );
  }
}
