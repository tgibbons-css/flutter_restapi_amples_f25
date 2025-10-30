import 'package:http/http.dart' as http;
import '../data_models/dog_fact_model.dart';

/// Fetches a single DogFact payload (facts list + success flag).
Future<DogFact> fetchDogFact() async {
  final uri = Uri.parse('https://dogapi.dog/api/facts');
  final resp = await http.get(uri);

  if (resp.statusCode != 200) {
    throw Exception('Dog API ${resp.statusCode}');
  }
  return dogFactFromJson(resp.body);
}
