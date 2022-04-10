import 'dart:developer';

// import '../models/pokemon.dart';
import 'package:pokemonapp_sayakaya/models/pokemon.dart';

import '../utils/gql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Apis {
  String _q = '''
    query listPokemons(\$count : Int!)
    {
      pokemons(first: \$count){
        id
        number
        name
        weight {
          minimum
          maximum
        }
        height {
          minimum
          maximum
        }
        classification
        types
        resistant
        attacks {
          fast {
            name
            type
            damage
          }
          special {
            name
            type
            damage
          }
        }
        weaknesses
        fleeRate
        maxCP
        maxHP
        evolutions {
          id
        }
        evolutionRequirements {
          amount
          name
        }
        image
      }
    }
  ''';

  void listPokemons(int count) async {
    try {
      GraphQLConfig gqlConf = GraphQLConfig();
      GraphQLClient _cl = gqlConf.clientToQuery();
      // print('mau nembak');
      final QueryResult qres = await _cl.query(
        QueryOptions(document: gql(_q), variables: {
          "count": count,
        }),
      );

      if (!qres.hasException) {
        print(qres.data['pokemons'].toString());
        var res = List<Pokemon>();
        (qres.data['pokemons'] as List).forEach((pokemon) {
          res.add(Pokemon.fromJson(pokemon));
        });

        // inspect(res);
      }
      // inspect(qres);

      // inspect(res);
    } catch (e) {
      throw e;
    }
  }
}
