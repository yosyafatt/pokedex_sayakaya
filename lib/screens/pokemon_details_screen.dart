import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokemonapp_sayakaya/models/pokemon.dart';
import 'package:pokemonapp_sayakaya/screens/widgets/pokemon_grid_item.dart';
import 'package:pokemonapp_sayakaya/utils/sizeconfig.dart';
import '../utils/constanst.dart';

class PokemonDetailScreen extends StatelessWidget {
  final id;

  PokemonDetailScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: kToolbarHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Image.asset(
              'assets/logo.png',
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Query(
          options: QueryOptions(
              document: gql(kSinglePokemonQuery), variables: {'id': id}),
          builder: (result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Center(child: Text('Can\'t retrieve data'));
            } else if (result.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final pokemon = Pokemon.fromJson(result.data['pokemon']);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 20),
                                decoration: ShapeDecoration(
                                  color:
                                      pokemonColor(type: pokemon.types.first),
                                  shape: StadiumBorder(),
                                ),
                                child: Text(
                                  '${pokemon.name}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: propWidth(28),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              SizedBox(width: propWidth(12)),
                              Container(
                                child: Text(
                                  '#${pokemon.number}',
                                  style: TextStyle(fontSize: propWidth(18)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: propHeight(24)),
                          Flexible(
                            child: Image.network(
                              '${pokemon.image}',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(36),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            offset: Offset(0, -5),
                            blurRadius: 10,
                            spreadRadius: -2,
                          )
                        ],
                      ),
                      child: DefaultTabController(
                        length: 4,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 24,
                              ),
                              child: TabBar(
                                labelColor: Colors.grey.shade900,
                                labelPadding: EdgeInsets.zero,
                                indicatorColor:
                                    pokemonColor(type: pokemon.types.first),
                                indicatorSize: TabBarIndicatorSize.tab,
                                unselectedLabelColor: Colors.black45,
                                tabs: [
                                  Tab(text: 'About'),
                                  Tab(text: 'Stats'),
                                  Tab(text: 'Evolution'),
                                  Tab(text: 'Moves'),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 18),
                                child: TabBarView(
                                  children: [
                                    SingleChildScrollView(
                                      child: Container(
                                        child: Column(
                                          children: [
                                            ListInfo(
                                              title: 'Classification',
                                              text: pokemon.classification,
                                            ),
                                            ListInfo(
                                              title: 'Height',
                                              text:
                                                  '${pokemon.height.minimum} - ${pokemon.height.maximum}',
                                            ),
                                            ListInfo(
                                              title: 'Weight',
                                              text:
                                                  '${pokemon.weight.minimum} - ${pokemon.weight.maximum}',
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      'Types',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: Colors
                                                            .grey.shade500,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Wrap(
                                                      runSpacing: 8,
                                                      spacing: 8,
                                                      children: [
                                                        for (var type
                                                            in pokemon.types)
                                                          Chip(
                                                            label: Text(
                                                              type,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            backgroundColor:
                                                                pokemonColor(
                                                                    type: type),
                                                          )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Container(
                                        child: Column(
                                          children: [
                                            ListInfo(
                                              title: 'Max HP',
                                              text: '${pokemon.maxHP}',
                                            ),
                                            ListInfo(
                                              title: 'Max CP',
                                              text: '${pokemon.maxCP}',
                                            ),
                                            ListInfo(
                                              title: 'Flee rate',
                                              text:
                                                  '${(pokemon.fleeRate * 100).toStringAsFixed(1)}%',
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 16),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.baseline,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      'Weakness',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: Colors
                                                            .grey.shade500,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Wrap(
                                                      spacing: 8,
                                                      runSpacing: -8,
                                                      children: [
                                                        for (var weak in pokemon
                                                            .weaknesses)
                                                          Chip(
                                                            label: Text(
                                                              weak,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            backgroundColor:
                                                                pokemonColor(
                                                                    type: weak),
                                                          )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 16),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.baseline,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      'Resistant',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: Colors
                                                            .grey.shade500,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Wrap(
                                                      spacing: 8,
                                                      runSpacing: -8,
                                                      children: [
                                                        for (var resist
                                                            in pokemon
                                                                .resistant)
                                                          Chip(
                                                            label: Text(
                                                              resist,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            backgroundColor:
                                                                pokemonColor(
                                                                    type:
                                                                        resist),
                                                          )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            EvolutionsInfo(pokemon: pokemon),
                                            SizedBox(height: propHeight(24)),
                                            EvolutionRequirementsInfo(
                                                pokemon: pokemon),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Container(
                                        child: Column(
                                          children: [
                                            ListView(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              children: [
                                                MovesType(
                                                  type: 'Primary',
                                                  pokemonName: pokemon.name,
                                                  attack: pokemon.attacks.fast,
                                                ),
                                                MovesType(
                                                  type: 'Special',
                                                  pokemonName: pokemon.name,
                                                  attack:
                                                      pokemon.attacks.special,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class MovesType extends StatelessWidget {
  const MovesType({
    Key key,
    @required this.type,
    @required this.attack,
    @required this.pokemonName,
  }) : super(key: key);

  final String type;
  final String pokemonName;
  final List<Skill> attack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$type Attack',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.grey.shade500,
          ),
        ),
        MovesHeaderList(
          firstColumn: 'ATK Type',
          secondColumn: 'Moves',
          thirdColumn: 'DMG',
        ),
        if (attack != null)
          for (var fast in attack) MovesList(moves: fast)
        else
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text('${pokemonName} has no moves'),
          ),
        SizedBox(height: propHeight(24))
      ],
    );
  }
}

class MovesHeaderList extends StatelessWidget {
  final String thirdColumn;

  final String firstColumn;

  final String secondColumn;

  const MovesHeaderList({
    Key key,
    @required this.thirdColumn,
    @required this.firstColumn,
    @required this.secondColumn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                '$firstColumn',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  '$secondColumn',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                '$thirdColumn',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovesList extends StatelessWidget {
  const MovesList({
    Key key,
    @required this.moves,
  }) : super(key: key);

  final Skill moves;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Chip(
            label: Text(
              moves.type,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: pokemonColor(type: moves.type),
          ),
        ),
        Expanded(
          flex: 5,
          child: Center(child: Text('${moves.name}')),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Text('${moves.damage}'),
          ),
        ),
      ],
    );
  }
}

class EvolutionRequirementsInfo extends StatelessWidget {
  const EvolutionRequirementsInfo({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Evolution Requirements',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.grey.shade500,
          ),
        ),
        if (pokemon.evolutionRequirements != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ListInfo(
                title: '${pokemon.evolutionRequirements.name}',
                text: '${pokemon.evolutionRequirements.amount}× candies'),
          )
        else
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 24,
            ),
            child: Text(
              '${pokemon.name} is no need to evolve',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 13,
              ),
            ),
          )
      ],
    );
  }
}

class EvolutionsInfo extends StatelessWidget {
  const EvolutionsInfo({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Evolutions',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.grey.shade500,
          ),
        ),
        if (pokemon.evolutions != null)
          Container(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 12),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: propWidth(18),
                mainAxisSpacing: propWidth(18),
              ),
              itemCount: pokemon.evolutions.length,
              itemBuilder: (context, i) {
                final p = pokemon.evolutions[i];

                return PokemonGridItem(
                  pokemon: PokemonInfo(
                    id: p.id,
                    image: p.image,
                    name: p.name,
                    number: p.number,
                    types: p.types,
                  ),
                );
              },
            ),
          )
        else
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 24,
            ),
            child: Text(
              '${pokemon.name} is the final pokemon evolutions',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 13,
              ),
            ),
          )
      ],
    );
  }
}

class ListInfo extends StatelessWidget {
  final String title;
  final String text;
  const ListInfo({
    Key key,
    @required this.title,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.grey.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
