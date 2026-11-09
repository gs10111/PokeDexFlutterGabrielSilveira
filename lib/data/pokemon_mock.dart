import '../models/pokemon.dart';

/// Dados ESTÁTICOS usados para construir e testar o design
/// antes de existir qualquer chamada de rede.
///
/// Os campos seguem exatamente o formato que a PokéAPI devolve
/// (tipos e status em inglês, altura em decímetros, peso em hectogramas),
/// assim a troca para a API na Etapa 3 não exige mudar as telas.
const List<Pokemon> pokemonMock = [
  Pokemon(
    id: 1,
    name: 'bulbasaur',
    types: ['grass', 'poison'],
    height: 7,
    weight: 69,
    abilities: ['overgrow', 'chlorophyll'],
    stats: {
      'hp': 45,
      'attack': 49,
      'defense': 49,
      'special-attack': 65,
      'special-defense': 65,
      'speed': 45,
    },
    description:
        'Carrega uma semente nas costas desde que nasce. A semente cresce '
        'junto com ele, absorvendo a luz do sol.',
  ),
  Pokemon(
    id: 4,
    name: 'charmander',
    types: ['fire'],
    height: 6,
    weight: 85,
    abilities: ['blaze', 'solar-power'],
    stats: {
      'hp': 39,
      'attack': 52,
      'defense': 43,
      'special-attack': 60,
      'special-defense': 50,
      'speed': 65,
    },
    description:
        'A chama na ponta da cauda mostra como ele está se sentindo: '
        'quanto mais animado, mais forte ela queima.',
  ),
  Pokemon(
    id: 7,
    name: 'squirtle',
    types: ['water'],
    height: 5,
    weight: 90,
    abilities: ['torrent', 'rain-dish'],
    stats: {
      'hp': 44,
      'attack': 48,
      'defense': 65,
      'special-attack': 50,
      'special-defense': 64,
      'speed': 43,
    },
    description:
        'Recolhe-se no casco para se proteger e contra-ataca com jatos de '
        'água sempre que surge uma oportunidade.',
  ),
  Pokemon(
    id: 25,
    name: 'pikachu',
    types: ['electric'],
    height: 4,
    weight: 60,
    abilities: ['static', 'lightning-rod'],
    stats: {
      'hp': 35,
      'attack': 55,
      'defense': 40,
      'special-attack': 50,
      'special-defense': 50,
      'speed': 90,
    },
    description:
        'Guarda eletricidade nas bochechas. Quando se sente ameaçado, '
        'descarrega tudo de uma vez.',
  ),
  Pokemon(
    id: 39,
    name: 'jigglypuff',
    types: ['normal', 'fairy'],
    height: 5,
    weight: 55,
    abilities: ['cute-charm', 'competitive', 'friend-guard'],
    stats: {
      'hp': 115,
      'attack': 45,
      'defense': 20,
      'special-attack': 45,
      'special-defense': 25,
      'speed': 20,
    },
    description:
        'Sua canção faz qualquer um dormir. Fica bravo quando a plateia '
        'cochila antes do fim da música.',
  ),
  Pokemon(
    id: 52,
    name: 'meowth',
    types: ['normal'],
    height: 4,
    weight: 42,
    abilities: ['pickup', 'technician', 'unnerve'],
    stats: {
      'hp': 40,
      'attack': 45,
      'defense': 35,
      'special-attack': 40,
      'special-defense': 40,
      'speed': 90,
    },
    description:
        'Adora objetos redondos e brilhantes. Passeia à noite procurando '
        'moedas perdidas.',
  ),
  Pokemon(
    id: 54,
    name: 'psyduck',
    types: ['water'],
    height: 8,
    weight: 196,
    abilities: ['damp', 'cloud-nine', 'swift-swim'],
    stats: {
      'hp': 50,
      'attack': 52,
      'defense': 48,
      'special-attack': 65,
      'special-defense': 50,
      'speed': 55,
    },
    description:
        'Vive com dor de cabeça. Quando ela piora, libera poderes '
        'psíquicos que nem ele entende.',
  ),
  Pokemon(
    id: 94,
    name: 'gengar',
    types: ['ghost', 'poison'],
    height: 15,
    weight: 405,
    abilities: ['cursed-body'],
    stats: {
      'hp': 60,
      'attack': 65,
      'defense': 60,
      'special-attack': 130,
      'special-defense': 75,
      'speed': 110,
    },
    description:
        'Esconde-se nas sombras. Dizem que a sensação de frio repentino '
        'é sinal de que um Gengar está por perto.',
  ),
  Pokemon(
    id: 133,
    name: 'eevee',
    types: ['normal'],
    height: 3,
    weight: 65,
    abilities: ['run-away', 'adaptability', 'anticipation'],
    stats: {
      'hp': 55,
      'attack': 55,
      'defense': 50,
      'special-attack': 45,
      'special-defense': 65,
      'speed': 55,
    },
    description:
        'Seu código genético é instável: pode evoluir de muitas formas '
        'diferentes, dependendo do ambiente.',
  ),
  Pokemon(
    id: 143,
    name: 'snorlax',
    types: ['normal'],
    height: 21,
    weight: 4600,
    abilities: ['immunity', 'thick-fat', 'gluttony'],
    stats: {
      'hp': 160,
      'attack': 110,
      'defense': 65,
      'special-attack': 65,
      'special-defense': 110,
      'speed': 30,
    },
    description:
        'Só acorda para comer. Depois de uma refeição enorme, volta a '
        'dormir no meio do caminho.',
  ),
  Pokemon(
    id: 149,
    name: 'dragonite',
    types: ['dragon', 'flying'],
    height: 22,
    weight: 2100,
    abilities: ['inner-focus', 'multiscale'],
    stats: {
      'hp': 91,
      'attack': 134,
      'defense': 95,
      'special-attack': 100,
      'special-defense': 100,
      'speed': 80,
    },
    description:
        'Apesar do tamanho, é gentil e voa mais rápido que o vento '
        'para ajudar quem está perdido no mar.',
  ),
  Pokemon(
    id: 150,
    name: 'mewtwo',
    types: ['psychic'],
    height: 20,
    weight: 1220,
    abilities: ['pressure', 'unnerve'],
    stats: {
      'hp': 106,
      'attack': 110,
      'defense': 90,
      'special-attack': 154,
      'special-defense': 90,
      'speed': 130,
    },
    description:
        'Criado em laboratório a partir de pesquisas genéticas. Tem um '
        'poder psíquico enorme e pouca paciência.',
  ),
];
