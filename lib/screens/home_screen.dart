import 'package:flutter/material.dart';
import '../utils/sizeconfig.dart';
import './widgets/pokemon_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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

      // body: Container(),
      body: PokemonListWidget(),
    );
  }
}
