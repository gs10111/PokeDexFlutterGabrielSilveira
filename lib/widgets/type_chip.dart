import 'package:material_ui/material_ui.dart';

import '../theme/type_colors.dart';

/// "Etiqueta" colorida com o nome do tipo (Fogo, Água, Planta...).
class TypeChip extends StatelessWidget {
  final String type;

  /// Quando true, o chip fica translúcido para ser usado sobre fundos coloridos.
  final bool onColoredBackground;

  const TypeChip({
    super.key,
    required this.type,
    this.onColoredBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = PokemonTypeStyle.of(type);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: onColoredBackground
            ? Colors.white.withValues(alpha: 0.28)
            : style.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        style.label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
