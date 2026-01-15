import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skeleton Demo Home')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ListTile(
            title: const Text('Skeleton Demo'),
            subtitle: const Text('Showcase skeleton loading states'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/skeleton');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Carousel Demo'),
            subtitle: const Text('Showcase carousel with skeleton'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/carousel');
            },
          ),
        ],
      ),
    );
  }
}
