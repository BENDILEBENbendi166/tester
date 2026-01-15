import 'package:flutter/material.dart';
import '../widgets/skeletons/carousel_skeleton.dart';

class CarouselDemoPage extends StatefulWidget {
  const CarouselDemoPage({super.key});

  @override
  State<CarouselDemoPage> createState() => _CarouselDemoPageState();
}

class _CarouselDemoPageState extends State<CarouselDemoPage> {
  bool _loading = true;
  int _itemCount = 5;
  final PageController _controller = PageController();

  // List of asset image paths
  final List<String> _imagePaths = List.generate(
    6,
    (i) => 'assets/images/c_${i + 1}.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carousel Demo')),
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
            AspectRatio(
              aspectRatio: 16 / 9,
              child: _loading
                  ? const CarouselSkeleton()
                  : PageView.builder(
                      controller: _controller,
                      itemCount: _itemCount,
                      itemBuilder: (context, index) {
                        final imgPath = _imagePaths[index % _imagePaths.length];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 16,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(imgPath, fit: BoxFit.cover),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  color: Colors.black54,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    'Carousel item #${index + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
PageView.builder(
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
