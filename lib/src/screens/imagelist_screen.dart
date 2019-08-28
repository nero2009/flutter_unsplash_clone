import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;
import '../models/image_model.dart';
import '../widgets/image_display.dart';
import '../api_key.dart';

class ImageList extends StatefulWidget {
  createState() {
    return new ImageListState();
  }
}

class ImageListState extends State<ImageList> {
  String searchQuery = '';
  List images = [];
  List data = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            searchField(),
            ImageDisplay(images),
          ],
        ));
  }

  Future<List<ImageModel>> makeRequest(query) async {
    print(query);
    print(searchQuery);

    final response = await get(
        'https://api.unsplash.com/search/photos?query=$query&client_id=$ACCESS_KEY');
    final img = json.decode(response.body);
    print(img['results']);
    setState(() {
      images = img['results'];
    });

    return images;
  }

  Widget searchField() {
    return TextField(
      onChanged: (query) {
        searchQuery = query;
        makeRequest(query);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search for anything... cats or doggos maybe'),
    );
  }
}
