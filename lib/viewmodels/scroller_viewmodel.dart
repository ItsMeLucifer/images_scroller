import 'package:flutter/cupertino.dart';
import 'package:images_scroller_assignment/models/photo.dart';
import 'package:images_scroller_assignment/services/local_service.dart';
import 'package:images_scroller_assignment/services/web_service.dart';

class ScrollerViewModel extends ChangeNotifier {
  List<Photo> _photos = [];
  List<Photo> get photos => _photos;
  set photos(List<Photo> newPhotos) {
    _photos = newPhotos;
    notifyListeners();
  }

  List<String> _likedPhotosIds = [];

  void fetchPhotosFromServer() async {
    await WebService().fetchPhotos().then((fetchedPhotos) {
      photos = fetchedPhotos;
      readLikedPhotosIdsFromSharedPreferences();
    });
  }

  void triggerPhotosLike(Photo photo) {
    photo.triggerLike();
    if (photo.liked) {
      _likedPhotosIds.add(photo.id);
    } else {
      _likedPhotosIds.remove(photo.id);
    }
    saveLikedPhotosIdsToSharedPreferences();
    notifyListeners();
  }

  void saveLikedPhotosIdsToSharedPreferences() {
    LocalService().saveLikedPhotosIds(_likedPhotosIds);
    print('\x1B[33mSaved Photos\' ids to SharedPreferences\x1B[0m');
  }

  void readLikedPhotosIdsFromSharedPreferences() async {
    await LocalService().readLikedPhotosIds().then((readedLikedPhotosIds) {
      _likedPhotosIds = readedLikedPhotosIds;
      if (_likedPhotosIds.isNotEmpty) {
        updatePhotosLikedValues();
      }
    });
    print('\x1B[33mRead Photos\' ids from SharedPreferences\x1B[0m');
  }

  void updatePhotosLikedValues() {
    for (String photoId in _likedPhotosIds) {
      _photos.firstWhere((photo) => photo.id == photoId).triggerLike();
    }
    notifyListeners();
  }
}
