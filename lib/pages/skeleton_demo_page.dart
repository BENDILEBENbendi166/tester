import 'package:flutter/material.dart';
import '../widgets/skeletons/now_playing_skeleton.dart';

class SkeletonDemoPage extends StatefulWidget {
  const SkeletonDemoPage({super.key});

  @override
  State<SkeletonDemoPage> createState() => _SkeletonDemoPageState();
}

class _SkeletonDemoPageState extends State<SkeletonDemoPage> {
  bool _loading = true;
  int _itemCount = 3;

  // List of asset image paths
  final List<String> _imagePaths = List.generate(
    6,
    (i) => 'assets/images/c_${i + 1}.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skeleton Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Show loading skeleton'),
                Switch(
                  value: _loading,
                  onChanged: (val) => setState(() => _loading = val),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Item count:'),
                Slider(
                  value: _itemCount.toDouble(),
                  min: 1,
                  max: 10,
                  divisions: 9,
                  label: _itemCount.toString(),
                  onChanged: (val) => setState(() => _itemCount = val.toInt()),
                ),
                Text('$_itemCount'),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _loading
                  ? NowPlayingSkeleton(itemCount: _itemCount)
                  : ListView.builder(
                      itemCount: _itemCount,
                      itemBuilder: (context, index) {
                        final imgPath = _imagePaths[index % _imagePaths.length];
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              imgPath,
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text('Loaded item #${index + 1}'),
                        );
                      },
                    ),
            ),
            const Divider(),
            const Text('How to use:'),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(12),
              color: Colors.grey[200],
              child: const SelectableText("""
ListView.builder(
  itemCount: itemCount,
  itemBuilder: (context, index) {
    if (loading) {
      return SkeletonWidget();
    } else {
      return RealItemWidget();
    }
  },
)
"""),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.copy),
                label: const Text('Copy code'),
                onPressed: () {
                  // TODO: Implement copy to clipboard
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Code copied!')));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
