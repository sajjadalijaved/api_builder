import 'package:api_builder/modals/albums.dart';
import 'package:api_builder/repository/album_api.dart';

class Repository {
  final _ablumApiServices = AlbumApiServices();
  Future<List<Album>> fetchAlbums() async {
    return await _ablumApiServices.fetchAblums();
  }
}
