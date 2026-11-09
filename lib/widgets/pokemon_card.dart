import 'package:material_ui/material_ui.dart';

import '../models/pokemon.dart';
import '../theme/type_colors.dart';
import 'type_chip.dart';

/// Card da grade da Pokédex (Tela 1).
///
/// O card NÃO sabe navegar: ele só avisa o pai que foi tocado, via [onTap].
/// Quem decide o que acontece (abrir a Tela 2) é a tela que contém a grade.
class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback? onTap;
  final bool isCaptured;

  const PokemonCard({
    super.key,
    required this.pokemon,
    this.onTap,
    this.isCaptured = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = PokemonTypeStyle.of(pokemon.primaryType).color;

    return Material(
      color: color,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            // Pokébola decorativa no canto (só formas, sem imagem externa).
            Positioned(
              right: -24,
              bottom: -24,
              child: Icon(
                Icons.catching_pokemon,
                size: 120,
                color: Colors.white.withValues(alpha: 0.18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        pokemon.number,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      if (isCaptured)
                        const Icon(Icons.catching_pokemon,
                            color: Colors.white, size: 20),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      // Hero: mesma tag na Tela 1 e na Tela 2 = imagem "voa"
                      // entre as telas durante a navegação.
                      child: Hero(
                        tag: 'pokemon-${pokemon.id}',
                        child: Image.network(
                          pokemon.imageUrl,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.image_not_supported,
                            color: Colors.white,
                            size: 48,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    pokemon.displayName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      for (final type in pokemon.types)
                        TypeChip(type: type, onColoredBackground: true),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
