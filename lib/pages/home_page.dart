import 'package:flutter/material.dart';
import '../widgets/common/demo_card.dart';
import '../widgets/common/app_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.secondaryContainer,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppHeader(
                title: 'Skeleton Demo',
                subtitle: 'Beautiful loading states showcase',
                icon: Icons.widgets_rounded,
              ),
              // Demo cards
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  children: [
                    DemoCard(
                      icon: Icons.view_list_rounded,
                      title: 'Skeleton Demo',
                      description:
                          'Showcase skeleton loading states with interactive controls',
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.primaryContainer,
                        ],
                      ),
                      onTap: () => WidgetsBinding.instance.addPostFrameCallback(
                        (_) => Navigator.pushNamed(context, '/skeleton'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DemoCard(
                      icon: Icons.view_carousel_rounded,
                      title: 'Carousel Demo',
                      description:
                          'Showcase carousel with skeleton loading animation',
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.secondaryContainer,
                        ],
                      ),
                      onTap: () => WidgetsBinding.instance.addPostFrameCallback(
                        (_) => Navigator.pushNamed(context, '/carousel'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
