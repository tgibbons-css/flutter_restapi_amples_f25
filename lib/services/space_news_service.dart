import 'package:http/http.dart' as http;
import '../data_models/space_news_model.dart';

/// Fetches a page of Spaceflight News articles (v4 API).
/// Returns just the `results` list to keep the UI simple.
Future<List<Result>> fetchSpaceNews({int limit = 10, int offset = 0}) async {
  final uri = Uri.https(
    'api.spaceflightnewsapi.net',
    '/v4/articles/',
    {'limit': '$limit', 'offset': '$offset'},
  );

  final resp = await http.get(uri);
  if (resp.statusCode != 200) {
    throw Exception('Space News API ${resp.statusCode}');
  }

  final payload = spaceNewsFromJson(resp.body);
  return payload.results;
}
