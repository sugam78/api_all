import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  File? image;
  final picker = ImagePicker();
  Future fetchImage()async{
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if(pickedImage!=null){
      image = File(pickedImage.path);
      setState(() {

      });
    }
    else{
      debugPrint('Error in picking image');
    }
  }
  Future<void> postImage()async{

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Image'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
          ),
        ],
      ),
    );
  }
}
