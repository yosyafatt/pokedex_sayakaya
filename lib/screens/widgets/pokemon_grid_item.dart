import 'package:flutter/material.dart';
import '../../models/pokemon.dart';
import '../../utils/constanst.dart';
import '../pokemon_details_screen.dart';

class PokemonGridItem extends StatelessWidget {
  const PokemonGridItem({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

  final PokemonInfo pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailScreen(id: pokemon.id),
          ),
        );
      },
      child: Container(
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
      ),
    );
  }
}
