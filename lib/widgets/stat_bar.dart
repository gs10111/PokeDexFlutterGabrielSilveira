import 'package:material_ui/material_ui.dart';

/// Uma linha da seção "Status base": rótulo, valor e barra de progresso.
class StatBar extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  /// Maior valor base possível de um status (usado para calcular a barra).
  static const int maxValue = 255;

  const StatBar({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              '$value',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: value / maxValue,
                minHeight: 8,
                color: color,
                backgroundColor: color.withValues(alpha: 0.15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
