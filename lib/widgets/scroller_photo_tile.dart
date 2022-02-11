import 'package:flutter/material.dart';
import 'package:images_scroller_assignment/models/photo.dart';
import 'package:images_scroller_assignment/widgets/scroller_photo_dialog.dart';

class ScrollerPhotoTile extends StatelessWidget {
  final Photo photo;
  final Function onTap;
  const ScrollerPhotoTile(this.photo, this.onTap, {Key? key}) : super(key: key);

  void showPhotoDialog(BuildContext context) {
    showDialog(context: context, builder: (_) => ScrollerPhotoDialog(photo));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: ListTile(
        contentPadding: const EdgeInsets.only(right: 15),
        onTap: () => showPhotoDialog(context),
        leading: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
          child: Image.network(
            photo.thumbnailUrl,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(photo.title),
        trailing: GestureDetector(
          onTap: () => onTap(photo),
          child: Icon(
            Icons.thumb_up,
            color: photo.liked
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
