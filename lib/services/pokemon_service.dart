import 'package:http/http.dart' as http;
import '../data_models/pokemon_model.dart';

const _apiKey = '821beae9-09ea-460c-a4e6-868e492172c6';

/// Fetch Pokémon cards using a simple search query (e.g., 'name:fire').
/// Default keeps your current demo working.
Future<List<PokemonCard>> fetchPokemon({String query = 'name:fire'}) async {
  // Build URL with query parameter so special chars (like ':') are encoded correctly.
  final uri = Uri.https(
    'api.pokemontcg.io',
    '/v2/cards',
    {'q': query},
  );

  final resp = await http.get(
    uri,
    headers: {'X-Api-Key': _apiKey},
  );

  if (resp.statusCode != 200) {
    throw Exception('Failed to load Pokémon cards (HTTP ${resp.statusCode})');
  }

  final parsed = cardListFromJson(resp.body);
  return parsed.cardList;
}
