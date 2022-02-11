import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  void saveLikedPhotosIds(List<String> likedPhotosIds) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('likedPhotosIds', likedPhotosIds);
  }

  Future<List<String>> readLikedPhotosIds() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> result = prefs.getStringList('likedPhotosIds') ?? [];
    result.sort((a, b) => int.parse(a).compareTo(int.parse(b)));
    return result;
  }
}
