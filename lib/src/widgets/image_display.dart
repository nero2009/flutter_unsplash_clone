import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageDisplay extends StatelessWidget {
  final List images;
  ImageDisplay(this.images);

  @override
  Widget build(BuildContext context) {
    return images.isEmpty
        ? Center(child: Text('No Images'))
        : Expanded(
            child: ListView.builder(
              itemCount: images == null ? 0 : images.length,
              itemBuilder: (context, int index) {
                return buildImage(images[index]);
              },
            ),
          );
  }

  Widget buildImage(dynamic image) {
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
