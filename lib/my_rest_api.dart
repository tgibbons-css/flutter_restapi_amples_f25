
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data_models/album_model.dart';
import 'data_models/pokemon_model.dart';
import 'data_models/baseball_teams_model.dart';

class MyRestAPI{

  Future<List<Team>> fetchBaseballTeams() async {
    final response = await http
        .get(Uri.parse('https://statsapi.mlb.com/api/v1/teams'));
    //print("Response = "+response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //print("Parsing team data");
      Baseball_Teams list = mblTeamsFromJson(response.body);
      //Baseball_Teams list = Baseball_Teams.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      //print("list copyright = "+list.copyright);
      //print("list size = "+list.teams.length.toString());
      return list.teams;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //print("Team Response Error "+response.statusCode.toString());
      throw Exception('Failed to load teams');
    }
  }

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<List<PokemonCard>> fetchPokemon() async {
    // Corrected query syntax: q=name:fire
    final url = Uri.parse('https://api.pokemontcg.io/v2/cards?q=name:fire');

    // Your API key (hardcoded for now)
    const apiKey = '821beae9-09ea-460c-a4e6-868e492172c6';

    // Include header with key
    final response = await http.get(
      url,
      headers: {'X-Api-Key': apiKey},
    );

    if (response.statusCode == 200) {
      print('fetchPokemon - ${response.body}');
      final list = cardListFromJson(response.body);
      return list.cardList;
    } else {
      throw Exception('Failed to load Pokémon cards');
    }
  }


}
