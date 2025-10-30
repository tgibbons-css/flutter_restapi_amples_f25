import 'package:flutter/material.dart';
import '../data_models/space_news_model.dart';
import '../services/space_news_service.dart' as sn_svc;

class SpaceNewsSection extends StatelessWidget {
  final int limit;
  final int offset;
  const SpaceNewsSection({super.key, this.limit = 10, this.offset = 0});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Result>>(
      future: sn_svc.fetchSpaceNews(limit: limit, offset: offset),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting ||
            snap.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) return Center(child: Text('Error: ${snap.error}'));
        final articles = snap.data ?? const <Result>[];
        if (articles.isEmpty) return const Center(child: Text('No articles found.'));
        return ListView.separated(
          itemCount: articles.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final a = articles[i];
            final summary = a.summary.trim();
            final short = summary.length > 140 ? '${summary.substring(0, 140)}…' : summary;
            return ListTile(
              leading: const Icon(Icons.public),
              title: Text(a.title),
              subtitle: Text('${a.newsSite} • ${a.publishedAt.toLocal().toString().split(".").first}\n$short'),
              isThreeLine: true,
            );
          },
        );
      },
    );
  }
}
