import 'package:flutter/material.dart';
import '../skeletons/now_playing_skeleton.dart';

class SkeletonPreviewSection extends StatelessWidget {
  final bool loading;
  final int itemCount;
  final List<String> imagePaths;

  const SkeletonPreviewSection({
    super.key,
    required this.loading,
    required this.itemCount,
    required this.imagePaths,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preview',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: loading
                  ? NowPlayingSkeleton(itemCount: itemCount)
                  : ListView.builder(
                      itemCount: itemCount,
                      itemBuilder: (context, index) {
                        final imgPath = imagePaths[index % imagePaths.length];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          elevation: 1,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                imgPath,
                                width: 60,
                                height: 60,
                              ),
                            ),
                            title: Text('Item ${index + 1}'),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
