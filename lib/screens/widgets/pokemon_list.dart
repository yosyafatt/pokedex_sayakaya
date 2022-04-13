import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../models/pokemon.dart';
import '../../utils/constanst.dart';
import './pokemon_grid_item.dart';

class PokemonListWidget extends StatefulWidget {
  const PokemonListWidget({Key key}) : super(key: key);
  @override
  _PokemonListWidgetState createState() => _PokemonListWidgetState();
}

class _PokemonListWidgetState extends State<PokemonListWidget> {
  final ScrollController _scrollController = ScrollController();
  int count = 20;
  dynamic _selectedChip = kPokemonTypes.length;

  void addPage() {
    setState(() {
      count = count + 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(document: gql(kPokemonsQuery), variables: {
        "count": count,
      }),
      builder: (result, {fetchMore, refetch}) {
        if (result.isLoading && result.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (result.hasException) {
          return Center(
            child: Text('Can\'t retrieve data '),
          );
        }
        final pokemons = PokemonList.fromJson(result.data).pokemons.where(
            (el) => _selectedChip != kPokemonTypes.length
                ? el.types.contains(kPokemonTypes[_selectedChip])
                : true);

        final opts = FetchMoreOptions(
          variables: {'count': count},
          updateQuery: (_, fetchMoreResultData) {
            return fetchMoreResultData;
          },
        );

        return NotificationListener<ScrollEndNotification>(
          onNotification: (notification) {
            print(notification.dragDetails.primaryVelocity);
            return true;
          },
          child: NotificationListener<ScrollEndNotification>(
            onNotification: (t) {
              if (_scrollController.offset >=
                  _scrollController.position.maxScrollExtent) {
                print('max , count : $count, data : ${pokemons.length}');
                if (count <= pokemons.length) {
                  print('fetched');
                  addPage();
                  fetchMore(opts);
                }
              }
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: kToolbarHeight,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Filter : ',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (var i = 0; i < kPokemonTypes.length; i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  child: ChoiceChip(
                                    label: Text('${kPokemonTypes[i]}'),
                                    selected: _selectedChip == i,
                                    onSelected: (selected) {
                                      setState(() {
                                        _selectedChip =
                                            selected ? i : kPokemonTypes.length;
                                      });
                                    },
                                    backgroundColor:
                                        pokemonColor(type: kPokemonTypes[i]),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GridView(
                    key: const PageStorageKey<String>('pokeGridKey'),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    controller: _scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    padding: EdgeInsets.all(12),
                    children: [
                      for (var pokemon in pokemons)
                        PokemonGridItem(pokemon: pokemon),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
