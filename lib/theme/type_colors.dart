import 'package:material_ui/material_ui.dart';

/// Cor e nome em português de cada tipo de Pokémon.
///
/// A PokéAPI devolve os tipos em inglês ("fire", "water"...),
/// por isso guardamos aqui a tradução e a cor usada na interface.
class PokemonTypeStyle {
  final String label;
  final Color color;

  const PokemonTypeStyle(this.label, this.color);

  static const Map<String, PokemonTypeStyle> _styles = {
    'normal': PokemonTypeStyle('Normal', Color(0xFFA8A77A)),
    'fire': PokemonTypeStyle('Fogo', Color(0xFFEE8130)),
    'water': PokemonTypeStyle('Água', Color(0xFF6390F0)),
    'electric': PokemonTypeStyle('Elétrico', Color(0xFFE0B000)),
    'grass': PokemonTypeStyle('Planta', Color(0xFF7AC74C)),
    'ice': PokemonTypeStyle('Gelo', Color(0xFF6CC7C3)),
    'fighting': PokemonTypeStyle('Lutador', Color(0xFFC22E28)),
    'poison': PokemonTypeStyle('Venenoso', Color(0xFFA33EA1)),
    'ground': PokemonTypeStyle('Terrestre', Color(0xFFD4A84A)),
    'flying': PokemonTypeStyle('Voador', Color(0xFF9A80EE)),
    'psychic': PokemonTypeStyle('Psíquico', Color(0xFFF95587)),
    'bug': PokemonTypeStyle('Inseto', Color(0xFFA6B91A)),
    'rock': PokemonTypeStyle('Pedra', Color(0xFFB6A136)),
    'ghost': PokemonTypeStyle('Fantasma', Color(0xFF735797)),
    'dragon': PokemonTypeStyle('Dragão', Color(0xFF6F35FC)),
    'dark': PokemonTypeStyle('Sombrio', Color(0xFF705746)),
    'steel': PokemonTypeStyle('Aço', Color(0xFF9A9AB5)),
    'fairy': PokemonTypeStyle('Fada', Color(0xFFD685AD)),
  };

  /// Retorna o estilo do tipo; se o tipo for desconhecido, usa um cinza.
  static PokemonTypeStyle of(String type) =>
      _styles[type] ?? PokemonTypeStyle(type, const Color(0xFF9E9E9E));
}

/// Nome amigável (em português) de cada status devolvido pela PokéAPI.
const Map<String, String> statLabels = {
  'hp': 'HP',
  'attack': 'Ataque',
  'defense': 'Defesa',
  'special-attack': 'At. Esp.',
  'special-defense': 'Def. Esp.',
  'speed': 'Velocidade',
};

/// Vermelho clássico da Pokédex, usado como cor-semente do tema.
const Color pokedexRed = Color(0xFFDC0A2D);
