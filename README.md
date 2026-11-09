# Pokédex em Flutter — código base do aluno

Aula LabDAMD (PUC Minas • ICEI): **navegação entre duas telas** e **consumo de API externa** (PokéAPI).

O design está pronto e funciona com **dados estáticos** (`lib/data/pokemon_mock.dart`).
Seu trabalho é completar os `TODO`s, etapa por etapa.

## Como rodar

```bash
flutter create pokedex
cd pokedex
# copie para dentro do projeto: lib/, pubspec.yaml e analysis_options.yaml deste pacote
rm test/widget_test.dart        # o teste padrão procura MyApp, que não existe aqui
flutter pub get
flutter run
```

## Estrutura

```
lib/
├── main.dart                     MaterialApp (cria o Navigator)
├── models/pokemon.dart           classe Pokemon (dados + getters)
├── data/pokemon_mock.dart        12 Pokémon estáticos
├── services/pokeapi_service.dart acesso à PokéAPI (a implementar)
├── theme/type_colors.dart        cor e nome em PT de cada tipo
├── screens/
│   ├── pokedex_screen.dart       TELA 1: grade de Pokémon
│   └── pokemon_detail_screen.dart TELA 2: detalhes
└── widgets/                      PokemonCard, TypeChip, StatBar
```

## Etapas

| Etapa | O que fazer | Onde |
|---|---|---|
| 1 | Abrir a Tela 2 ao tocar no card, enviando o `Pokemon` (`Navigator.push` + `MaterialPageRoute`) | `pokedex_screen.dart` → `_openDetails` |
| 2 | Botão **Capturar!** fecha a Tela 2 devolvendo `true` (`Navigator.pop(context, true)`); a Tela 1 recebe com `await`, atualiza `_captured` com `setState` e mostra um `SnackBar` | as duas telas |
| 3 | `flutter pub add http`, criar `Pokemon.fromJson`, implementar `fetchPokemon`/`fetchPokedex` e trocar a lista estática por um `FutureBuilder` | `pokemon.dart`, `pokeapi_service.dart`, `pokedex_screen.dart` |
| 4 | Buscar a descrição em `/pokemon-species/{id}` na Tela 2 com seu próprio `FutureBuilder` | `pokemon_detail_screen.dart` |
| Desafio | Busca por nome, `RefreshIndicator`, tela de erro com "Tentar de novo" | — |

## Permissão de internet

* **Android:** em modo debug já funciona. Para build de release, adicione em
  `android/app/src/main/AndroidManifest.xml`, antes de `<application>`:
  `<uses-permission android:name="android.permission.INTERNET"/>`
* **macOS (desktop):** adicione `com.apple.security.network.client` = `true`
  em `macos/Runner/DebugProfile.entitlements` e `Release.entitlements`.

## Sobre `material_ui`

Desde agosto de 2026 o Material Design é publicado como pacote no pub.dev (`material_ui`),
idêntico ao `package:flutter/material.dart`. Se o seu SDK for mais antigo, troque o import
`package:material_ui/material_ui.dart` por `package:flutter/material.dart` e remova a dependência.

PokéAPI: https://pokeapi.co/docs/v2 — Pokémon e seus nomes são marcas de Nintendo/Game Freak/Creatures; uso apenas educacional.
