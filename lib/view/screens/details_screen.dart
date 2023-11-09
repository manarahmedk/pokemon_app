import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/view/components/widgets/text_custom.dart';
import '../../model/pokemon_model.dart';
import '../../view_model/bloc/pokemon/pokemon_cubit.dart';
import '../../view_model/utils/colors.dart';


class DetailsScreen extends StatelessWidget {
  final Pokemon pokemon;
  const DetailsScreen({required this.pokemon,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: PokemonCubit.get(context)..getAllPokemons(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: AppColors.white,
          ),
          backgroundColor: Colors.blue,
          title: TextCustom(
            text: pokemon.name??"",
            color: Colors.white,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: BlocConsumer<PokemonCubit, PokemonState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                      top: 90,
                      bottom: 50,
                      right: 15,
                      left: 15,
                    ),
                    color: Colors.blue,
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.only(
                      top: 90,
                      bottom: 50,
                      right: 15,
                      left: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        TextCustom(
                          text: pokemon.name??"",
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextCustom(
                          text: 'Height : ${pokemon.height}',
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextCustom(
                          text: 'Weight : ${pokemon.weight}',
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const TextCustom(
                          text: 'Types',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: double.infinity,
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.orangeAccent,
                                ),
                                child: TextCustom(
                                  text: pokemon.type?[index]??"",
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(
                              width: 15,
                            ),
                            itemCount: pokemon.type?.length ?? 0,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const TextCustom(
                          text: 'Weakness',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.redAccent,
                                ),
                                child: TextCustom(
                                  text: pokemon.weaknesses?[index]??"",
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(
                              width: 15,
                            ),
                            itemCount: pokemon.weaknesses?.length ?? 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 38,
                    child: Hero(
                        tag: "tag-${pokemon.id}",
                      child: Image.network(
                        pokemon.img??"",
                        width: 100,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
