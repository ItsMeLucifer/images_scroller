import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:images_scroller_assignment/main.dart';
import 'package:images_scroller_assignment/widgets/scroller_photo_tile.dart';

class Scroller extends ConsumerWidget {
  const Scroller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollerVM = ref.watch(scrollerProvider);
    return ListView.builder(
        itemCount: scrollerVM.photos.length,
        itemBuilder: (_, index) {
          return ScrollerPhotoTile(
            scrollerVM.photos[index],
            scrollerVM.triggerPhotosLike,
          );
        });
  }
}
