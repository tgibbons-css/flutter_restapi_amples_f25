import 'package:flutter/material.dart';
import 'ui_widgets/section_title.dart';
import 'ui_widgets/album_section.dart';
import 'ui_widgets/baseball_section.dart';
import 'ui_widgets/pokemon_section.dart';
import 'ui_widgets/dog_section.dart';
import 'ui_widgets/space_news_section.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(title: const Text('Fetch Data Example')),
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: const [
            SectionTitle('🎵 Album'),
            AlbumSection(),
            Divider(height: 32),

            SectionTitle('⚾ Baseball Teams'),
            SizedBox(height: 200, child: BaseballSection()),
            Divider(height: 32),

            SectionTitle('🔥 Pokémon Cards'),
            SizedBox(height: 200, child: PokemonSection()),
            Divider(height: 32),

            SectionTitle('🐶 Dog Fact'),
            DogSection(),
            Divider(height: 32),

            SectionTitle('🛰️ Space News'),
            SizedBox(height: 300, child: SpaceNewsSection()),
          ],
        ),
      ),
    );
  }
}
