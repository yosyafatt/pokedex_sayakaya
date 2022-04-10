import 'package:flutter/material.dart';
import 'package:pokemonapp_sayakaya/utils/api.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
import '../utils/sizeconfig.dart';
// import '../utils/constanst.dart';
import '../widgets/pokemon_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // Apis api = Apis();
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(
        title: Image.asset(
          'assets/logo.png',
          height: propHeight(kToolbarHeight - 6),
        ),
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_list_rounded,
              color: Colors.grey.shade800,
            ),
            onPressed: () {
              // api.listPokemons(2);
            },
          ),
        ],
      ),
      // body: Container(),
      body: PokemonListWidget(),
    );
  }
}
