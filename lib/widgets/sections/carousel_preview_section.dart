import 'package:flutter/material.dart';
import '../skeletons/carousel_skeleton.dart';

class CarouselPreviewSection extends StatelessWidget {
  final bool loading;
  final int itemCount;
  final List<String> imagePaths;
  final PageController controller;

  const CarouselPreviewSection({
    super.key,
    required this.loading,
    required this.itemCount,
    required this.imagePaths,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return loading
        ? const CarouselSkeleton()
        : SizedBox(
            height: 250,
            child: PageView.builder(
              controller: controller,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                final imgPath = imagePaths[index % imagePaths.length];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    elevation: 4,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      imgPath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade300,
                          child: Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 48,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          );
  }
}
