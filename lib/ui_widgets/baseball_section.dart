import 'package:flutter/material.dart';
import '../data_models/baseball_teams_model.dart';
import '../services/baseball_service.dart' as baseball_svc;

class BaseballSection extends StatelessWidget {
  const BaseballSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Team>>(
      future: baseball_svc.fetchTeams(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting ||
            snap.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) return Center(child: Text('Error: ${snap.error}'));
        final teams = snap.data ?? const <Team>[];
        if (teams.isEmpty) return const Center(child: Text('No teams found.'));
        return ListView.separated(
          itemCount: teams.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final t = teams[i];
            return ListTile(
              title: Text(t.teamName),
              subtitle: Text(t.locationName ?? 'No location'),
            );
          },
        );
      },
    );
  }
}
