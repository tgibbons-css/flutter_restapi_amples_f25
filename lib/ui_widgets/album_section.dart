import 'package:flutter/material.dart';
import '../data_models/album_model.dart';
import '../services/album_service.dart' as album_svc;

class AlbumSection extends StatelessWidget {
  const AlbumSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album>(
      future: album_svc.fetchAlbum(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting ||
            snap.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) return Center(child: Text('Error: ${snap.error}'));
        final album = snap.data;
        if (album == null) return const Center(child: Text('No album found.'));
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
}
