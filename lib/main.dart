import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/view/screens/home_screen.dart';
import 'package:poke_app/view_model/bloc/observer.dart';
import 'package:poke_app/view_model/bloc/pokemon/pokemon_cubit.dart';
import 'package:poke_app/view_model/data/local/shared_prefernce.dart';
import 'package:poke_app/view_model/data/network/dio_helper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  await LocalData.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>PokemonCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

