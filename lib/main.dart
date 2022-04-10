import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './utils/gql_config.dart';
import './screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();

  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<GraphQLClient> client = GraphQLConfig.gqlInit();
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        home: HomeScreen(),
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
