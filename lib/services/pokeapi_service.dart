// Acesso à PokéAPI: a ÚNICA classe do app que fala HTTP.
// As telas só pedem objetos Pokemon; URLs, HTTP e JSON ficam aqui.
//
// Documentação da API: https://pokeapi.co/docs/v2

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/pokemon.dart';

class PokeApiService {
  static const String baseUrl = 'https://pokeapi.co/api/v2';

  /// Tempo máximo de espera por resposta: sem isso, sem internet
  /// a tela poderia ficar carregando para sempre.
  static const Duration _timeout = Duration(seconds: 15);

  /// GET $baseUrl/pokemon/{idOuNome}
  Future<Pokemon> fetchPokemon(String idOrName) async {
    final uri = Uri.parse('$baseUrl/pokemon/$idOrName');
    final response = await http.get(uri).timeout(_timeout);

    if (response.statusCode != 200) {
      throw Exception('Erro ${response.statusCode} ao buscar $idOrName');
    }
    return Pokemon.fromJson(jsonDecode(response.body));
  }

  /// GET $baseUrl/pokemon?limit=151
  /// A resposta só traz nome + url; os detalhes de cada um vêm de
  /// fetchPokemon, todos em paralelo com Future.wait (a ordem é mantida).
  Future<List<Pokemon>> fetchPokedex({int limit = 151, int offset = 0}) async {
    final uri = Uri.parse('$baseUrl/pokemon?limit=$limit&offset=$offset');
    final response = await http.get(uri).timeout(_timeout);

    if (response.statusCode != 200) {
      throw Exception('Erro ${response.statusCode} ao buscar a Pokédex');
    }

    final results = jsonDecode(response.body)['results'] as List<dynamic>;
    return Future.wait([
      for (final r in results) fetchPokemon(r['name'] as String),
    ]);
  }

  /// GET $baseUrl/pokemon-species/{id}
  /// A descrição da Pokédex fica em "flavor_text_entries", uma lista com
  /// textos de vários jogos e idiomas (não há português); pegamos o primeiro
  /// em inglês.
  Future<String> fetchDescription(int id) async {
    final uri = Uri.parse('$baseUrl/pokemon-species/$id');
    final response = await http.get(uri).timeout(_timeout);

    if (response.statusCode != 200) {
      throw Exception('Erro ${response.statusCode} ao buscar a descrição');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final entries = json['flavor_text_entries'] as List<dynamic>;

    for (final entry in entries) {
      if (entry['language']['name'] == 'en') {
        // Os textos vêm com quebras de linha (\n) e de página (\f) do jogo
        // original; trocamos tudo por espaços.
        return (entry['flavor_text'] as String)
            .replaceAll(RegExp(r'[\n\f\r]+'), ' ')
            .trim();
      }
    }
    return 'Sem descrição.';
  }
}
