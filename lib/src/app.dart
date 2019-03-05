import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import './models/image_model.dart';
import 'dart:convert';
import './widgets/image_list.dart';


class App extends StatefulWidget {
  @override
  createState() {
    return AppState();
  }
   }

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];


  void fetchImage() async {
    counter++;
    var response = await get('https://memeaday-7bb0d.firebaseio.com/$counter.json');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
    images = [imageModel];   
    });
   
      }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: (fetchImage),
        ),
        appBar: AppBar(
          title: Text("Meme A Day"),
        ),
      ),
    );
  }
}
