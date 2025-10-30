import 'package:flutter/material.dart';
import '../data_models/pokemon_model.dart';
import '../services/pokemon_service.dart' as poke_svc;

class PokemonSection extends StatelessWidget {
  final String query; // e.g., 'name:fire'
  const PokemonSection({super.key, this.query = 'name:fire'});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonCard>>(
      future: poke_svc.fetchPokemon(query: query),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting ||
            snap.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) return Center(child: Text('Error: ${snap.error}'));
        final cards = snap.data ?? const <PokemonCard>[];
        if (cards.isEmpty) return const Center(child: Text('No cards found.'));
        return ListView.separated(
          itemCount: cards.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final c = cards[i];
            return ListTile(
              title: Text(c.name),
              subtitle: Text(c.flavorText ?? 'No flavor text'),
            );
          },
        );
      },
    );
  }
}
