import 'package:flutter/material.dart';

class ViewModeBottomSheet extends StatelessWidget {
  const ViewModeBottomSheet({super.key, required this.favMode});

  final bool favMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(
        child: Column(
          children: [
            Container(
              height: 5,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).backgroundColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Text(
                favMode ? 'お気に入りのポケモンが表示されています' : 'すべてのポケモンが表示されています',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.swap_horiz),
              title: Text(favMode ? '「すべて」表示に切り替え' : '「お気に入り」表示に切り替え'),
              subtitle:
                  Text(favMode ? '全てのポケモンが表示されます' : 'お気に入りに登録したポケモンのみが表示されます'),
              onTap: () => Navigator.pop(context, true),
            ),
            OutlinedButton(
              onPressed: () => Navigator.pop(context, false),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: const Text('キャンセル'),
            ),
          ],
        ),
      ),
    );
  }
}
