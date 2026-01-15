import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MoreDestinationSkeleton extends StatelessWidget {
  const MoreDestinationSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemCount: 8,
        itemBuilder: (context, index) => Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 120, color: Colors.grey[300]),
              Container(
                height: 20,
                margin: const EdgeInsets.all(8),
                color: Colors.grey[300],
              ),
              Container(
                height: 14,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
