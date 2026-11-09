import 'package:material_ui/material_ui.dart';

import 'screens/pokedex_screen.dart';
import 'theme/type_colors.dart';

void main() {
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp cria o Navigator: a "pilha" de telas do app.
    // A tela em `home` é a primeira rota da pilha.
    return MaterialApp(
      title: 'Pokédex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: pokedexRed),
      ),
      home: const PokedexScreen(),
    );
  }
}
