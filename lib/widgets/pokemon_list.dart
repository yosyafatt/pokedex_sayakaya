import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokemonapp_sayakaya/models/pokemon.dart';
import './../utils/constanst.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(document: gql(kPokemonsQuery), variables: {
        "count": 20,
      }),
      builder: (result, {fetchMore, refetch}) {
        if (result.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (result.hasException) {
          return Center(
            child: Text('Can\'t retrieve data '),
          );
        } else {
          final List pokemons = result.data['pokemons'];
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: pokemons.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (_, i) {
              final Pokemon pokemon = Pokemon.fromJson(pokemons[i]);
              return Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: pokemonColor(type: pokemon.types.first),
                      width: 2,
                    ),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      alignment: Alignment.center,
                      child: Text(
                        '#${pokemon.number}',
                        style: TextStyle(
                          color: pokemonColor(type: pokemon.types.first),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(pokemon.image),
                        ),
                      ),
                    ),
                    Container(
                      color: pokemonColor(type: pokemon.types.first),
                      padding: const EdgeInsets.all(6.0),
                      alignment: Alignment.center,
                      child: Text(
                        '${pokemon.name}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
