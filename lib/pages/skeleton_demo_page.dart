import 'package:flutter/material.dart';
import '../widgets/sections/controls_section.dart';
import '../widgets/sections/skeleton_preview_section.dart';
import '../widgets/sections/code_section.dart';

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

  static const String _codeSnippet = """ListView.builder(
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
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Skeleton Demo'),
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor.withOpacity(0.05),
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: Column(
          children: [
            ControlsSection(
              loading: _loading,
              onLoadingChanged: (val) => setState(() => _loading = val),
              itemCount: _itemCount,
              onItemCountChanged: (val) => setState(() => _itemCount = val),
              primaryColor: primaryColor,
            ),
            SkeletonPreviewSection(
              loading: _loading,
              itemCount: _itemCount,
              imagePaths: _imagePaths,
            ),
            CodeSection(
              codeSnippet: _codeSnippet,
              primaryColor: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
