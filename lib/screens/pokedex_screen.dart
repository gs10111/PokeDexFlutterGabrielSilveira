import 'package:material_ui/material_ui.dart';

import '../models/pokemon.dart';
import '../services/pokeapi_service.dart';
import '../theme/type_colors.dart';
import '../widgets/pokemon_card.dart';
import 'pokemon_detail_screen.dart';

/// TELA 1: grade com os Pokémon.
///
/// Os dados vêm da PokéAPI (Etapa 3) por meio de um FutureBuilder.
class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final _api = PokeApiService();

  /// A lista "que ainda vai chegar". Criada UMA vez, no initState().
  late Future<List<Pokemon>> _pokedexFuture;

  /// Ids dos Pokémon capturados (resultado devolvido pela Tela 2).
  final Set<int> _captured = {};

  @override
  void initState() {
    super.initState();
    _pokedexFuture = _api.fetchPokedex();
  }

  /// Botão "Tentar de novo": cria um Future novo e redesenha a tela.
  void _reload() {
    setState(() {
      _pokedexFuture = _api.fetchPokedex();
    });
  }

  Future<void> _openDetails(Pokemon pokemon) async {
    final captured = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => PokemonDetailScreen(pokemon: pokemon),
      ),
    );
    if (!mounted || captured != true) return;
    setState(() => _captured.add(pokemon.id));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${pokemon.displayName} foi capturado!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F6),
      appBar: AppBar(
        backgroundColor: pokedexRed,
        foregroundColor: Colors.white,
        title: const Text(
          'Pokédex',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.catching_pokemon),
                const SizedBox(width: 4),
                Text('${_captured.length}'),
              ],
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: _pokedexFuture,
        builder: (context, snapshot) {
          // 1) Carregando: a resposta ainda não chegou.
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2) Erro: sem internet, timeout, statusCode diferente de 200...
          if (snapshot.hasError) {
            return _ErrorView(
              message: '${snapshot.error}',
              onRetry: _reload,
            );
          }

          // 3) Dados prontos: a mesma grade da versão estática.
          final pokemons = snapshot.data!;
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              final pokemon = pokemons[index];
              return PokemonCard(
                key: ValueKey(pokemon.id),
                pokemon: pokemon,
                isCaptured: _captured.contains(pokemon.id),
                onTap: () => _openDetails(pokemon),
              );
            },
          );
        },
      ),
    );
  }
}

/// Tela de erro com o botão "Tentar de novo".
class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off, size: 48, color: Colors.grey),
            const SizedBox(height: 12),
            const Text(
              'Não foi possível carregar a Pokédex.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Tentar de novo'),
            ),
          ],
        ),
      ),
    );
  }
}
