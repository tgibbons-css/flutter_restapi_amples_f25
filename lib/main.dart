import 'dart:async';
import 'package:flutter/material.dart';

import 'my_rest_api.dart';
import 'data_models/album_model.dart';
import 'data_models/pokemon_model.dart';
import 'data_models/baseball_teams_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MyRestAPI api = MyRestAPI();

  late Future<Album> futureAlbum;
  late Future<List<Team>> futureBaseballTeams;
  late Future<List<PokemonCard>> futurePokemonCardList;

  @override
  void initState() {
    super.initState();
    _loadAll();
  }

  void _loadAll() {
    futureAlbum = api.fetchAlbum();
    futureBaseballTeams = api.fetchBaseballTeams();
    futurePokemonCardList = api.fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
          actions: [
            IconButton(
              tooltip: 'Refresh',
              onPressed: () => setState(_loadAll),
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('🎵 Album', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              albumFutureBuilder(),
              const Divider(height: 32),

              const Text('⚾ Baseball Teams', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(
                height: 200, // limit height so scroll works nicely
                child: baseballTeamWidget(),
              ),
              const Divider(height: 32),

              const Text('🔥 Pokémon Cards', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: pokemonCardWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ------------------- Album -------------------

  FutureBuilder<Album> albumFutureBuilder() {
    return FutureBuilder<Album>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final album = snapshot.data;
        if (album == null) {
          return const Center(child: Text('No album found.'));
        }
        return Center(
          child: Text(
            album.title,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  // ------------------- Baseball Teams -------------------

  Widget baseballTeamWidget() {
    return FutureBuilder<List<Team>>(
      future: futureBaseballTeams,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final teams = snapshot.data ?? const <Team>[];
        if (teams.isEmpty) {
          return const Center(child: Text('No teams found.'));
        }
        return ListView.separated(
          itemCount: teams.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final team = teams[index];
            return ListTile(
              title: Text(team.teamName),
              subtitle: Text(team.locationName ?? 'No location'),
            );
          },
        );
      },
    );
  }

  // ------------------- Pokémon Cards -------------------

  Widget pokemonCardWidget() {
    return FutureBuilder<List<PokemonCard>>(
      future: futurePokemonCardList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final cards = snapshot.data ?? const <PokemonCard>[];
        if (cards.isEmpty) {
          return const Center(child: Text('No cards found.'));
        }
        return ListView.separated(
          itemCount: cards.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final card = cards[index];
            return ListTile(
              title: Text(card.name),
              subtitle: Text(card.flavorText ?? 'No flavor text'),
            );
          },
        );
      },
    );
  }
}
