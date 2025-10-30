import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data_models/album_model.dart';

/// Downloads a sample album and parses it to an Album model.
Future<Album> fetchAlbum() async {
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
  final resp = await http.get(uri);

  if (resp.statusCode != 200) {
    throw Exception('Album API ${resp.statusCode}');
  }
  final map = jsonDecode(resp.body) as Map<String, dynamic>;
  return Album.fromJson(map);
}
