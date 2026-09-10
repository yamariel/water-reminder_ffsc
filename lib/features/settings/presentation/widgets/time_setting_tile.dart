import 'package:flutter/material.dart';

class TimeSettingTile extends StatelessWidget {
  const TimeSettingTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.time,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final TimeOfDay time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 23),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge
                    ?.copyWith(fontSize: 14),
              ),
            ),
            Text(
              _formatFrenchTime(time),
              style: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatFrenchTime(TimeOfDay time) {
  final hour = time.hour.toString().padLeft(2, '0');
  final minute = time.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}
