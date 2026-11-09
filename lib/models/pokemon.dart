/// Modelo de dados de um Pokémon.
///
/// A MESMA classe atende às duas fontes de dados da aula:
///  * dados estáticos  -> construtor `const Pokemon(...)` (data/pokemon_mock.dart)
///  * dados da PokéAPI -> construtor de fábrica `Pokemon.fromJson(...)`
class Pokemon {
  final int id;
  final String name;
  final List<String> types;

  /// Altura em decímetros (unidade usada pela PokéAPI).
  final int height;

  /// Peso em hectogramas (unidade usada pela PokéAPI).
  final int weight;

  final List<String> abilities;

  /// Status base, ex.: {'hp': 35, 'attack': 55, ...}
  final Map<String, int> stats;

  /// Descrição curta. Nos dados estáticos já vem preenchida;
  /// na API ela vem de outro endpoint (pokemon-species), então pode ser null.
  final String? description;

  const Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.stats,
    this.description,
  });

  // ---------- Getters: dados derivados, calculados na hora ----------

  /// Arte oficial hospedada no repositório público de sprites da PokéAPI.
  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/'
      'sprites/pokemon/other/official-artwork/$id.png';

  /// Número no formato da Pokédex: 25 -> "#025".
  String get number => '#${id.toString().padLeft(3, '0')}';

  /// "pikachu" -> "Pikachu", "mr-mime" -> "Mr Mime".
  String get displayName => name
      .split('-')
      .map((part) => part[0].toUpperCase() + part.substring(1))
      .join(' ');

  String get primaryType => types.first;

  double get heightInMeters => height / 10;
  double get weightInKg => weight / 10;

  // ---------- Construtor de fábrica: JSON da API -> objeto Dart ----------

  // Converte a resposta de GET https://pokeapi.co/api/v2/pokemon/{id}
  // em um objeto Pokemon.
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      height: json['height'] as int,
      weight: json['weight'] as int,
      types: (json['types'] as List<dynamic>)
          .map((t) => t['type']['name'] as String)
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((t) => t['ability']['name'] as String)
          .toList(),
      stats: {
        for (final s in json['stats'] as List<dynamic>)
          s['stat']['name'] as String: s['base_stat'] as int,
      },
    );
  }
}
