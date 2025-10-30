import 'package:flutter/material.dart';
import '../data_models/dog_fact_model.dart';
import '../services/dog_service.dart' as dog_svc;

class DogSection extends StatelessWidget {
  const DogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DogFact>(
      future: dog_svc.fetchDogFact(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting ||
            snap.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) return Center(child: Text('Error: ${snap.error}'));
        final fact = snap.data;
        if (fact == null || fact.facts.isEmpty) {
          return const Center(child: Text('No dog fact found.'));
        }
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              fact.facts.first,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        );
      },
    );
  }
}
