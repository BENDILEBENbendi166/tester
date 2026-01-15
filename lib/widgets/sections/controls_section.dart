import 'package:flutter/material.dart';

class ControlsSection extends StatelessWidget {
  final bool loading;
  final ValueChanged<bool> onLoadingChanged;
  final int itemCount;
  final ValueChanged<int> onItemCountChanged;
  final Color primaryColor;
  final String title;
  final IconData loadingIcon;
  final IconData itemCountIcon;

  const ControlsSection({
    super.key,
    required this.loading,
    required this.onLoadingChanged,
    required this.itemCount,
    required this.onItemCountChanged,
    required this.primaryColor,
    this.title = 'Interactive Controls',
    this.loadingIcon = Icons.hourglass_empty,
    this.itemCountIcon = Icons.format_list_numbered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
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
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(
                loading ? loadingIcon : Icons.check_circle,
                color: primaryColor,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Show loading skeleton',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Switch(
                value: loading,
                onChanged: onLoadingChanged,
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            children: [
              Icon(
                itemCountIcon,
                color: primaryColor,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Item count',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$itemCount',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
          Slider(
            value: itemCount.toDouble(),
            min: 1,
            max: 10,
            divisions: 9,
            label: itemCount.toString(),
            onChanged: (val) => onItemCountChanged(val.toInt()),
          ),
        ],
      ),
    );
  }
}
