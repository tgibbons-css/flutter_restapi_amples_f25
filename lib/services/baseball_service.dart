import 'package:http/http.dart' as http;
import '../data_models/baseball_teams_model.dart';

/// Gets MLB teams from the public Stats API.
Future<List<Team>> fetchTeams() async {
  final uri = Uri.parse('https://statsapi.mlb.com/api/v1/teams');
  final resp = await http.get(uri);

  if (resp.statusCode != 200) {
    throw Exception('Teams API ${resp.statusCode}');
  }
  // Your generated helper that returns a Baseball_Teams with a .teams list
  final teamsWrapper = mblTeamsFromJson(resp.body);
  return teamsWrapper.teams;
}
