import 'package:flutter/material.dart';
import '../widgets/sections/controls_section.dart';
import '../widgets/sections/carousel_preview_section.dart';
import '../widgets/sections/code_section.dart';

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

  static const String _codeSnippet = """PageView.builder(
  itemCount: itemCount,
  itemBuilder: (context, index) {
    if (loading) {
      return SkeletonWidget();
    } else {
      return RealItemWidget();
    }
  },
)""";

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel Demo'),
        elevation: 0,
        backgroundColor: secondaryColor,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              secondaryColor.withOpacity(0.05),
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ControlsSection(
                loading: _loading,
                onLoadingChanged: (val) => setState(() => _loading = val),
                itemCount: _itemCount,
                onItemCountChanged: (val) => setState(() => _itemCount = val),
                primaryColor: secondaryColor,
                loadingIcon: Icons.hourglass_empty,
                itemCountIcon: Icons.view_carousel,
              ),
              CarouselPreviewSection(
                loading: _loading,
                itemCount: _itemCount,
                imagePaths: _imagePaths,
                controller: _controller,
              ),
              CodeSection(
                codeSnippet: _codeSnippet,
                primaryColor: secondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
