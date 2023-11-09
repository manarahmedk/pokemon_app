import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/view/components/widgets/text_custom.dart';
import 'package:poke_app/view/screens/details_screen.dart';
import '../../view_model/bloc/pokemon/pokemon_cubit.dart';
import '../../view_model/utils/navigation.dart';
import '../components/widgets/pokemon_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: PokemonCubit.get(context)
        ..getAllPokemons(),
      child: BlocConsumer<PokemonCubit, PokemonState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const TextCustom(
                text: "Poke App",
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                    childAspectRatio: 1 / 1,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      PokemonCubit.get(context).pokemons?.pokemon?.length??0,
                      (index) => PokemonWidget(
                        pokemon: PokemonCubit.get(context).pokemons!.pokemon![index],
                        onTap: () {
                           PokemonCubit.get(context).selectPokemon(index);
                           Navigation.push(context, DetailsScreen(pokemon: PokemonCubit.get(context).pokemons!.pokemon![index],));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
