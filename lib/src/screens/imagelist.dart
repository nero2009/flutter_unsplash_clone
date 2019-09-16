import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;
import '../api_key.dart';

class ImageList extends StatefulWidget {
  createState() {
    return new ImageListState();
  }
}

class ImageListState extends State<ImageList> {
  List _images = [];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            _searchField(),
            _displayImage(_images),
          ],
        ));
  }

  Future<List> _makeRequest(query) async {
    final response = await get(
        'https://api.unsplash.com/search/photos?query=$query&client_id=$ACCESS_KEY');
    final img = json.decode(response.body);
    setState(() {
      _images = img['results'];
    });

    return _images;
  }

  Widget _searchField() {
    return TextField(
      onChanged: (query) {
        _makeRequest(query);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search for anything... cats or doggos maybe'),
    );
  }

  Widget _displayImage(List images) {
    return images.isEmpty
        ? Center(child: new CircularProgressIndicator())
        : Expanded(
            child: ListView.builder(
              itemCount: images == null ? 0 : images.length,
              itemBuilder: (context, int index) {
                return _buildImage(images[index]);
              },
            ),
          );
  }

  Widget _buildImage(dynamic image) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(
              image['urls']['small'],
              fit: BoxFit.fitWidth,
              height: 200.0,
            ),
            padding: EdgeInsets.only(
              bottom: 8.0,
            ),
          ),
          Text(image['description'] == null
              ? 'No description'
              : image['description']),
        ],
      ),
    );
  }
}
