import 'package:flutter/material.dart';

class WaterHistoryItem extends StatelessWidget {
  final String time;
  final int amount;
  final VoidCallback onDelete;

  const WaterHistoryItem({
    super.key,
    required this.time,
    required this.amount,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Color(0xFFE3F2FD),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.water_drop,
              color: Colors.blue,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Eau',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '+$amount ml',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}