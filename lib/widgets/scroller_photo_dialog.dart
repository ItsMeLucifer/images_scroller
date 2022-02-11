import 'package:flutter/material.dart';
import 'package:images_scroller_assignment/models/photo.dart';

class ScrollerPhotoDialog extends StatelessWidget {
  final Photo photo;
  const ScrollerPhotoDialog(this.photo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Image.network(photo.url)),
      ],
    );
  }
}
